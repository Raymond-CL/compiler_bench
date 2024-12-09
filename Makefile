FC = gfortran
FFLAGS = -O3
Fsrc = PIn_fort.f90
Fexe = PIn_fort

CC = g++
CFLAGS = -O3
Csrc = PIn_cpp.cc
Cexe = PIn_cpp

RC = rustc
RFLAGS = -C opt-level=3
Rsrc = PIn_rust.rs
Rexe = PIn_rust

PC = cython3
PFLAGS = --embed --3str
Psrc = PIn_py.py
PCC = gcc
PCFLAGS = $(shell python3-config --cflags --ldflags) -lpython3.12 -lpthread -lutil
PCsrc = PIn_py.c
Pexe = PIn_py

fort: $(Fsrc)
	$(FC) $(Fsrc) -o $(Fexe) $(FFLAGS)

cpp: $(Csrc)
	$(CC) $(Csrc) -o $(Cexe) $(CFLAGS)

rust: $(Rsrc)
	$(RC) $(Rsrc) -o $(Rexe) $(RFLAGS)

python: $(Psrc)
	$(PC) $(Psrc) -o $(PCsrc) $(PFLAGS)
	@$(PCC) $(PCsrc) -o $(Pexe) $(PCFLAGS)

run: fort cpp rust python
	bash -c "./$(Fexe)" &
	bash -c "./$(Cexe)" &
	bash -c "./$(Rexe)" &
	bash -c "./$(Pexe)" &
	@echo "press 'enter' when finished."

clean:
	rm -rf $(Fexe) $(Cexe) $(Rexe) $(PCsrc) $(Pexe)