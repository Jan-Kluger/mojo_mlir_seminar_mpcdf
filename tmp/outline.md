Title (draft): Mojo on MLIR for HPC - solving lang split and vendor lock in (+ benchamrk)
(title can change alot)

abstract (TODO later)

introduction
- motivation
  - two lang split
  - vendor lock in

background
- what is the lang split
- what is the vendor problem
- What is LLVM IR

prior work (alternatives to mojo) (address lang split and vendor lock in)
- julia vs mojo.
  - adresses lang split issue - leaves vendor
- kokkos v mojo.
  - vice versa

mlir -> mojo (possible solution to addessed issues)
- use cases of mlir.
- How do we build a language on MLIR
- What is the benefit of building on MLIR

mojo -> HPC (soles lang split and and vendor)
- (?) (reliablility)
- mojos python dna and extensions
- benefits
  - adress how we solve lang split
  - adress how we solve vendor lock in
- HPC applications of mojo
- Single node level portability benefit
- ...

benchmarking
- Mojo for hpc vs cuda (or HIP)
  - run some dummy program for benchamrking, idk yet?
  - is self benchamrking even in scope for the seminar? (would be really cool)
    - [maybe both?]
- paper benchmarking or own results
- Evaluation subsec
  - perf evaluation.
  - programming "ergonomics" evaluation. [lang split and vendor unlock comment]
- possible iss

discussion 
- drawbacks of being vendor agnostic.
  - stilll difficult to get full performance 
    - good perf requires "difficult" concepts (especially since were targeting python), compiletime metaprogramming.
  - rely on benchamrking results
  - are benefits substantial?
- Ease of writing
  - is it really as easy as python and with perf benfit. is it too good to be true?
- portability benefits and drawbacks.

future outlook
- mojo is still pre 1.0
- mojo as it matures.
  - hopefully open src 
  - maturing ecosystem may come out

----------

[TODO] citing papers.
(9-10 papers?)
general llvm/background/foundation
- LLVM paper
- MLIR paper
- two-language problem
- (?) (perhaps kokkos/sycl/cuda/hip)

framework + port (to frame mojo solving both)
- kokkos paper
- julia paper

mojo banchmarks
- benchmark paper 1 (i think there was another one)
- benchmark ref (for potentially my own benchmark)

HPC papers
- something on that we need motivation for non vendor specific programming
