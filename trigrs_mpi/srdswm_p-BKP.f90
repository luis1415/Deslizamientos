!  
!  Reads a list of real values that represent a 2-D matrix into 
!  two 1-D arrays.  One array is a pointer that tracks the starting
!  location of each row in the matrix.  This scheme is advantageous 
!  for storing sparse "sawtooth" arrays. Such arrays have rows of 
!  variable length and all of the non-zero values are at the left 
!  ends of the rows. 
!   by Rex L. Baum, USGS, Spring 2001
!
! MPI calls & MPI-related changes by M. Alvioli, November 2014  
! 
subroutine srdswm_p(len,jmax,u,test,x,ctr,ulog)
  use mpi
  implicit none
  integer j,k,jmax,u,len,ulog
  integer ctr(jmax+1)
  real x(len),val,test
  integer myrank,isize,ierr
  Call MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)
  Call MPI_COMM_SIZE(MPI_COMM_WORLD, isize, ierr)
  j=0
  ctr(1)=0
  k=0
100 continue
  if(myrank.eq.0) read (u,*,end=110) val
  !  Check for marker value at end of a row
  Call MPI_BCAST(val,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierr)
  if (val.eq.test) then
     if(myrank.eq.0) read (u,*,end=110) j
     Call MPI_BCAST(j,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierr)
     ctr(j)=k+1
     if (j.gt.jmax) go to 200
     go to 100
  end if
  k=k+1
  x(k)=val
  go to 100
110 continue
  ctr(jmax+1)=k+1
  return
200 continue
  if(myrank.eq.0) then
     write(*,*) 'Array bound <jmax> exceeded  in subroutine srdswm'
     write(ulog,*) 'Array bound <jmax> exceeded  in subroutine srdswm'
  endif
  call MPI_FINALIZE(ierr)
  stop '-200 in srdswm()'
end subroutine srdswm_p
