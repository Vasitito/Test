tests.dmp: tutorial.elf
	riscv64-unknown-elf-elf2hex --bit-width 32 --input tutorial.elf --output testshex.txt
	riscv64-unknown-elf-objdump -d tutorial.elf > tests.dmp	

tutorial.elf: main_tests.c lscript bootstrap.s
	riscv64-unknown-elf-gcc -O0 -Wall -march=rv32imav -mabi=ilp32 -T lscript  bootstrap.s main_tests.c -o tutorial.elf -nostdlib
clean:
	rm tutorial.elf testshex.txt tests.dmp

