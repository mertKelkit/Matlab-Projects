%Mert KELKÝT - 150115013
%Rümeysa ELÝÖZ - 150114016
%Question 2

%evaluating x values
x = linspace(pi, 6*pi, 2000);
%making vector multiplication with the function
y = 3.*sin((x.^(3.*x))./x).*tan(log(3.*(exp(1).^(0.2.*sin(x))).*x));
%plotting x values with the corresponding y values.
plot(x, y)
grid on;
xlabel('x values pi to 6*pi');
ylabel('y values');
title('funcplot');