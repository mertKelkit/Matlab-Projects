%Mert KELKÝT - 150115013
%Rümeysa ELÝÖZ - 150114016
%Question 3 - a

%Using Monte Carlo Simulation to approximate the pi value
function zpi = mypi( numpoints )
%success counter
t = 0;

%loop starts with one to numpoints(input)
for k = 1 : numpoints
    %generating random x and y coordinates between 0 and 1
    %because of unit circle !!!
    %random because of Monte Carlo Simulation
    x = rand(1);
    y = rand(1);
    
    %if randomly generated x and y points are in the unit circle
    if (x^2 + y^2)^(1/2) < 1
        %increment success
        t = t + 1;
    end
end
%it gives us approximate pi value 
zpi = 4 * t / numpoints;
end

