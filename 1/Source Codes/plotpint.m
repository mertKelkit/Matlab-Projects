%Mert KELKÝT - 150115013
%Rümeysa ELÝÖZ - 150114016
%Question 1

function plotpint( coef, x1, x2, numpoints )

%creating a vector from x1 to x2 for x values.
xValues = linspace(x1, x2, numpoints);
%we need a flipped matrix in order to use polyval function because polyval
%function takes first coefficient from the last index.
flippedCoef = fliplr(coef);
%evaluating polynomial value.
polynomial = polyval(flippedCoef, xValues);

%taking derivative and creating a new coefficient matrix.
%this operation decreases 1 the exponent and multiplies by the old coefficient. 
derivativeCoef = coef(2:end).*(linspace(1, size(coef,2)-1, size(coef,2)-1)); % Derivative coefficients
%we need a flipped vector in order to use polyval function
flippedDerivativeCoef = fliplr(derivativeCoef);
%taking derivatived values with polyval function
derivativePolynomial = polyval(flippedDerivativeCoef, xValues);

%taking integral and creating a new coefficient matrix.
integrationCoef = linspace(0, 0, size(coef,2)+1);
%setting c = 1.
integrationCoef(1) = 1;
%integration operation
%increasing the exponent by one and divide coefficient by it.
integrationCoef(2:end) = coef./(linspace(1, size(coef,2), size(coef,2)));
%flipping vector to use polyval function
flippedIntegrationCoef = fliplr(integrationCoef);
%taking integrated values of the polynomial
integratedPolynomial = polyval(flippedIntegrationCoef, xValues);

%plotting all of them in the same graph
plot(xValues, polynomial, '-o', xValues, derivativePolynomial, '-o', xValues, integratedPolynomial, '-o');
grid on
xlabel('x values');
ylabel('y values');
%setting title
title('Graph of a polynomial, it''s derivative and it''s integral:');
%setting legend
legend('Polynomial', 'Derivative', 'Integral', 'location', 'best')
end
