import glob
import os

i = 100000
for filename in glob.glob("*.png"):
    print(filename)
    data='KJ-DJ-%05d.png'%i
    os.rename(filename,data)
    i=i+1