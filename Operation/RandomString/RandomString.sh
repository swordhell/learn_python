#!/usr/bin/env bash

chars='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%A*-_=+?,()&'

for i in {1..16}; do
  printf '%s' "${chars:RANDOM%${#chars}:1}"
done
echo
