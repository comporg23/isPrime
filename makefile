


all:
	as -g -o isprime.o isprime.s
	ld -o isprime isprime.o -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2
