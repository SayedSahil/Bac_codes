!Defining all parameters

module para
implicit none

integer:: n,m,i,j,k, iter
integer, parameter:: num_bac = 30
integer:: neighbours(0:num_bac-1)
real(8):: x(0:num_bac-1),y(0:num_bac-1) , rad(0:num_bac-1)
real(8):: vx(0:num_bac-1), vy(0:num_bac-1)
real(8):: vx_avg(0:num_bac-1), vy_avg(0:num_bac-1)
real(8):: dr
real(8):: dt, r, dx,dy, lx,ly
real(8), parameter:: bac_size = 0.125d0
real(8):: rb = 0.50d0
character(25):: filename


end module para

!================================================================
!Main code


program Main

use para

call initialisation
call neighbour

open(unit=9, file = "ini_pos.txt")
do i = 0, num_bac-1
write(9,*) x(i), y(i) , rad(i), neighbours(i)
end do
close(9)


do iter = 0,100             !Do how many unit of time needed , 1 unit  = dt 

	call motion
	do j = 0, num_bac -1
	print*, iter, j, x(j), y(j), vx(j), vy(j) 
	end do
end do
call neighbour

open(unit=10, file = "final_pos.txt")
do i = 0, num_bac-1
write(10,*) x(i), y(i) , rad(i), neighbours(i)
end do
close(10)

end program Main

!================================================================
!Subroutines

include "initialisation.f90"
include "motion.f90"
include "neighbours.f90"
