% Mert Kelkit 150115013
% Rümeysa Eliöz 150114016
% Project #2
% Question 3 ( cubicspline.m function )

% the function which gives us coefficients of cubic spline
function [a, b, c, d] = cubicspline(t, y)
% length of time parameter, how many poinst are clicked
n = length(t);
% intervals
for i=1:n-1
    h(i) = t(i+1) - t(i);    
end

for i=2:n-1
    k(i) = 3.*(y(i+1)-y(i))./h(i)-3.*(y(i)-y(i-1))./h(i-1);
end
j(1) = 0;
z(1) = 0;
for i=2:n-1
   l(i) = 2.*(t(i+1)-t(i-1))-h(i-1).*j(i-1);
   j(i) = h(i)./l(i);
   z(i) = (k(i)-(h(i-1).*z(i-1)))./l(i);
end
j(n+1)=0;
c(n+1)=0;
% solves the coefficients from last to first
for i=n-1:-1:1
    % first coefficient is 
    a(i) = y(i);
    c(i) = z(i)-(j(i).*c(i+1));
    b(i) = ((y(i+1)-y(i))/h(i))-(h(i).*(c(i+1)+2.*c(i))./3);
    d(i) = (c(i+1)-c(i))./(3.*h(i));
end
end