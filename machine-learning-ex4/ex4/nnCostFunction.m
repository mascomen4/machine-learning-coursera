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

X = [ones(m,1) X];

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

% Building y matrix
y_matrix = zeros(length(y), size(Theta2,1));

for i=1:m
  vector = zeros(1,size(Theta2,1));
  vector(y(i)) = 1;
  y_matrix(i,:) = vector;
endfor


% Part 1
for i=1:m
  a2 = sigmoid(Theta1*X(i,:)');
  a2 = [1;a2];
  h = sigmoid(Theta2*a2);
  % Cost  function
  temp = 0;
  for j=1:size(Theta2,1)
    temp = temp + y_matrix(i,j)*log(h(j)) + (1-y_matrix(i,j))*log(1-h(j));
  endfor
  J = J + temp;
endfor

J = (-1/m)*J;

% Part 3. Computing the regularization
reg = 0;
for i=1:size(Theta1,1) % Iterations without bias parameter
  for j=2:size(Theta1,2)
    reg = reg + Theta1(i,j)^2;
  endfor
endfor

for i=1:size(Theta2,1) % Iterations without bias parameter
  for j=2:size(Theta2,2)
    reg = reg + Theta2(i,j)^2;
  endfor
endfor

reg = reg*(lambda/(2*m));

J = J + reg;

% Part 2. The backpropagation

%Deltas
delta1 = zeros(size(Theta1));
delta2 = zeros(size(Theta2));

for i=1:m
  a2 = sigmoid(Theta1*X(i,:)');
  a2 = [1;a2];
  h = sigmoid(Theta2*a2);
  
  sigma3 = h - y_matrix(i,:)';
  sigma2 = (Theta2)'*sigma3.*(a2.*(1-a2));
  
  delta1 = delta1 + (sigma2*(X(i,:)))(2:end,:);
  delta2 = delta2 + sigma3*(a2');
endfor


% Computing deltas
Theta1_grad = (1/m).*delta1 + (lambda/m).*Theta1;
Theta1_grad(:,1) = (1/m).*delta1(:,1);
Theta2_grad = (1/m).*delta2 + (lambda/m).*Theta2;
Theta2_grad(:,1) = (1/m).*delta2(:,1);


% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
