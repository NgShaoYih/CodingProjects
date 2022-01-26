%% R6
f = @(x) exp(x);

X = [0, 0.5, 1, 1.5, 2, 2.5, 3];
Y = f(X);

X2 = [0.5, 1.5, 2.5];
Y2 = [1.764534, 4.230304, 13.008538];

plot(X,Y,"-b", X2,Y2,"-r");
legend("function", "cubic spline", "Location", "north");
xlabel("X");
ylabel("Y");

%% R7
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

%spline plot
xx = linspace(0,3.5,20);
yy = spline(x,y,xx);

plot(x,y,"-r",x2 , y2, "-b", xx, yy,"-*k");
legend("normal","polyfit","spline");
xlabel("x");
ylabel("y");

