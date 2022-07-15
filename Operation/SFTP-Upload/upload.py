#!/usr/bin/python
# encoding: utf-8
# pip install svn
# pip install paramiko
#
import logging
import os
import svn.local
from fabric import Connection
import hashlib

logging.basicConfig(level=logging.INFO,format='%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',datefmt='%a, %d %b %Y %H:%M:%S')

path_remoate = "/home/xxxx/work/server/"
def GetFileMd5(filename):
    if not os.path.isfile(filename):
        return
    myhash = hashlib.md5()
    f = open(filename,'rb')
    while True:
        b = f.read(8096)
        if not b :
            break
        myhash.update(b)
    f.close()
    return myhash.hexdigest()

def main():
    c = Connection(host="xx.xx.xx.xx",
        user="username",
        connect_kwargs={"key_filename": "LOCAL_RSA_KEY_FILE",})
    c.open()
    logging.info(c.is_connected)
    c.run("pwd")
    l = svn.local.LocalClient('./')
    entries = l.status()
    for filename in entries:
        if filename.type_raw_name=='modified' or 'added' == filename.type_raw_name:
            name = filename.name
            name = name.replace("\\","/")
            logging.info("put name: {0}".format(name))
            cmd = "md5sum {0}{1}".format(path_remoate,name) + "|awk '{print $1}'"
            retstr = c.run(cmd)
            selfmd5 = GetFileMd5(name)
            print(selfmd5)
            if retstr.stdout[:-1] == selfmd5:
                print("match")
            else:
                print("not match")
                c.put(name,"{0}{1}".format(path_remoate,name))
    c.close()

if __name__ == '__main__':
    main()
