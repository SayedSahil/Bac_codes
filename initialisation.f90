subroutine initialisation

use para

lx = 15.0d0
ly = lx 


!dt = 1.0

!Defining inital positions
!The OMP parallel speeds up loops
!$OMP PARALLEL DO
do i  =0, num_bac -1
        call random_number(t)
        x(i) = t*lx
        call random_number(t)
        y(i) = t*ly
        if (mod(i, 2) == 0) then        
        rad(i)  = bac_size_1
        ! defining bac_size_1 if i is even and bac_size_2 if i is odd
        else
        rad(i)  = bac_size_2
        end if
end do
!$OMP END PARALLEL DO

!Defining intial velocities
do i = 0, num_bac-1
call random_number(t)
vx(i) = 5*t
call random_number(t)
vy(i) = 5*t
end do

end subroutine initialisation
