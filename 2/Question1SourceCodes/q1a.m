% Mert Kelkit 150115013
% R�meysa Eli�z 1501114016
% Project #2 
% Question 1 part a

% three websites
ctr = 3;

% shared links matrice
links = sparse(3,3);
% importance matrix
Importance = sparse(3,1);
% temporary importance matrix in order to calculate error rates 
% and updating importances.
tempimp = sparse(3,1);

% all websites have importance 1 at the begining
for i=1:ctr
    Importance(i,1) = 1;
end

% initializing links as in the assignment pdf
links(1,1) = 0.5;
links(1,3) = 0.5;
links(2,3) = 0.5;
links(3,1) = 0.5;
links(3,2) = 1;

% error rates initialized here
% these error rates are for loop-exiting conditions
ITUError = 1;
BogaziciError = 1;
MarmaraError = 1;
% this loop does matrix multiplication in order to calculate next website
% importances, also calculates the error rate between new and old
% importances. If this error rate is negligible, we exit from loop 
while(~(ITUError<(10^-7) && BogaziciError<(10^-7) && MarmaraError<(10^-7)))
    tempimp = links * Importance;
    ITUError = Importance(1,1)-tempimp(1,1);
    MarmaraError = Importance(2,1)-tempimp(2,1);
    BogaziciError = Importance(3,1)-tempimp(3,1);
    Importance = tempimp;
end

% Row names
Schools = categorical({'ITU';'Marmara';'Bogazici'});
% summing every vector elements
sum = 0;
for i=1:3
    sum = sum + Importance(i);
end
% normalizing final vector which is dividing every elements of vector with
% sum of the elements
Importance = Importance./sum;
% Displaying table
display(table(Schools,Importance));