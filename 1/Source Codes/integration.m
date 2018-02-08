%Mert KELKÝT - 150115013
%Rümeysa ELÝÖZ - 150114016
%Question 4-b

%h values
h1 = 0.01;
h2 = 0.1;
h3 = 1;

%boundaries
a = 1.8;
b = 3.2;

%trapezoidal rule with h = 0.01
%generating x values for h = 0.01
x1h1 = a:h1:b;
%evaluating y values with a for loop
for i = 1:size(x1h1, 2)
y1h1(i) = functionforq4(x1h1(i));
end
%evaluating sum of y values but first element and last element must be
%divided by two.
sumy1h1 = sum(y1h1) - ((y1h1(1)+y1h1(end))./2);
%multiplying by h gives us the integration
i1h1 = sumy1h1*h1;
%trapezoidal rule with h = 0.1
%getting x values
x1h2 = a:h2:b;
%evaluating y values with a for loop
for i = 1:size(x1h2, 2)
y1h2(i) = functionforq4(x1h2(i));
end
%evaluating sum of y values but first element and last element must be
%divided by two.
sumy1h2 = sum(y1h2) - ((y1h2(1)+y1h2(end))./2);
%multiplying by h gives us the integration
i1h2 = sumy1h2*h2;
%trapezoidal rule with h = 1
%getting x values.
x1h3 = a:h3:b;
%evaluating y values with a for loop
for i = 1:size(x1h3, 2)
y1h3(i) = functionforq4(x1h3(i));
end
%evaluating sum of y values but first element and last element must be
%divided by two.
sumy1h3 = sum(y1h3) - ((y1h3(1)+y1h3(end))./2);
%multiplying by h gives us the integration
i1h3 = sumy1h3*h3;

rowNames = {'h = 0.01'; 'h = 0.1'; 'h = 1'};
Trapezoidal_Rule = [i1h1; i1h2; i1h3];
table(Trapezoidal_Rule, 'RowNames', rowNames)







