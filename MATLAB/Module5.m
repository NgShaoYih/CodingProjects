%% 5.1
x = 0.1;
xf = fzero(@solver, x);

[t1,y1] = ode45(@equation,[0 1],[1 xf]);

fa = @(t) (exp(t.^2));
ya = fa(t1);

figure;
plot(t1,y1(:,1),'xb',t1,ya,'-r');
legend('Shooting method','Exact','Location','North');
title('y" = (2+4t^2)y');
xlabel('time');
ylabel('y-value');

%functions
function dy = equation(t,y)
    dy = zeros(2,1);
    dy(1) = y(2);
    %1a)
%     dy(2) = y(1) + (2/3)*exp(t);
    %1b)
    dy(2) = (2 + 4.*t.^2)*y(1);
    %2b)
%     dy(2) = 3*y(1) - 2*y(2);
end

%solver function
function f = solver(x)
    [t,u] = ode45(@equation,[0 1],[1 x]);
    bc = exp(1);
    
    f = u(end,1) - bc;
end
