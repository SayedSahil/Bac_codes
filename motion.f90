subroutine motion

use para
neighbours  = 0 
vx_avg = 0.0d0
vy_avg = 0.0d0
dt = 1.0d0

!$OMP PARALLEL DO
do i = 0, num_bac-1
do j = 0, num_bac-1

if (i/=j) then
dx = x(i)-x(j)
dy = y(i)-y(j)

dr = sqrt(dx**2+dy**2)

if (dx > lx/2) then                      !Impletmenting Periodic bondar Conditon ,so that your system is virtually infinitely large
dx = dx-lx
elseif ( dx< -1*lx/2) then
dx = dx +lx
end if

if (dy > ly/2) then                      !Impletmenting Periodic bondar Conditon ,so that your system is virtually infinitely large
dy = dy-ly
elseif ( dy< -1*ly/2) then
dy = dy +ly
end if

if (dr< rb) then
neighbours(i) = neighbours(i)+1
vx_avg(i) = vx_avg(i)+vx(i)
vy_avg(i) = vy_avg(i)+vy(i)
end if
end if
end do
if (neighbours(i).ne.0) then
vx_avg = vx_avg/neighbours(i)
vy_avg = vy_avg/neighbours(i)
end if
end do
!$OMP END PARALLEL DO

!==========================================
!Updating positions
!==========================================

do i = 0, num_bac-1
vx(i) = vx_avg(i)
vy(i) = vy_avg(i)

x(i) = x(i)+ vx(i)*dt
y(i) = y(i)+ vy(i)*dt
!print*, iter, x(i),y(i),vx(i),vy(i)

end do

end subroutine motion




