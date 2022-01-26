%% R5.2

%How many points do we want?
N = 10;

%Pre-allocate memory for the matrix and vector
A = zeros (N,N);
c = zeros (N,1);

tn  = linspace(0,1,N); %need to change for 2(a) since it goes to 1.5

h = tn(2) - tn(1);

%boundary conditions
A(1,1) = 1;
c(1) = 1; %first bc
A(N,N) = 1;
c(N) = exp(1); %end bc

%exact results
fa = @(t) (exp(t.^2));
ya = fa(tn);

%Make matrix
for n = 2:(N-1)
   A(n,n-1) = 1/(h^2);
   A(n,n) = -(2/(h^2) + (4*tn(n)^2) +2);
   A(n,n+1) = 1/(h^2);
   c(n) = 0;
end

U = A\c;

plot(tn,U, 'x',tn,ya);
legend('Finite diff','Exact','Location','north');
title('y" = (2+4t^2)y');
xlabel('time');
ylabel('y-value');

%% R5.3

% w = poisson(0,0.5,0,1,10,10);
w = heatfd(0,1,0,1,10,150);