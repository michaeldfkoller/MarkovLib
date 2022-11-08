g++ -shared -c -O3 -fPIC -DFOR_OLE  annmod.cpp
g++ -shared -c -O3 -fPIC -DFOR_OLE  annuity.cpp
g++ -shared -c -O3 -fPIC -DFOR_OLE  annuity2.cpp
g++ -shared -c -O3 -fPIC -DFOR_OLE  capital.cpp
g++ -shared -c -O3 -fPIC -DFOR_OLE  glmod.cpp
g++ -shared -c -O3 -fPIC -DFOR_OLE  omarkov.cpp
g++ -shared -c -O3 -fPIC -DFOR_OLE  widdow.cpp
swig -c++ -python omarkov.i
g++ -shared -c -O3 -fPIC -DFOR_OLE -I/usr/include/python2.6 omarkov_wrap.cxx
gcc -lstdc++ -lm -shared annmod.o annuity.o annuity2.o capital.o glmod.o omarkov.o widdow.o omarkov_wrap.o -o _markovlv.so
cp *.py* python
cp *.so python
rm *.o
rm *.py*
rm *.so

