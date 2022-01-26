%% r1 code referenced from Module 1
fx = @(x) exp(x)-(x.^3).*sin(x);
n = 19; %num of points
h = linspace(0,pi,n);
trapX = zeros(1,n);

X = fx(h);
for n = 1: n
   trapX(n) = trapz(h(n),X); 
end

figure;
loglog(h,trapX,'-o');
title('exp(x)-(x^3)*sin(x)');
%% r3 code taken from module 2
%g(x)
gx = @(x) exp((-x.^2)-1); 
%intersection
f1 = @(x) exp((-x.^2)-1)- x;
%f1 prime
f1p = @(x) (exp(x)).^(-x.^2 - 1)*(-(x.^(2) + 2*x*log(exp(x)) + 1)) - 1;

%intervals to use
xa1 = 0.1;
xa2 = 1;

%loop for first root
for n = 1:20

    %value of x for f(x)
    fx = f1(xa1);
    
    %value of x for f'(x)
    fpx = f1p(xa1);
    
    %find new xa1
    xa1 = xa1 - (fx/fpx);
    
end

ya1 = gx(xa1);

%print first root of a
disp("Estimate intersection: x=" + xa1 + " y=" + ya1);

%% r6
y0 = 1;

h = 0.5;

%functions

dy = @(t,y) y(t)*y(t)-t;

%RK4.m
tinit = [0,1];
[t3,y3] = RK4(dy,tinit,y0,h);

figure;
plot(t3,y3,'--b');

title('dy = y(t)*y(t)-t, h = 0.05');

