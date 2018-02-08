% Mert Kelkit 150115013
% Rümeysa Eliöz 150114016
% Project #2
% Question 2 - Test script

% testing mygauss function
% solvable equation
A1 = [1, 2, 3; 2, 3, 5; 6, 2, 1];
b1 = [3; 5; 2];
[singular1, x1] = mygauss(A1, b1)

% singular equation
A2 = [1, 2, 3; 2, 3, 5; 2, 3, 5];
b2 = [3; 5; 4];
[singular2, x2] = mygauss(A2, b2)

% solvable bigger equation
A3 = [1, 2, 7, 9, 3; 2, 3, 5, 7, 1; 2, 3, 5, 0, 1; 2, 5, 6, 1, 7; 1, 3, 2, 7, 9];
b3 = [17; 15; 32; 21; 10];
[singular3, x3] = mygauss(A3, b3)

% testing mygauss function with built-in matrix solver
x1 = mldivide(A1, b1)
x2 = mldivide(A2, b2)
x3 = mldivide(A3, b3)