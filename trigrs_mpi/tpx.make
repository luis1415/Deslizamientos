TPX = tpx

OBJX90 = tpindx.o nxtcel.o
OBJX95 = ssizgrd.o
OBJX77 = isvgrd.o mpfldr.o rdflodir.o sindex.o slofac.o srdgrd1.o

LIBS =

CC = gcc -O3
CCFLAGS = -lm
FC = f95 -w -O3 
FFLAGS =
F90 = f95 -w -O3
F90FLAGS = 
LDFLAGS =

all: $(TPX)
#-----------------------------------------------------------------

$(TPX): $(OBJX95) $(OBJX90) $(OBJX77)
	$(F90) $(CCLIBS) $(LDFLAGS) -o $@ $(OBJX95) $(OBJX90) $(OBJX77) $(CCFLAGS) $(LIBS)

#-----------------------------------------------------------------

.SUFFIXES: $(SUFFIXES) .f90 .f .c .f95

.f90.o:
	$(F90) $(F90FLAGS) -c $<

.f.o:
	$(F90) $(F90FLAGS) -c $<

.c.o:
	$(CC) $(CCINCLUDE) -c -w $<

.f95.o:
	$(F90) $(F90FLAGS) -c $<

