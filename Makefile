CXX = $(shell wx-config --cxx)
 
PROGRAM = main
 
BUILDDIR = build

SOURCES = $(wildcard *.cpp)
#OBJECTS = $(patsubst %.cpp,%.o,$(wildcard *.cpp))
OBJECTS = $(addprefix $(BUILDDIR)/, $(addsuffix .o, $(basename $(SOURCES))))


# implementation
 
.SUFFIXES:      .o .cpp
 
$(BUILDDIR)/%.o : %.cpp
	mkdir -p $(dir $@)
	$(CXX) -c `wx-config --cxxflags` -o $@ $<

all: Makefile $(PROGRAM)
 
$(PROGRAM):     $(OBJECTS)
	$(CXX) -o $(PROGRAM) $(OBJECTS) `wx-config --libs`

clean:
	rm -f $(BUILDDIR)/*.o $(BUILDDIR)/$(PROGRAM)
