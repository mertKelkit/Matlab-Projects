%Mert KELKÝT - 150115013
%Rümeysa ELÝÖZ - 150114016
%Question 4-a

% we wrote a function named functionforq4 for this script to make
% computations easily.
x = pi;
h1 = 0.01;
h2 = 0.1;
h3 = 1;
% h = 0.01 , 2-point method
h1d1 = (functionforq4(x+h1)-functionforq4(x))/h1; 
% h = 0.1 , 2-point method
h2d1 = (functionforq4(x+h2)-functionforq4(x))/h2;
% h = 1 , 2-point method
h3d1 = (functionforq4(x+h3)-functionforq4(x))/h3;
% h = 0.01 , 3-point method
h1d2 = ((-3*functionforq4(x))+(4*functionforq4(x+h1))-(functionforq4(x+(2*h1))))/2*h1;
% h = 0.1 , 3-point method
h2d2 = ((-3*functionforq4(x))+(4*functionforq4(x+h2))-(functionforq4(x+(2*h2))))/2*h2;
% h = 1 , 3-point method
h3d2 = ((-3*functionforq4(x))+(4*functionforq4(x+h3))-(functionforq4(x+(2*h3))))/2*h3;
% h = 0.01 , 5-point method
h1d3 = (functionforq4(x-(2*h1))-8*(functionforq4(x-h1))+8*(functionforq4(x+h1))-functionforq4(x+(2*h1)))/(12*h1);
% h = 0.1 , 5-point method
h2d3 = (functionforq4(x-(2*h2))-8*(functionforq4(x-h2))+8*(functionforq4(x+h2))-functionforq4(x+(2*h2)))/(12*h2);
% h = 1 , 5-point method
h3d3 = (functionforq4(x-(2*h3))-8*(functionforq4(x-h3))+8*(functionforq4(x+h3))-functionforq4(x+(2*h3)))/(12*h3);

%Setting up table...
rowNames = {'h = 0.01'; 'h = 0.1'; 'h = 1'};
Two_Point_Method = [h1d1; h2d1; h3d1];
Three_Point_Method = [h1d2; h2d2; h3d2];
Five_Point_Method = [h1d3; h2d3; h3d3];
table(Two_Point_Method, Three_Point_Method, Five_Point_Method, 'RowNames', rowNames)


