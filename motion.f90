subroutine motion

use para
neighbours  = 0 
vx_avg = 0.0d0
vy_avg = 0.0d0
dt = 1.0d0


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


!==========================================
!Updating positions
!==========================================

do i = 0, num_bac-1
if(vx_avg(i)>1.0e-15) then
vx(i) = vx_avg(i)
end if
if(vy_avg(i)> 1.0e-15) then 
vy(i) = vy_avg(i)
end if
x(i) = x(i)+ vx(i)*dt
if (abs(x(i))>lx) then
x(i) = x(i)-floor(x(i)/lx)*lx
end if
y(i) = y(i)+ vy(i)*dt
if (abs(y(i))>ly) then
y(i) = y(i)-floor(y(i)/ly)*ly
end if


!print*, iter, x(i),y(i),vx(i),vy(i)

end do

end subroutine motion




