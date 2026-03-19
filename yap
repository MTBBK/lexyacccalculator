#!/bin/bash

yacc -d calculator.y
lex calculator.l
gcc -o calculator lex.yy.c y.tab.c -ll -lm
./calculator
