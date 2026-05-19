from std.math import ceildiv
from std.sys import has_accelerator
from std.gpu.host import DeviceContext
from std.gpu import block_dim, block_idx, thread_idx
from layout import TileTensor, row_major

comptime dtype     = DType.float32
comptime N         = 1024
comptime tile      = 16
comptime layout    = row_major[N * N]()
comptime num_tiles = ceildiv(N, tile)

def matmul_kernel(
    C: TileTensor[dtype, type_of(layout), MutAnyOrigin],
    A: TileTensor[dtype, type_of(layout), MutAnyOrigin],
    B: TileTensor[dtype, type_of(layout), MutAnyOrigin],
):
    var row = block_idx.y * block_dim.y + thread_idx.y
    var col = block_idx.x * block_dim.x + thread_idx.x
    if row < N and col < N:
        var acc = Scalar[dtype](0)
        for k in range(N):
            acc += A[row * N + k] * B[k * N + col]
        C[row * N + col] = acc

def main() raises:
    comptime if not has_accelerator():
        print("No compatible GPU found")
    else:
        ctx = DeviceContext()
        a_host = ctx.enqueue_create_host_buffer[dtype](N * N)
        b_host = ctx.enqueue_create_host_buffer[dtype](N * N)
        ctx.synchronize()
        for i in range(N * N):
            a_host[i] = Float32(1.0)
            b_host[i] = Float32(1.0)
        a_dev = ctx.enqueue_create_buffer[dtype](N * N)
        b_dev = ctx.enqueue_create_buffer[dtype](N * N)
        c_dev = ctx.enqueue_create_buffer[dtype](N * N)
        ctx.enqueue_copy(dst_buf=a_dev, src_buf=a_host)
        ctx.enqueue_copy(dst_buf=b_dev, src_buf=b_host)
        A = TileTensor(a_dev, layout)
        B = TileTensor(b_dev, layout)
        C = TileTensor(c_dev, layout)
        ctx.enqueue_function[matmul_kernel, matmul_kernel](
            C, A, B,
            grid_dim=(num_tiles, num_tiles),
            block_dim=(tile, tile),
        )
        c_host = ctx.enqueue_create_host_buffer[dtype](N * N)
        ctx.enqueue_copy(dst_buf=c_host, src_buf=c_dev)
        ctx.synchronize()
        print("C[0,0] =", c_host[0])
        print("C[0,1] =", c_host[1])
        print("C[1,0] =", c_host[N])
        print("Expected:", N)
