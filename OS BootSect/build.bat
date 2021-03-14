@echo off

nasm -f bin src\bootloader.asm -o bootloader.bin
nasm -f bin src\kernel.asm -o kernel.bin
echo Please, open a Hex Editor and combind the code into a single out.bin file
pause
copy out.bin OS\out.bin
truncate OS\out.bin -s 1200K
mkisofs -o os.iso -b out.bin OS