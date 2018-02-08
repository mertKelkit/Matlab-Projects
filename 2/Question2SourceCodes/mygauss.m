% Mert Kelkit 150115013
% Rümeysa Eliöz 150114016
% Project #2
% Question 2 ( mygauss function )

function [singular, x] = mygauss(A, b)

% getting one dimension of A matrix, it's n x n
n = length(A);
% pivoting vector
p = (1:n)'; 
% find maximum of each row
s = max(abs(A'));
for k=1:(n-1)
    % divide first column's elements to their s to find ratios
    % (s is maximum element of each row)
    r = abs(A(p(k),k)/s(p(k)));
    kp = k; 
    for i=(k+1):n
        t = abs(A(p(i),k)/s(p(i)));
        % if t is larger than r, swap rows
        if t > r
            r = t;
            kp = i;
        end
    end
    % maximum ratio row will be on the top
    l = p(kp);  p(kp) = p(k);  p(k) = l; 
    % finding multipliers and making basic row operations in order the give
    % upper triangular shape to the matrix
    for i=(k+1):n
        A(p(i),k) = A(p(i),k)/A(p(k),k);
        for j=(k+1):n
            A(p(i),j) = A(p(i),j)-A(p(i),k)*A(p(k),j);
        end
    end
end

% now forward substition
y(1) = b(p(1));
for i=2:n
    y(i) = b(p(i));
    for j=1:(i-1)
        y(i) = y(i)-A(p(i),j)*y(j);
    end
end

% after upper triangular matrix, apply backward substition
% column vector with n rows
x = zeros(n,1);
x(n) = y(n)/A(p(n),n);
for i = (n-1):-1:1
% initializing and solving x vector
x(i) = y(i);
    for j=(i+1):n
        x(i) = x(i)-A(p(i),j)*x(j);
    end
    x(i) = x(i)/A(p(i),i);
end

singular = 0;
for i=1:n;
    % if one of the elements of x is not a number or infinity, it means
    % that eqaution is singular
    if isinf(x(i)) == 1 || isnan(x(i)) == 1
        singular = 1; 
    end
end
end