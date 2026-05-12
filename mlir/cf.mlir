module {
  func.func @matmul(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c1 : memref<?x?xf32>
    %c0_2 = arith.constant 0 : index
    %c1_3 = arith.constant 1 : index
    cf.br ^bb1(%c0_2 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb8
    %1 = arith.cmpi slt, %0, %dim : index
    cf.cond_br %1, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    %c0_4 = arith.constant 0 : index
    %c1_5 = arith.constant 1 : index
    cf.br ^bb3(%c0_4 : index)
  ^bb3(%2: index):  // 2 preds: ^bb2, ^bb7
    %3 = arith.cmpi slt, %2, %dim_1 : index
    cf.cond_br %3, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    %c0_6 = arith.constant 0 : index
    %c1_7 = arith.constant 1 : index
    cf.br ^bb5(%c0_6 : index)
  ^bb5(%4: index):  // 2 preds: ^bb4, ^bb6
    %5 = arith.cmpi slt, %4, %dim_0 : index
    cf.cond_br %5, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %6 = memref.load %arg0[%0, %4] : memref<?x?xf32>
    %7 = memref.load %arg1[%4, %2] : memref<?x?xf32>
    %8 = memref.load %arg2[%0, %2] : memref<?x?xf32>
    %9 = arith.mulf %6, %7 : f32
    %10 = arith.addf %8, %9 : f32
    memref.store %10, %arg2[%0, %2] : memref<?x?xf32>
    %11 = arith.addi %4, %c1_7 : index
    cf.br ^bb5(%11 : index)
  ^bb7:  // pred: ^bb5
    %12 = arith.addi %2, %c1_5 : index
    cf.br ^bb3(%12 : index)
  ^bb8:  // pred: ^bb3
    %13 = arith.addi %0, %c1_3 : index
    cf.br ^bb1(%13 : index)
  ^bb9:  // pred: ^bb1
    return
  }
}

