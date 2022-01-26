% function for gaussian elimination
% where a is the matrix input for the equations and 
% b is the matrix input for the answers
% x is the matrix return

function x = gaussian(a, b)
    
n = size(a);

% elimination step taken from Sauer textbook
for j = 1 : n-1
   if abs(a(j,j)) <eps 
       error(' zero pivot encountered'); 
   end
   for i = j+1 : n
       mult = a(i,j)/a(j,j);
       for k = j+1 : n
           a(i,k) = a(i,k) - mult*a(j,k);
       end
       b(i) = b(i) - mult*b(j);
   end
 
end

% back-substitution taken from the Sauer textbook
for i = n : -1 : 1
   for j = i+1 : n
       b(i) = b(i) - a(i,j)*x(j);
   end
   x(i) = b(i)/a(i,i);
    
end

end