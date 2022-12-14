function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

a1 = [ones(size(X, 1),1) X];

z2 = a1*Theta1';
a2 = sigmoid(z2);

a2 = [ones(size(a2, 1),1) a2];

z3 = a2*Theta2';
a3 = sigmoid(z3);

[probability,prediction] = max(a3');

p = zeros(size(a3));
for i = 1:m
  p(i, prediction(i)) = 1;
end
%prediction(find(prediction==10)) = 0;

training_y = zeros(size(a3));
for i = 1:m
  training_y(i, y(i)) = 1;
end

##size(a3)
##size(p)
##size(prediction(:))
##p(990:1010,:)

hypothesis = a3;

##for i = 1:m
##  for k = 1:10
##    temp = temp + (-p(i,k)*log(hypothesis(i,k)) - (1-p(i,k))*log(1-hypothesis(i,k)));
##    endfor
##end

##for i = 1:m
##    temp = temp - (log(hypothesis(i,:))*p(i,:)' + log(1-hypothesis(i,:))*(1-p(i,:))');
##end

%J = sum(log(hypothesis)*p' + log(1-hypothesis)*(1-p)')/m;

%Unregularized Cost Implementation
%J = sum(diag(-log(hypothesis)*training_y' - log(1-hypothesis)*(1-training_y)'))/m;  

Theta1_nonBaise = Theta1(:,2:end);
Theta2_nonBaise = Theta2(:,2:end);

regularization_parameter = lambda*(sum(Theta1_nonBaise(:).^2) + sum(Theta2_nonBaise(:).^2))/2;
J = (sum(diag(-log(hypothesis)*training_y' - log(1-hypothesis)*(1-training_y)')) + regularization_parameter)/m;

% ----------------------------------------------------------------------------------------------------

Delta2 = 0;
Delta1 = 0;

delta3 = hypothesis-training_y;
delta2  = delta3*Theta2_nonBaise.*sigmoidGradient(z2);

##Delta2 = Delta2 + delta3'*a2 + lambda*Theta2;
##Delta1 = Delta1 + delta2'*a1 + lambda*Theta1;

Delta2 = Delta2 + delta3'*a2 + lambda*[zeros(size(Theta2_nonBaise, 1),1) Theta2_nonBaise];
Delta1 = Delta1 + delta2'*a1 + lambda*[zeros(size(Theta1_nonBaise, 1),1) Theta1_nonBaise];

Theta1_grad = Delta1/m; 
Theta2_grad = Delta2/m;

%size(delta2)

##delta2  = Theta2'*delta3'*sigmoidGradient(z2);
##
##Delta2 = Delta2 + delta3'*a2;
##
##delta2 = delta2(2:end,:);
##Delta1 = Delta1 + delta2'*a1;
##
##Theta1_grad = Delta1/m; 
##Theta2_grad = Delta2/m;

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
