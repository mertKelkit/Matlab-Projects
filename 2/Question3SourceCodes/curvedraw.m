% Mert Kelkit 150115013
% Rümeysa Eliöz 150114016
% Project #2
% Question 3 ( curvedraw.m script )


% there will be a grid on the graphic
grid on
% getting x and y coordinates using ginput
% using without any parameter, because we have no data points restriction
[x, y] = ginput();
x
y
% assigning length of x to n in order to create a time vector
% which is 1 to n
n = length(x);
time = linspace(1,n,n);
% getting transposes of x and y vectors in order to use them in function
% cubicspline.
x = x';
y = y';
% calling cubicspline functions seperately x and y values depending on time
% and assigning outputs with coefficients.
[ax,bx,cx,dx] = cubicspline(time ,x);
[ay,by,cy,dy] = cubicspline(time ,y);

% evaluating spline equations Sx and Sy depending on time
for i = 1:n-1
    % drawing continuous functions...
    values = linspace(i,i+1,1000);
    % general spline equations for x and y
    % a + b (x-x0) + c (x-x0)^2 + d (x-x0)^3
    % x0 or y0 is the first clicked point between one interval(2 points).
    Sx = ax(i) + (bx(i).*(values-time(i))) + (cx(i).*((values-time(i)).^2)) + (dx(i).*((values-time(i)).^3));
    Sy = ay(i) + (by(i).*(values-time(i))) + (cy(i).*((values-time(i)).^2)) + (dy(i).*((values-time(i)).^3));    
    
    hold on
    % plotting Sx, Sy equations, mark points with a circle
    plot(x, y, 'o', Sx, Sy)
end