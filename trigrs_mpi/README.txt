Description
The software TRIGRS v2.1 is operated by preparing a text file containing the numerical values of the input parameters and the path of the grid files 
required as an input. The content and meaning of the file is described in detail in the previous version of the code http://pubs.usgs.gov/of/2008/1159/ 
and will not be repeated here. We provide new tpx_in.txt (Topoindex) and tr_in.txt (TRIGRS) initialization files, found in the source code folder, and 
sample input grids in the data/tutorial folder. The content and meaning of the variables in the initialization files are the same as in the previous 
version, but their organization is slightly different.

Citation
The software TRIGRS v2.1 is described in the following paper:
M. Alvioli, R. L. Baum
Parallelization of the TRIGRS model for rainfall-induced landslides using the message passing interface
Environ. Model. Softw. 81, 2016 122-135
doi:10.1016/j.envsoft.2016.04.002

Data
We provide a set of grids that can be used to run the tutorial described in http://pubs.usgs.gov/of/2008/1159/.

Requirements
A modern FORTRAN compiler, MPI libraries (tested with gfortran/f95 and MPICH/Open MPI in Ubuntu Linux 12.0, CentOS 7.0 and Cygwin).
The non-parallel version of TRIGRS v2.1 is also provided.

Installation and run
The software performance have been measured on: 1) Ubuntu 14.04 LTS Linux installed on a 16-cores quad-processor for a total of 64 cores, equipped with 
196GB RAM and storage space accessible through standard Network File System; 2) a high-performance machine, namely the Galileo cluster at computing 
center CINECA, Italy (\texttt{http://www.hpc.cineca.it/hardware/galileo}). The code was run with up to $N_p$ = 256, divided in computing nodes with 16 
cores each. 

How to o use the software:

# unpack the tar archive in your file system -  for example is /my/dir/, assuming a unix-like system
cd /my/dir/
tar zxvf trigrs_mpi-v2.1.tgz
cd trigrs_mpi/

# compile to generate the TRIGRS serial executable, trg, the parallel executable, prg, and the 
# Topoindex executable, tpx (see TRIGRS v2.0 manual avaiable at:
# http://pubs.usgs.gov/of/2008/1159/downloads/pdf/OF08-1159.pdf);
# the suggested Makefile assumes f95 and mpif90 to be present on the system; just type:
make

# you can compile the tpx (Topoindex), trg (TRIGRS v2.1, non-parallel) and prg (TRIGRS v2.1, parallel) executables separately
# by typing, respectively: 
make tpx
make trg
make prg

#if object and executable files are to be removed, type:
make clean

# use Topoindex to generate, at least, the TIgrid_size.txt file 
# in the same directory where dem and slope grids are stored:
/my/dir/trigrs_mpi/tpx

# run TRIGRS from the directory containing your initialization file tr_in.txt
# the serial execution can be started both as:
/my/dir/trigrs_mpi/trg
# or as:
/my/dir/trigrs_mpi/prg
# the parallel execution, with a total of NP processes can be started as:
mpirun -np [NP] /my/dir/trigrs_mpi/prg

# if the [NP] processes in the MPI pool are to be distributed on more than one node,
# a machine file mf.txt can be provided in the following form (MPICH):
localhost:NP1
otherhost1:NP2
otherhost2:NP3

# where NP1+NP2+NP3=NP, otherhost1 and otherhost2 be accessible 
# through ssh with no password and type:
mpirun -np [NP] -machinefile mf.txt /my/dir/trigrs_mpi/prg

# TUTORIAL - you can run tpx and trg or prg in the source code folder trigrs_mpi/. 
# The sample initialization files (tpx_in.txt for Topoindex and tr_in.txt) will be used,
# input data will be read from the existing folder trigrs_mpi/data/tutorial and output 
# data will be stored in trigrs_mpi/data/output/. Modify the initialization files to 
# suit your input data and needs.




