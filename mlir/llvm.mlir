module {
  llvm.func @matmul(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: !llvm.ptr, %arg8: !llvm.ptr, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: !llvm.ptr, %arg15: !llvm.ptr, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: i64) {
    %0 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg14, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg15, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg16, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg17, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg19, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg18, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg20, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = builtin.unrealized_conversion_cast %7 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<?x?xf32>
    %9 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %10 = llvm.insertvalue %arg7, %9[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg8, %10[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg9, %11[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg10, %12[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg12, %13[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg11, %14[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg13, %15[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = builtin.unrealized_conversion_cast %16 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<?x?xf32>
    %18 = llvm.mlir.poison : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %19 = llvm.insertvalue %arg0, %18[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.insertvalue %arg1, %19[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.insertvalue %arg2, %20[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.insertvalue %arg3, %21[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %arg5, %22[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.insertvalue %arg4, %23[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.insertvalue %arg6, %24[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = builtin.unrealized_conversion_cast %25 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<?x?xf32>
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = builtin.unrealized_conversion_cast %27 : i64 to index
    %29 = llvm.mlir.constant(0 : index) : i64
    %30 = builtin.unrealized_conversion_cast %29 : i64 to index
    %31 = llvm.mlir.constant(1 : index) : i64
    %32 = llvm.extractvalue %25[3] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.alloca %31 x !llvm.array<2 x i64> : (i64) -> !llvm.ptr
    llvm.store %32, %33 : !llvm.array<2 x i64>, !llvm.ptr
    %34 = llvm.getelementptr %33[0, %29] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<2 x i64>
    %35 = llvm.load %34 : !llvm.ptr -> i64
    %36 = builtin.unrealized_conversion_cast %35 : i64 to index
    %37 = builtin.unrealized_conversion_cast %36 : index to i64
    %38 = llvm.mlir.constant(1 : index) : i64
    %39 = llvm.extractvalue %25[3] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.alloca %38 x !llvm.array<2 x i64> : (i64) -> !llvm.ptr
    llvm.store %39, %40 : !llvm.array<2 x i64>, !llvm.ptr
    %41 = llvm.getelementptr %40[0, %27] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<2 x i64>
    %42 = llvm.load %41 : !llvm.ptr -> i64
    %43 = builtin.unrealized_conversion_cast %42 : i64 to index
    %44 = builtin.unrealized_conversion_cast %43 : index to i64
    %45 = llvm.mlir.constant(1 : index) : i64
    %46 = llvm.extractvalue %16[3] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.alloca %45 x !llvm.array<2 x i64> : (i64) -> !llvm.ptr
    llvm.store %46, %47 : !llvm.array<2 x i64>, !llvm.ptr
    %48 = llvm.getelementptr %47[0, %27] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<2 x i64>
    %49 = llvm.load %48 : !llvm.ptr -> i64
    %50 = builtin.unrealized_conversion_cast %49 : i64 to index
    %51 = builtin.unrealized_conversion_cast %50 : index to i64
    %52 = llvm.mlir.constant(0 : index) : i64
    %53 = builtin.unrealized_conversion_cast %52 : i64 to index
    %54 = llvm.mlir.constant(1 : index) : i64
    cf.br ^bb1(%53 : index)
  ^bb1(%55: index):  // 2 preds: ^bb0, ^bb8
    %56 = builtin.unrealized_conversion_cast %55 : index to i64
    %57 = builtin.unrealized_conversion_cast %55 : index to i64
    %58 = llvm.icmp "slt" %57, %37 : i64
    cf.cond_br %58, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    %59 = llvm.mlir.constant(0 : index) : i64
    %60 = builtin.unrealized_conversion_cast %59 : i64 to index
    %61 = llvm.mlir.constant(1 : index) : i64
    cf.br ^bb3(%60 : index)
  ^bb3(%62: index):  // 2 preds: ^bb2, ^bb7
    %63 = builtin.unrealized_conversion_cast %62 : index to i64
    %64 = builtin.unrealized_conversion_cast %62 : index to i64
    %65 = llvm.icmp "slt" %64, %51 : i64
    cf.cond_br %65, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    %66 = llvm.mlir.constant(0 : index) : i64
    %67 = builtin.unrealized_conversion_cast %66 : i64 to index
    %68 = llvm.mlir.constant(1 : index) : i64
    cf.br ^bb5(%67 : index)
  ^bb5(%69: index):  // 2 preds: ^bb4, ^bb6
    %70 = builtin.unrealized_conversion_cast %69 : index to i64
    %71 = builtin.unrealized_conversion_cast %69 : index to i64
    %72 = llvm.icmp "slt" %71, %44 : i64
    cf.cond_br %72, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %73 = llvm.extractvalue %25[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %74 = llvm.extractvalue %25[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %75 = llvm.mul %56, %74 overflow<nsw, nuw> : i64
    %76 = llvm.add %75, %70 overflow<nsw, nuw> : i64
    %77 = llvm.getelementptr inbounds|nuw %73[%76] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %78 = llvm.load %77 : !llvm.ptr -> f32
    %79 = llvm.extractvalue %16[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %80 = llvm.extractvalue %16[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %81 = llvm.mul %70, %80 overflow<nsw, nuw> : i64
    %82 = llvm.add %81, %63 overflow<nsw, nuw> : i64
    %83 = llvm.getelementptr inbounds|nuw %79[%82] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %84 = llvm.load %83 : !llvm.ptr -> f32
    %85 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %86 = llvm.extractvalue %7[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %87 = llvm.mul %56, %86 overflow<nsw, nuw> : i64
    %88 = llvm.add %87, %63 overflow<nsw, nuw> : i64
    %89 = llvm.getelementptr inbounds|nuw %85[%88] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %90 = llvm.load %89 : !llvm.ptr -> f32
    %91 = llvm.fmul %78, %84 : f32
    %92 = llvm.fadd %90, %91 : f32
    %93 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %94 = llvm.extractvalue %7[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %95 = llvm.mul %56, %94 overflow<nsw, nuw> : i64
    %96 = llvm.add %95, %63 overflow<nsw, nuw> : i64
    %97 = llvm.getelementptr inbounds|nuw %93[%96] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %92, %97 : f32, !llvm.ptr
    %98 = llvm.add %71, %68 : i64
    %99 = builtin.unrealized_conversion_cast %98 : i64 to index
    cf.br ^bb5(%99 : index)
  ^bb7:  // pred: ^bb5
    %100 = llvm.add %64, %61 : i64
    %101 = builtin.unrealized_conversion_cast %100 : i64 to index
    cf.br ^bb3(%101 : index)
  ^bb8:  // pred: ^bb3
    %102 = llvm.add %57, %54 : i64
    %103 = builtin.unrealized_conversion_cast %102 : i64 to index
    cf.br ^bb1(%103 : index)
  ^bb9:  // pred: ^bb1
    llvm.return
  }
}

