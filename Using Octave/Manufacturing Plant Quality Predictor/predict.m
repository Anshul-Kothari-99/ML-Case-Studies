function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a 
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

m = size(X, 1); % Number of training examples

% You need to return the following variables correctly
p = zeros(m, 1);

% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters. 
%               You should set p to a vector of 0's and 1's
%

%hypothesis = 1 ./ (1 + exp(-X*theta)); 

% y is greater than / equal to 0.5 when x is greater than / equal to zero;
% similarly when y is less than 0.5, x corresponds to less than zero.

x_axis = X*theta;

pos = find(x_axis>=0); % extracting Indexes for whose the value is more than / equal to 0.5
neg = find(x_axis<0);  % extracting Indexes for whose the value is less than 0.5
p(pos)=1; 
p(neg)=0;

end
