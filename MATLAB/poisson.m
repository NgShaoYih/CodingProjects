% Program 8.5 Finite difference solver for 2D Poisson equation 
%   with Dirichlet boundary conditions on a rectangle 
% Input: rectangle domain [xl,xr]x[yb,yt] with MxN space steps 
% Output: matrix w holding solution values 
% Example usage: w=poisson(0,1,1,2,4,4) 
function w=poisson(xl,xr,yb,yt,M,N) 
% i)
% f=@(x,y) exp(-pi*y)*sin(pi*x); % define input function data 
% g1=@(x) sin(pi*x); % define boundary values 
% g2=@(x) exp(-pi)*sin(pi*x); % Example 8.8 is shown 
% g3=@(y) 0*y;
% g4=@(y) 0*y; 

% ii)
f=@(x,y) 0; % define input function data 
g1=@(x) 0*x; % define boundary values 
g2=@(x) 0*x; % Example 8.8 is shown 
g3=@(y) 0*y;
g4=@(y) sinh(pi)*sin(pi*y); 

m=M+1;n=N+1; mn=m*n; 
h=(xr-xl)/M;h2=h^2;k=(yt-yb)/N;k2=k^2; 
x=xl+(0:M)*h; % set mesh values 
y=yb+(0:N)*k; 
A=zeros(mn,mn);b=zeros(mn,1); 

for i=2:m-1 % interior points 
  for j=2:n-1 
    A(i+(j-1)*m,i-1+(j-1)*m)=1/h2;A(i+(j-1)*m,i+1+(j-1)*m)=1/h2; 
    A(i+(j-1)*m,i+(j-1)*m)=-2/h2-2/k2; 
    A(i+(j-1)*m,i+(j-2)*m)=1/k2;A(i+(j-1)*m,i+j*m)=1/k2; 
    b(i+(j-1)*m)=f(x(i),y(j)); 
  end 
end 

for i=1:m % bottom and top boundary points 
  j=1;A(i+(j-1)*m,i+(j-1)*m)=1;b(i+(j-1)*m)=g1(x(i)); 
  j=n;A(i+(j-1)*m,i+(j-1)*m)=1;b(i+(j-1)*m)=g2(x(i)); 
end 

for j=2:n-1 % left and right boundary points 
  i=1;A(i+(j-1)*m,i+(j-1)*m)=1;b(i+(j-1)*m)=g3(y(j)); 
  i=m;A(i+(j-1)*m,i+(j-1)*m)=1;b(i+(j-1)*m)=g4(y(j)); 
end 

v=A\b; % solve for solution in v labeling 
w=reshape(v(1:mn),m,n); %translate from v to w 
mesh(x,y,w') 

xlabel('x');
ylabel('y');
zlabel('w');
