pico-8 cartridge // http://www.pico-8.com
version 34
__lua__

--fxhash snippet
w=stat(6)s=1
for i=1,#w do
ch=ord(sub(w,i,i))s+=s*31+ch
end 
srand(s)




