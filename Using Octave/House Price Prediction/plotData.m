function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

% Instructions: Plot the training data into a figure using the 
%               "figure" and "plot" commands. 

figure;                                  % open a new figure window

plot(x,y,'rx', 'MarkerSize', 4)          % Plot the data Points

% Hint: You can use the 'rx' option with plot to have the markers
%       appear as red crosses. Furthermore, you can make the
%       markers larger by using plot(..., 'rx', 'MarkerSize', 10);

xlabel('Population of City in 10,000s'); % Set the X - axes labels as "Population"
ylabel('Profit in $10,000s');            % Set the Y - axes labels as "Profit"

% ============================================================

end
