TRG = trg

OBJT90 = trigrs.o flux.o prpijz.o svxmdv.o svijz.o dzero_brac.o
OBJT95 = grids.o input_vars.o model_vars.o dsimps.o input_file_defs.o iverson.o pstpi.o satfin.o savage.o steady.o trini.o unsinf.o ivestp.o pstpf.o rnoff.o satinf.o smallt.o svgstp.o unsfin.o unsth.o ssizgrd.o svlist.o
OBJT77 = calerf.o dbsct.o derfc.o irdgrd.o irdswm.o isvgrd.o roots.o srdgrd.o srdswm.o ssvgrd.o

LIBS =

CC = gcc -O3
CCFLAGS = -lm
FC = f95 -w -O3 
FFLAGS =
F90 = f95 -w -O3
F90FLAGS = 
LDFLAGS =

all: $(TRG)
#-----------------------------------------------------------------

$(TRG): $(OBJT95) $(OBJT90) $(OBJT77) 
	$(F90) $(CCLIBS) $(LDFLAGS) -o $@ $(OBJT95) $(OBJT90) $(OBJT77) $(CCFLAGS) $(LIBS)

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

