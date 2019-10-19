#!/bin/bash
n=$#
if [n != 2]; then 
    echo "Usage: compile.sh <input.asm> <output>"
    exit
else
    echo "[+]Starting to compile"
    echo "[+]Compiling using nasm"
    input = $1
    output = $2
    inter = "asm000.o"
    nasm -f elf -o $inter $input
    ret = $?
    if [ $ret != 0 ]; then
        echo "[+]Nasm Compilation Error"
        exit
    else
        echo "[+]Compiling using gcc"
        gcc -o $output $inter 
        ret = $?
        if [ $ret != 0 ]; then
            echo "gcc Compilation Error"
            exit
        else
            rm $inter
            echo "[+]Done"
        fi
    fi
fi
