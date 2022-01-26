%% R2.1 Bisection

f1 = @(x) cos(x);

%x intervals for a)
xa1 = [0 2];
xa2 = [2 4];

% Bisection Method from line 13 to line 64
 for n = 1: 20
    t = (xa1(1) + xa1(2))./2;
    Ans = f1(t);
    if Ans < 0
        xa1(1) = t;
    elseif Ans > 0
        xa1(2) = t;
    end
 end

%print the first root for a)
disp("Estimate first root for a) " + t);

 for n = 1: 20
    t = (xa2(1) + xa2(2))./2;
    Ans = f1(t);
    if Ans < 0
        xa2(1) = t;
    elseif Ans > 0
        xa2(2) = t;
    end
 end

%print the second root for a)
disp("Estimate second root of a) " + t); 


f2 = @(x) ((x-1)^3).*(x+2);

%x intervals for b)
xb1 = [-4 0];
xb2 = [0 2];

%second equation
for n = 1: 20
    t = (xb1(1) + xb1(2))./2;
    Ans = f2(t);
    if Ans < 0
        xb1(1) = t;
    elseif Ans > 0
        xb1(2) = t;
    end
 end

%print the first root for b)
disp("Estimate first root of b) " + t);

 for n = 1: 20
    t = (xb2(1) + xb2(2))./2;
    Ans = f2(t);
    if Ans < 0
        xb2(1) = t;
    elseif Ans > 0
        xb2(2) = t;
    end
 end

%print the second root for b)
disp("Estimate second root of b) " + t); 

%% R2.1 Fixed Point Iteration

f1 = @(x) cos(x);

%method for fixed point iteration taken from textbook
disp("Estimate first root of a) " + fpi(f1,2,5));
disp("Estimate second root of a) " + fpi(f1,5,4));

f2 = @(x) ((x-1)^3).*(x+2);

%method for fixed point iteration (disp) taken from textbook (Sauer Matlab code 2nd Edition)
disp("Estimate first root of b) " + fpi(f2,0,5));
disp("Estimate second root of b) " + fpi(f2,2,4));

%% R2.1 Newtons Method

%Newtons Method Equation
% nx = x - (f(x)/f'(x))

%Equation 1
f1 = @(x) cos(x);
%f1 prime
f1p = @(x) -sin(x);

%intervals to use
xa1 = 1.5;
xa2 = 5;

%loop for first root
for n = 1:20

    %value of x for f(x)
    fx = f1(xa1);
    
    %value of x for f'(x)
    fpx = f1p(xa1);
    
    %find new xa1
    xa1 = xa1 - (fx/fpx);
    
end

%print first root of a
disp("Estimate first root of a) " + xa1);

%loop for second root
for n = 1:20

    %value of x for f(x)
    fx = f1(xa2);
    
    %value of x for f'(x)
    fpx = f1p(xa2);
    
    %find new xa1
    xa2 = xa2 - (fx/fpx);
    
end

%print second root of a
disp("Estimate second root of a) " + xa2);

%equation 2
f2 = @(x) ((x-1)^3).*(x+2);
%f2 prime
f2p = @(x) ((x-1)^2).*((4*x)+5);

%intervals to use
xb1= -2;
xb2 = 2;

%loop for first root
for n = 1:20

    %value of x for f(x)
    fx = f2(xb1);
    
    %value of x for f'(x)
    fpx = f2p(xb1);
    
    %find new xa1
    xb1 = xb1 - (fx/fpx);
    
end

%print first root of a
disp("Estimate first root of b) " + xb1);

%loop for second root
for n = 1:20

    %value of x for f(x)
    fx = f2(xb2);
    
    %value of x for f'(x)
    fpx = f2p(xb2);
    
    %find new xa1
    xb2 = xb2 - (fx/fpx);
    
end

%print second root of a
disp("Estimate second root of b) " + xb2);

%% R2.2 

f3 = @(x) ((x-(7/11))^2).*(x+(3/13)).*(exp(-x^2));

%min points range
xmin1 = [-3 0];
xmin2 = [0 1];

%max points range
xmax1 = [-1 1];
xmax2 = [1 2];
%change to negative to find max
xinv1 = [1, -1];
xinv2 = [-1 -2];

%method for golden section search (gss) taken from textbook (Sauer Matlab code 2nd Edition)
%minima 1
minx1 = gss(f3, xmin1(1), xmin1(2), 20);
disp("Estimated first minima: x=" + (minx1) + " y=" + f3(minx1) );

%minima 2
minx2 = gss(f3, xmin2(1), xmin2(2), 20);
disp("Estimated second minima: x=" + (minx2) + " y=" + f3(minx2) );

%Maxima calculated by inversing the sign of x and inversing the sign of the output
%maxima 1
maxx1 = -(gss(f3, xinv1(1), xinv1(2), 20));
disp("Estimated first maxima: x=" + (maxx1) + " y=" + f3(maxx1) );

%maxima 2
maxx2 = -(gss(f3, xinv2(1), xinv2(2), 20));
disp("Estimated second maxima: x=" + (maxx2) + " y=" + f3(maxx2) );

%% R2.2 Newton again
f3 = @(x) ((x-(7/11)).^2).*(x+(3/13)).*(exp(-x.^2));

%min points range
xmin1 = [-1.5 -1 -0.5];
xmin2 = [0 0.5 1];

%max points range
xmax1 = [-0.5 0 0.5];
xmax2 = [1 1.5 2];
%change to negative to find max
xinv1 = [0.5 0 -0.5];
xinv2 = [-1 -1.5 -2];

%method for Successive Parabolic Interpolation (spi) taken from textbook (Sauer Matlab code 2nd Edition)
%minima 1
minx1 = spi(f3, xmin1(1), xmin1(2), xmin1(3), 5);
disp("Estimated first minima: x=" + minx1(8) + " y=" + f3(minx1(8)));

%minima 2
minx2 = spi(f3, xmin2(1), xmin2(2),xmin2(3), 5);
disp("Estimated second minima: x=" + minx2(8) + " y=" + f3(minx2(8)));

%Maxima calculated by inversing the sign of x and inversing the sign of the output
%maxima 1
maxx1 = -(spi(f3, xinv1(1), xinv1(2),xinv1(3), 20));
disp("Estimated first maxima: x=" + maxx1(8) + " y=" + f3(maxx1(8)));

%maxima 2
maxx2 = -(spi(f3, xinv2(1), xinv2(2),xinv2(3), 20));
disp("Estimated second maxima: x=" + maxx2(8) + " y=" + f3(maxx2(8)));

%% 3
T = [1 2 3 4 5];
a = [1 1];
find_eq(T,a)