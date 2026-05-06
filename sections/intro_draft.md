# Introduction

### Hook outline:
From climate modeling to drug discovery, high-performance computing underpins some of the most consequential scientific work of our time. With the rapid rise of AI and machine learning, demand for raw compute has accelerated further still, training and inference workloads now rival traditional HPC simulations in scale and complexity. Yet the software written to run on this infrastructure remains stubbornly difficult to write, maintain, and port across hardware.

### Transition from hook into issue (concretization of issue):
HPC development is bottlenecked by two independent problems:
HPC software is written twice: once in Python for productivity, and again in C++
or CUDA for performance.
Even after that, we are locked into one GPU vendor.
 - No existing solution adresses both of these issues, we will disucss Julia SYCL Kokkos and OpenCL.

### what exactly is the language split issue
HPC code is often prototyped in Python, then rewritten in C++ or CUDA for performance. For example NumPy itself is little more than a Python interface over hand-optimized C extensions.

### what exactly is the vendor lock in issue
CUDA code only runs on NVIDIA. As AMD (ROCm), Intel (oneAPI), and others grow in HPC clusters, portability becomes a real operational problem. Porting is expensive and often incomplete.

### what is the gap?
Existing solutions address one or the other: Julia eliminates the language split but remains vendor-dependent, while Kokkos and SYCL offer portability but stay within the C++ ecosystem.

### what is the motivation to solve this
Solving both problems simultaneously would allow HPC developers to write portable, high-performance code in a single high-level language lowering the expertise barrier, enabling heterogeneous hardware configurations, and accelerating the path from prototype to production.

Mojo builds on MLIR an abstraction of LLVM ir, to itervley specialize hardware instructions.
Mojo, built on MLIR, is the first credible candidate to solv eboth issues. [@lattnerMLIRCompilerInfrastructure2020]
with this we arrempt to solve both issues by writing pythonic hardware agnostic code that can be compiled inteliggently to hardware spicific instructions.

