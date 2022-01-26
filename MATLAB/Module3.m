%% R3.1

Ai = [2 -2 -1;4 1 -2;-2 1 -1];
bi = [-2 1 -3];
xi = gaussian(Ai,bi);

Aii = [1 2 -1; 0 3 1; 2 -1 1];
bii = [2 4 2];
xii = gaussian(Aii,bii);

Aiii = [2 1 -4; 1 -1 1;-1 3 -2];
biii = [-7 -2 6];
xiii = gaussian(Aiii,biii);

%% R3.1 test

n = 5;
H = hilb(n);
b = ones(n,1);

Hx = gaussian(H,b);

%% R3.2

n = 500;
A = zeros(n);
for i = 1:n
   for j = 1:n
%        A(i,j) = (5/(i+(2*j)-1));
        A(i,j) = abs(i-j) + 1;
   end
end
x = ones(n,1);
b = A*x;

%Solve for x when b = Ax
xs = A\b;

infNormXs = norm(xs,Inf);
infNormX = norm(x,Inf);
forError = abs(infNormX - infNormXs);
backError = eps;
errMagni = forError/eps;

%% R3.3
A = sprandsym(500,500,0.3);
b = rand(500,1);
tol = 1e-06;
maxIt = 500;

%Generalized Minimum Residual Method
% x = gmres(A,b,[],tol,maxIt);

%Bicondjugate Gradients Method
% x = bicg(A,b,tol,maxIt);

%Conjugate Gradients Square Method
% x = cgs(A,b,tol,maxIt);

%Symmetric LQ Method
% x = symmlq(A,b,tol,maxIt);

%Minimum Residual Method
% x = minres(A,b,tol,maxIt);

%% R3.4

%Setting up matrices
tol = 1e-06;
maxIt = 50;

%backslash
Xb = zeros(1,maxIt);
Yb = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    b = rand(maxIt*n,1);
    tic;
    X = A\b;
    Y = toc;
    Xb(n) = maxIt*n;
    Yb(n) = Y;
end

%Gaussian Elimination
Xg = zeros(1,maxIt);
Yg = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    b = rand(maxIt*n,1);
    tic;
    X = gaussian(A,b);
    Y = toc;
    Xg(n) = maxIt*n;
    Yg(n) = Y;
end

%inverse
Xi = zeros(1,maxIt);
Yi = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    b = rand(maxIt*n,1);
    tic;
    X = inv(A)*b;
    Y = toc;
    Xi(n) = maxIt*n;
    Yi(n) = Y;
end

%Biconjugate Gradients
Xbg = zeros(1,maxIt);
Ybg = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    b = rand(maxIt*n,1);
    tic;
    X = bicg(A,b,tol,maxIt);
    Y = toc;
    Xbg(n) = maxIt*n;
    Ybg(n) = Y;
end

%Conjugate Gradients Square
Xcg = zeros(1,maxIt);
Ycg = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    b = rand(maxIt*n,1);
    tic;
    X = cgs(A,b,tol,maxIt);
    Y = toc;
    Xcg(n) = maxIt*n;
    Ycg(n) = Y;
end

%Symmetric LQ Method
Xs = zeros(1,maxIt);
Ys = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    b = rand(maxIt*n,1);
    tic;
    X = symmlq(A,b,tol,maxIt);
    Y = toc;
    Xs(n) = maxIt*n;
    Ys(n) = Y;
end

%Minimum Residual Method
Xmr = zeros(1,maxIt);
Ymr = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    b = rand(maxIt*n,1);
    tic;
    X = minres(A,b,tol,maxIt);
    Y = toc;
    Xmr(n) = maxIt*n;
    Ymr(n) = Y;
end


%plot
figure;
loglog(Yb,Xb,'-b',Yg,Xg,'-y',Yi,Xi,'-g',Ybg,Xbg,'-r',Ycg,Xcg,'-c',Ys,Xs,'-k',Ymr,Xmr,'-m');
title('Time taken against n');
xlabel('n');
ylabel('Time');
legend('backslash','gaussian','inverse','bicg','cgs','symmlq','minres','Location','southeast');

%% R3.4 full
%Setting up 
tol = 1e-06;
maxIt = 50;

%compare t to n

%backslash
Xb = zeros(1,maxIt);
Yb = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    A = full(A);
    b = rand(maxIt*n,1);
    tic;
    X = A\b;
    Y = toc;
    Xb(n) = maxIt*n;
    Yb(n) = Y;
end

%Gaussian Elimination
Xg = zeros(1,maxIt);
Yg = zeros(1,maxIt);
% for n = 5:30
%     A = sprandn(maxIt*n,maxIt*n,0.3);
%     A = full(A);
%     b = rand(maxIt*n,1);
%     tic;
%     X = gaussian(A,b);
%     Y = toc;
%     Xg(n) = maxIt*n;
%     Yg(n) = Y;
% end

%inverse
Xi = zeros(1,maxIt);
Yi = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    b = rand(maxIt*n,1);
    tic;
    X = inv(A)*b;
    Y = toc;
    Xi(n) = maxIt*n;
    Yi(n) = Y;
end

%Biconjugate Gradients
Xbg = zeros(1,maxIt);
Ybg = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    A = full(A);
    b = rand(maxIt*n,1);
    tic;
    X = bicg(A,b,tol,maxIt);
    Y = toc;
    Xbg(n) = maxIt*n;
    Ybg(n) = Y;
end

%Conjugate Gradients Square
Xcg = zeros(1,maxIt);
Ycg = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    A = full(A);
    b = rand(maxIt*n,1);
    tic;
    X = cgs(A,b,tol,maxIt);
    Y = toc;
    Xcg(n) = maxIt*n;
    Ycg(n) = Y;
end

%Symmetric LQ Method
Xs = zeros(1,maxIt);
Ys = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    A = full(A);
    b = rand(maxIt*n,1);
    tic;
    X = symmlq(A,b,tol,maxIt);
    Y = toc;
    Xs(n) = maxIt*n;
    Ys(n) = Y;
end

%Minimum Residual Method
Xmr = zeros(1,maxIt);
Ymr = zeros(1,maxIt);
for n = 5:30
    A = sprandn(maxIt*n,maxIt*n,0.3);
    A = full(A);
    b = rand(maxIt*n,1);
    tic;
    X = minres(A,b,tol,maxIt);
    Y = toc;
    Xmr(n) = maxIt*n;
    Ymr(n) = Y;
end


%plot
figure;
loglog(Yb,Xb,'-b',Yg,Xg,'-y',Yi,Xi,'-g',Ybg,Xbg,'-r',Ycg,Xcg,'-c',Ys,Xs,'-k',Ymr,Xmr,'-m');
title('Time taken against n');
xlabel('n');
ylabel('Time');
legend('backslash','gaussian','inverse','bicg','cgs','symmlq','minres','Location','southeast');
%%

fun = @cos;
init = 7;
x = fzero(fun,init);
disp(x);