# compiler_bench
Simple program to benchmark different compiler performance. \
Current algorithm is the Pi(n) function. \
which is finding the number of prime numbers less than n. \
For following compilers are tested:

| Language | Compiler           | Flags            | time in secs (`N=5000000`) | timer          |
| -------- | ------------------ | ---------------- | -------------------------- | -------------- |
| Fortran  | `gfortran`         | `-O3`            | 1.719                      | `system_clock` |
| C++      | `g++`              | `-O3`            | 1.874                      | `chrono`       |
| Rust     | `rustc`            | `-C opt-level=3` | 1.849                      | `Instant`      |
| Python   | `cython3` + `gcc`  | `-O2`            | 25.839                     | `time`         |


unit: Microsoft Surface Pro 9 \
system: Ubuntu 24.04 x86-64, Linux 5.15-microsoft-standard-WSL2, Windows 11 \
hardware: Intel i7-1255U, 2600Mhz, 2P+8E Cores, 8GB RAM 

Note: The `.py` python script file is first converted to `.c` using `cython3`, then compiled as a standalone executable using `gcc` compiler.

> I tried to compile all the codes, then run them simultaneously by opening a new shell for each executable.
> Not very elegant, you might have to uncomment this option in `Makefile`.
