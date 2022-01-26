% Emily Ng Shao Yih 46766546
% COSC2500 Module 1
% -----------------------------------------------------------------------
%% R1.1 -----------------------------------------------------------------
x = [ 0 0.1341 0.2693 0.4034 0.5386 0.6727 ...
0.8079 0.9421 1.0767 1.2114 1.3460 1.4801 ...
1.6153 1.7495 1.8847 2.0199 2.1540 2.2886 ...
2.4233 2.5579 2.6921 2.8273 2.9614 3.0966 ...
3.2307 3.3659 3.5000 ];
y = [ 0 0.0310 0.1588 0.3767 0.6452 0.8780 ...
0.9719 1.0000 0.9918 0.9329 0.8198 0.7707 ...
0.8024 0.7674 0.6876 0.5937 0.5778 0.4755 ...
0.3990 0.3733 0.2870 0.2156 0.2239 0.1314 ...
0.1180 0.0707 0.0259 ];
P = polyfit(x,y,10); %trial and error, 10 is the best fit by eye
x2 = linspace (0 ,3.5 ,1000);
y2 = polyval (P , x2 );
plot (x ,y , '*' ,x2 , y2 );

%all code in this section is referenced from programming hints
% f(x) = (-x^2) + 2x, 0 <= x <= 1
% f(x) = -0.4x + 1.4, 1 <= x <= 3.5
% ------------------------------------------------------------------------
%% R1.2 ------------------------------------------------------------------
x = [0,1,1.5,2];
num_points = 10;
h = logspace ( -20 , 1 , num_points ); %referenced from programming hints

for i = 1 : length(x)
    
    f12 = @(x) (x.^4)-(2.*x.^3);
    f13 = @(x) (f12(x+h)-f12(x))/h; %differenciated @f12
for n = 1 : num_points
   
   %forward difference
   fd = (f13(x(i)+h(n))-f13(x(i)))/h(n);
   %exact results
   ed = f13(x(i));
   
   %forward difference error
   fde(n) = abs(fd-ed);
   
   %backwards difference
   bd = (f13(x(i)-h(n))-f13(x(i)))/h(n);
   
   %backwards difference error
   bde(n) = abs(bd-ed);
   
   %central difference
   cd = (f13(x(i)+h(n))-f13(x(i)-h(n)))/h(n);
   
   %central difference error
   cde(n) = abs(cd-ed);
    
end

figure;
loglog(h,fde,'-or',h,bde,'-ob',h,cde,'-og');
title(['x = ' num2str(x(i))]);
ylabel('Error');
xlabel('Step size h');

end

%code in this section referenced from programming hints
% the distance between the lines of the graphs are all equal
% except for the last point in each graph
% ------------------------------------------------------------------------
%% R1.3 ------------------------------------------------------------------
f2 = @(x) cos(x);
f3 = @(x) (sin(x.^2))+1;
numPoints = 19;

%from line66 to line84 is about @f2
h = linspace(0,pi,numPoints);
trapX = zeros(1,numPoints);
simpX = zeros(1,numPoints);
inteX = zeros(1,numPoints);

X = f2(h);
for n = 1: numPoints
   trapX(n) = trapz(h(n),X); 
   simpX = SIMP42(X,h); %function SIMP42 taken from blackboard
   inteX = integral(f2,0,h(n));
end

%calculate error difference in both methods
simpXE = inteX - simpX;
trapXE = inteX - trapX;

figure;
loglog(h,simpXE,'-ob',h,trapXE,'-or');
title('cos(x)');

%from line87 to line is about @f3
g = linspace(0,10,numPoints);
trapY = zeros(1,numPoints);
simpY = zeros(1,numPoints);
inteY = zeros(1,numPoints);

Y = f3(g);
for n = 1: numPoints
   trapY(n) = trapz(g(n),Y); 
   simpY = SIMP42(Y,g); %function SIMP42 taken from blackboard
   inteY = integral(f3,0,g(n));
end

%calculate error difference in both methods
simpYE = inteY - simpY;
trapYE = inteY - trapY;

figure;
loglog(g,simpYE,'-ob',g,trapYE,'-or');
title('sin(x^2) + 1');

% ------------------------------------------------------------------------
%% R1.4 ------------------------------------------------------------------
f4 = @(x) exp(-x);
ANS = integral(f4, 0,400);
nval = 0.01; %size for step

x1A = zeros(1,20);
x2 = linspace(0,20,20); % fixed points
x2A = zeros(1,20); % array to hold points for fixed points
x2y = zeros(1,20); % array to hold points for step size

for n = 1: 20 %my laptop will crash if this goes more than 20 steps
    x1 = 0:nval; %fixed step size 
    x1A(n) = trapz(x1,f4(x1));
    nval = nval+nval; 

end

for m = 1: 20
    x2c = x2(m);
    x2y(m) = f4(x2c);    
end
x2A(m) = trapz(x2c,x2y);

%finding error difference
x1ed = ANS - x1A;
x2ed = ANS - x2A;

figure;
plot(x1ed,x1(1:20),'-r',x2ed,x2,'-b');
ylabel = ('error');
% ------------------------------------------------------------------------