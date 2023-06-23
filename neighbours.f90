subroutine neighbour
use para

neighbours = 0

do i = 0, num_bac-1
do j = 0, num_bac-1

if (i/=j) then
dx = x(i)-x(j)
dy = y(i)-y(j)

dr = sqrt(dx**2+dy**2)

if (dx > lx/2) then                      
dx = dx-lx
elseif ( dx< -1*lx/2) then
dx = dx +lx
end if

if (dy > ly/2) then                      
dy = dy-ly
elseif ( dy< -1*ly/2) then
dy = dy +ly
end if

if (dr < rb) then
neighbours(i) = neighbours(i)+1
end if
end if
end do
end do

end subroutine neighbour