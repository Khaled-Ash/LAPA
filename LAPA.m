%PA 4
%Khaled AbouShaban 101042658

set(0,'DefaultFigureWindowStyle','docked')
%matrix rows
ny = 100;
%matrix columns
nx = 100;
%the max number of iterations
ni = 100;
%initialization
V = zeros(nx,ny);
%Top boundary
V(1,:) = 0;
%buttom boundary
V(ny,:) = 0;
%left boundary
V(:,1) = 1;
%right boundary
V(:,nx) = 1;

SideToZero = 1;
for k = 1:ni
    for i = 2:nx-1
        for j = 2:ny-1
            V(i,j) = (V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1))/4;
        end
        
    end
end

figure(1)
surf(V)

figure (2)
[Ex, Ey] = gradient(V);
quiver(Ex, Ey)


figure(3)
surf(imboxfilt(V,3))

pause(0.1)