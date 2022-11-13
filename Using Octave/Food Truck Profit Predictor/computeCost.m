function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y);                                % number of training examples

J = 0;
        
% This variable J will be corrosponding to the computed 
% cost which should be further minimumized to obtain the 
% optimim value for Theta.

% Instructions: Compute the cost of a particular choice of theta
%               and set J to the cost.

hypothesis = X * theta;                       % Hypothesis for our linear regression
cost_vector = hypothesis - y;
cost_squared = cost_vector.*cost_vector;
J = sum(cost_squared)/(2*m);

% =========================================================================

end