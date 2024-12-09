# compiler_bench
Simple program to benchmark different compiler performance. \
Current algorithm is the Pi(n) function. \
which is finding the number of prime numbers less than n. \
For following compilers are tested:

| Language | Compiler   | Flags            |
| -------- | ---------- | ---------------- |
| Fortran  | `gfortran` | `-O3`            |
| C++      | `g++`      | `-O3`            |
| Rust     | `rustc`    | `-C opt-level=3` |
| Python   | `cython3`  |                  |

Note: The `.py` python script file is first converted to `.c` using `cython3`, then compiled as a standalone executable using `gcc` compiler.

> I tried to compile all the codes, then run them simultaneously by opening a new shell for each executable.
> Not very elegant, you might have to uncomment this option in `Makefile`.