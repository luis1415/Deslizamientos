PRG = prg

OBJP90 = trigrs_p.o partial_p.o flux.o flux_p.o prpijz.o svxmdv.o svijz.o dzero_brac.o srdgrd_p.o irdgrd_p.o
OBJP95 = modules_p.o grids.o input_vars.o model_vars.o dsimps.o input_file_defs.o iverson.o pstpi.o pstpi_p.o satfin.o satfin_p.o savage.o steady.o trini.o trini_p.o unsinf.o unsinf_p.o ivestp.o ivestp_p.o pstpf.o pstpf_p.o rnoff.o satinf.o satinf_p.o smallt.o svgstp.o svgstp_p.o unsfin.o unsfin_p.o unsth.o unsth_p.o ssizgrd.o ssizgrd_p.o svlist.o rnoff_p.o steady_p.o
OBJP77 = calerf.o dbsct.o derfc.o irdgrd.o irdswm.o irdswm_p.o isvgrd.o roots.o srdgrd.o srdswm.o srdswm_p.o ssvgrd.o

LIBS =

CC = gcc -O3
CCFLAGS = -lm
MPIF90 = mpif90 -w -O3
F90FLAGS = 
LDFLAGS =

all: $(PRG)
#-----------------------------------------------------------------

$(PRG): $(OBJP95) $(OBJP90) $(OBJP77) 
	$(MPIF90) $(CCLIBS) $(LDFLAGS) -o $@ $(OBJP95) $(OBJP90) $(OBJP77) $(CCFLAGS) $(LIBS)

#-----------------------------------------------------------------

.SUFFIXES: $(SUFFIXES) .f90 .f .c .f95

.f90.o:
	$(MPIF90) $(F90FLAGS) -c $<

.f.o:
	$(MPIF90) $(F90FLAGS) -c $<

.c.o:
	$(CC) $(CCINCLUDE) -c -w $<

.f95.o:
	$(MPIF90) $(F90FLAGS) -c $<

