WXBASE = /Users/dann/src/wxw/wxWidgets-3.1.1/macbuild
WXCONFIG = $(WXBASE)/wx-config
CXX = $(shell $(WXCONFIG) --cxx)


PROGRAM = main
 
BUILDDIR = build

SOURCES = $(wildcard *.cpp)
#OBJECTS = $(patsubst %.cpp,%.o,$(wildcard *.cpp))
OBJECTS = $(addprefix $(BUILDDIR)/, $(addsuffix .o, $(basename $(SOURCES))))


# implementation
 
.SUFFIXES:      .o .cpp
 
$(BUILDDIR)/%.o : %.cpp
	mkdir -p $(dir $@)
	$(CXX) -c `$(WXCONFIG) --cxxflags` -o $@ $<

all: Makefile $(PROGRAM)
 
$(PROGRAM):     $(OBJECTS)
	$(CXX) -o $(PROGRAM) $(OBJECTS) `$(WXCONFIG) --libs` `$(WXCONFIG) --libs gl`

clean:
	rm -f $(BUILDDIR)/*.o $(BUILDDIR)/$(PROGRAM)
