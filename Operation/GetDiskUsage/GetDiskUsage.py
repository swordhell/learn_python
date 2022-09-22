#!/usr/bin/python
# encoding: utf-8
# pip install svn
# pip install paramiko
#
import logging
import os

logging.basicConfig(level=logging.INFO,format='%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',datefmt='%a, %d %b %Y %H:%M:%S')

def get_size(start_path = 'D:/'):
    total_size = 0
    for dirpath, dirnames, filenames in os.walk(start_path):
        for d in dirnames:
            fp = os.path.join(dirpath, d)
            size = os.path.getsize(fp)
            total_size+=size
    return total_size

def main():
    get_size()

if __name__ == '__main__':
    main()
