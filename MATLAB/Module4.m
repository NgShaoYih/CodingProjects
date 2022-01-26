%% R4.1

y0 = 1;

%function
% dy = @(t,y) t;
% fy = @(t) ((t^2)/2) + 1;
% 
% dy = @(t,y) 2*(t+1)*y;
% fy = @(t) exp((t^2)+(2*t));

dy = @(t,y) 1/(y^2);
fy = @(t) ((3*t)+1)^(1/3);
% % 
% dy = @(t,y) t+y;
% fy = @(t) (-t)+(2*exp(t))-1;

%exact answer

tExact = linspace(0,1,100);
yExact = zeros(1,100);
yExact(1) = y0;

for n = 1:length(tExact)
    
    yExact(n) = fy(tExact(n));
end

h = zeros(6,1);
for k = 0:5
   h(k+1) = 0.1*(2^(-k)); 
end

% Euler's Method code taken 
% from https://www.mathworks.com/matlabcentral/answers/278300-matlab-code-help-on-euler-s-method
% Initial conditions and setup
t1 = 0:h(1):1;  % the range of x
y1 = zeros(size(t1));  % allocate the result y
y1(1) = 1;  % the initial y value
n = numel(y1);  % the number of y values
% The loop to solve the DE
for i=1:n-1
    f = dy(t1(i),y1(i));
    y1(i+1) = y1(i) + h(1) * f;
end

t2 = 0:h(2):1;  % the range of x
y2 = zeros(size(t2));  % allocate the result y
y2(1) = 1;  % the initial y value
n = numel(y2);  % the number of y values
% The loop to solve the DE
for i=1:n-1
    f = dy(t2(i),y2(i));
    y2(i+1) = y2(i) + h(2) * f;
end

t3 = 0:h(3):1;  % the range of x
y3 = zeros(size(t3));  % allocate the result y
y3(1) = 1;  % the initial y value
n = numel(y3);  % the number of y values
% The loop to solve the DE
for i=1:n-1
    f = dy(t3(i),y3(i));
    y3(i+1) = y3(i) + h(3) * f;
end

t4 = 0:h(4):1;  % the range of x
y4 = zeros(size(t4));  % allocate the result y
y4(1) = 1;  % the initial y value
n = numel(y4);  % the number of y values
% The loop to solve the DE
for i=1:n-1
    f = dy(t4(i),y4(i));
    y4(i+1) = y4(i) + h(4) * f;
end

t5 = 0:h(5):1;  % the range of x
y5 = zeros(size(t5));  % allocate the result y
y5(1) = 1;  % the initial y value
n = numel(y5);  % the number of y values
% The loop to solve the DE
for i=1:n-1
    f = dy(t5(i),y5(i));
    y5(i+1) = y5(i) + h(5) * f;
end

t6 = 0:h(6):1;  % the range of x
y6 = zeros(size(t6));  % allocate the result y
y6(1) = 1;  % the initial y value
n = numel(y6);  % the number of y values
% The loop to solve the DE
for i=1:n-1
    f = dy(t6(i),y6(i));
    y6(i+1) = y6(i) + h(6) * f;
end


figure;
plot(tExact,yExact,'-k',t1,y1,'-r',t2,y2,'-y',t3,y3,'-b',t4,y4,'-m',t5,y5,'-c',t6,y6,'-g');
title('dy = t+y');
legend('analytical','h = 0.1','h = 0.05','h = 0.025','h = 0.0125','h = 0.0063','h = 0.0031','Location','northwest');

%% R4.1 again

% t is fixed
t = 1;
y0 = 1;

h = zeros(6,1);
for k = 0:5
   h(k+1) = 0.1*(2^(-k)); 
end

%function
% dy = @(t,y) t;
% fy = @(t) ((t^2)/2) + 1;
% 
% dy = @(t,y) 2*(t+1)*y;
% fy = @(t) exp((t^2)+(2*t));
% % 
dy = @(t,y) 1/(y^2);
fy = @(t) ((3*t)+1)^(1/3);
% 
% dy = @(t,y) t+y;
% fy = @(t) (-t)+(2*exp(t))-1;

yExact = fy(t);
yPlot = zeros(size(h));
f = dy(t,y0);

for n = 1:size(h)
   y = y0+h(n)*f;
   yPlot(n) = abs(yExact - y);
end

figure;
loglog(h,yPlot);
title('Error vs Step Size (dy = 1/(y^2)');
ylabel('Error');
xlabel('Step Size');
%% R4.3

y0 = 1;

h = 0.05;

%functions
% dy = @(t,y) t;
% fy = @(t) ((t^2)/2) + 1;
% % 
% dy = @(t,y) 2*(t+1)*y;
% fy = @(t) exp((t^2)+(2*t));
% % 
dy = @(t,y) 1/(y^2);
fy = @(t) ((3*t)+1)^(1/3);
% 
% dy = @(t,y) t+y;
% fy = @(t) (-t)+(2*exp(t))-1;

%Exact answer
tExact = linspace(0,1,100);
yExact = zeros(1,100);
yExact(1) = y0;

for n = 1:length(tExact)
    
    yExact(n) = fy(tExact(n));
end

%MATLAB ode45 code
t = 0:h:1;
[t1,y1] = ode45(dy,t,y0);

%Euler method
t2 = 0:h:1;  % the range of x
y2 = zeros(size(t2));  % allocate the result y
y2(1) = 1;  % the initial y value
n = numel(y2);  % the number of y values
% The loop to solve the DE
for i=1:n-1
    f = dy(t2(i),y2(i));
    y2(i+1) = y2(i) + h(1) * f;
end

%RK4.m
tinit = [0,1];
[t3,y3] = RK4(dy,tinit,y0,h);

figure;
plot(tExact,yExact,'-k',t1,y1,'-r',t2,y2,'-g',t3,y3,'--b');
legend('analytical','ode45 (h = 0.05)','Euler method (h = 0.05)','fixed step RK4','Location','northwest');
title('dy = 1/(y^2), h = 0.05');


%% R4.5

y0 = [10;10];
t0 = 0;
tFinal = 300;

% equations
f = @(t,u) [(1.1*u(1)) - (0.4*(u(1)))*(u(2));(0.1*(u(1))*(u(2))) - (0.4*(u(2)))];
Heq = @(x,y) (0.4*y)-(1.1*(log(y)))+(0.1*x)-(0.4*log(x));

[t,y] = ode45(f,[t0 tFinal],y0);

% code taken from https://www.mathworks.com/help/matlab/math/numerical-integration-of-differential-equations.html
plot(t,y);
title('Population vs t');
xlabel('t');
ylabel('Population');
legend('Prey','Predators');

%code taken from contour_example.m on blackboard
% [X,Y] = meshgrid(y(:,1),y(:,2));
% H = Heq(X,Y);
% 
% contour(X,Y,H);
% colorbar, colormap bone;
% title("Contours of LV equations",'FontSize',20);
% xlabel('x','FontSize',16);
% ylabel('y','FontSize',16);



