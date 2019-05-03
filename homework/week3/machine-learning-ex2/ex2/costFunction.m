function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

% %% use single examples to calculate
% % for each examples calculations
% J_temp = 0;
% for i=1:m,
%   temp1 = log(sigmoid(X(i,:)*theta)) * y(i);
%   temp2 = log(1-sigmoid(X(i,:)*theta))*(1-y(i));
%   J_temp = J_temp + (temp1+temp2);
% end;
% J = -1/m *J_temp;

% for j=1:size(theta),
%   % grad(j) = 1/m * sum((X'*(sigmoid(X*theta)- y))(j)); % grad method 1
%   grad(j) = 1/m * X(:,j)'*(sigmoid(X*theta)-y); % grad method 2
% end;



% for all examples calculations
cost1 = y'* log(sigmoid(X*theta)); 
cost0 = (1 .- y)'*log(1 .- sigmoid(X*theta));
J = - 1/m * (cost1+cost0);


grad = 1/m * (X'*(sigmoid(X*theta)-y)); % grad method 3

% =============================================================

end
