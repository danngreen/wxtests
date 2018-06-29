CXX = $(shell wx-config --cxx)
 
PROGRAM = main
 
#OBJECTS = $(PROGRAM).o
OBJECTS = $(patsubst %.cpp,%.o,$(wildcard *.cpp))
 
# implementation
 
.SUFFIXES:      .o .cpp
 
.cpp.o :
	$(CXX) -c `wx-config --cxxflags` -o $@ $<

all:    $(PROGRAM)
 
$(PROGRAM):     $(OBJECTS)
	$(CXX) -o $(PROGRAM) $(OBJECTS) `wx-config --libs`

clean:
	rm -f *.o $(PROGRAM)
