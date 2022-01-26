h = zeros(6,1);
for k = 0:5
   h(k+1) = 0.1*(2^(-k)); 
end

y0 = 1;
y_ans = zeros(size(h));
t = 1;

% functions
% dy = @(t,y) t;
% fy = @(t) ((t^2)/2) + 1;
% % 
% dy = @(t,y) 2*(t+1)*y;
% fy = @(t) exp((t^2)+(2*t));
% % 
% dy = @(t,y) 1/(y^2);
% fy = @(t) ((3*t)+1)^(1/3);

dy = @(t,y) t+y;
fy = @(t) (-t)+(2*exp(t))-1;

%Exact answer
yExact = fy(t);

for n = 1:size(h)
%RK4.m
    tinit = [0,1];
    [t3,y3] = RK4(dy,tinit,y0,h(n));
%     last = size(y3(1,:));
    y_ans(n) = yExact - y3(11);
end

figure;
loglog(h,y_ans);
title('Error vs Step Size (dy = t+y');
ylabel('Error');
xlabel('Step Size');

%%

h = zeros(6,1);
for k = 0:5
   h(k+1) = 0.1*(2^(-k)); 
end

y0 = 1;
y_ans = zeros(size(h));
t = 1;

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
yExact = fy(t);

for n = 1:size(h)
    %MATLAB ode45 code
    tode = 0:h(n):1;
    [t1,y1] = ode45(dy,tode,y0);
    y_ans(n) = yExact - y3(11);
end

figure;
loglog(h,y_ans);
title('Error vs Step Size (dy = 1/y^2)');
ylabel('Error');
xlabel('Step Size');