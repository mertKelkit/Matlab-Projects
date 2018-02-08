%Mert KELKÝT - 150115013
%Rümeysa ELÝÖZ - 150114016
%Question 3 - b

%creating a vector 10 to 10000 with 200 elements
x = linspace(10, 10000, 200);
%creating a pi vector which is full of 200 pi numbers.
piVector = repmat(pi, 1, 200);
%creating a y vector with 200 zeros.
y = zeros(1, 200);
%1 to 200...
for i = 1 : 200
    %calculate absolute error and add it to y vector's corresponding index.
    y(i) = mypi(x(i)) - piVector(i); 
end
%plot and plot settings
plot(x, y, '-ro')
grid on;
xlabel('number of datapoints');
ylabel('absolute error between pi and mypi');
title('Absolute error between real pi and generated from mypi function:');
legend('Absolute Error');