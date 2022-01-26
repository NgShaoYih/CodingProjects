%x = [0:0.01:10];
%y = sin(4*pi*x).*exp(-x);
%plot(x,y);

X = [16 3 5 10 1];
my_odd_even(X)

function out = my_odd_even(X)
X = X(:);

    for i = 1:length(X)
        if mod(X(i),2) ~= 0
            fprintf('%f Odd\n', X(i));
        else 
            fprintf('%f Even\n', X(i));
        end
    end
end
