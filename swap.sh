#!/usr/bin/env bash
set -euo pipefail

# swap_by_name — меняет значения двух переменных по их именам.
# Пример: swap_by_name a b
swap_by_name() {
    local name1="$1"
    local name2="$2"
    local tmp

    tmp="${!name1}"
    eval "$name1=\"\${!name2}\""
    eval "$name2=\"\$tmp\""
}

print_line() {
    printf '%s\n' "$*"
}

print_line '=== Swap Demo на Bash ==='
print_line

# 1. Классический обмен через временную переменную
a=10
b=20
print_line '1. Обмен через временную переменную'
printf 'До:  a=%s, b=%s\n' "$a" "$b"
tmp="$a"
a="$b"
b="$tmp"
printf 'После: a=%s, b=%s\n' "$a" "$b"
print_line

# 2. Обмен чисел без временной переменной (арифметика)
x=5
y=3
print_line '2. Обмен чисел без временной переменной'
printf 'До:  x=%s, y=%s\n' "$x" "$y"
x=$((x + y))
y=$((x - y))
x=$((x - y))
printf 'После: x=%s, y=%s\n' "$x" "$y"
print_line

# 3. Обмен через read (подходит для строк)
s1='hello'
s2='world'
print_line '3. Обмен строк через read'
printf 'До:  s1=%s, s2=%s\n' "$s1" "$s2"
read -r s1 s2 <<< "$s2 $s1"
printf 'После: s1=%s, s2=%s\n' "$s1" "$s2"
print_line

# 4. Функция swap_by_name
c='alpha'
d='beta'
print_line '4. Универсальная функция swap_by_name'
printf 'До:  c=%s, d=%s\n' "$c" "$d"
swap_by_name c d
printf 'После: c=%s, d=%s\n' "$c" "$d"
print_line

# 5. Обмен массивов
arr1=(one two three)
arr2=(four five six seven)
print_line '5. Обмен массивов'
printf 'До:  arr1=(%s), arr2=(%s)\n' "${arr1[*]}" "${arr2[*]}"
tmp_arr=("${arr1[@]}")
arr1=("${arr2[@]}")
arr2=("${tmp_arr[@]}")
printf 'После: arr1=(%s), arr2=(%s)\n' "${arr1[*]}" "${arr2[*]}"
print_line

print_line '=== Демонстрация завершена ==='
