subroutine initialisation

use para

lx = 3.0d0
ly = lx 


!dt = 1.0




!Defining inital positions

do i  =0, num_bac -1

call random_number(t)
x(i) = t*lx
call random_number(t)
y(i) = t*ly

rad(i)  = bac_size

end do


!Defining intial velocities
do i = 0, num_bac-1

call random_number(t)
vx(i) = 10*t
call random_number(t)
vy(i) = 10*t
end do


end subroutine initialisation
