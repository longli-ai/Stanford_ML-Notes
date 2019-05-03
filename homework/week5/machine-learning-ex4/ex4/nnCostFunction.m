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


% Part 1: Feedforward the neural network and return the cost in the
% 查看矩阵大小，基本都需要加theta0项
a1 = [ones(m, 1) X];
z2 = a1*Theta1';
a2 = sigmoid(z2);

% 查看矩阵大小，基本都需要加theta0项
a2 = [ones(m, 1) a2];
z3 = a2*Theta2';
a3 = sigmoid(z3);
pred = a3;


% 解决one-hot encoder y_new
y_new = zeros(m,num_labels);
for i=1:m,
    y_new(i,y(i)) = 1;
end;




% 开始计算J两个内循环，之后考虑向量化
temp1 = 0;
for i=1:m,
    temp2 = 0;
    for k=1:num_labels,
        temp2 = temp2 + (-y_new(i,k)*log(pred(i,k))-(1-y_new(i,k))*log(1-pred(i,k)));
    end;
    temp1 = temp1 + temp2;
end;

% J = 1/m * temp1;

% 下面开始考虑带正则化参数的损失函数
J_temp = 1/m *temp1;


reg_temp = 0;

% % 计算theta1 theta2的大小
% [theta1_j, theta1_k] = size(Theta1);
% [theta2_j, theta2_k]= size(Theta2);
% for j=1:theta1_j,
%     for k=2:theta1_k,
%         reg_temp = reg_temp + Theta1(j,k)^2;
%     end;
% end;
% for j=1:theta2_j,
%     for k=2:theta2_k,
%         reg_temp = reg_temp + Theta2(j,k)^2;
%     end;
% end;

% 简化上面的写法
reg_temp = sum(sum(Theta1(:,2:size(Theta1,2)).^2));
reg_temp = reg_temp + sum(sum(Theta2(:,2:size(Theta2,2)).^2));

% 带正则化的损失函数
J = J_temp + lambda/(2*m)*reg_temp;


% Part 2: Implement the backpropagation algorithm to compute the gradients

Delta_1 = zeros(size(Theta1));
Delta_2 = zeros(size(Theta2));

% step 1
% 查看矩阵大小，基本都需要加theta0项
a_1 = X;
a_1 = [ones(m, 1) X];
z_2 = a_1*Theta1';
a_2 = sigmoid(z_2);

% 查看矩阵大小，基本都需要加theta0项
a_2 = [ones(m, 1) a_2];
z_3 = a_2*Theta2';
a_3 = sigmoid(z_3);


% step 2

delta_3 = a_3 - y_new;

% step 3
% %debug
% size(Theta2)  % 4x5
% size(delta_3)  % 16x4
% size(a_2) % 16x5

% temp_g = a_2 .* (1.-a_2);

% size(delta_3) %16x4
% size(Theta2) % 4x5
% size((delta_3*Theta2)) % 16x5
% size(sigmoidGradient(z_2)) % 16x4

temp_g = a_2.*(1.-a_2); 
% size(temp_g) %16x5

delta_2 = delta_3*Theta2 .* temp_g; % 1x26 矩阵

%delta_2 = delta_2(2:end); % remove delta_2(1);
delta_2 = delta_2(:,2:end);


% step 4
% %debug
% size(a_2) % 16x5
% size(delta_3) % 16x4
% size(Delta_2) % 4x5

Delta_2 = Delta_2 + delta_3'*a_2; % 10x26 矩阵


% fprintf('a_1\n')
% size(a_1) % 16x3
% size(delta_2) % 16x5
% size(Delta_1) % 4x3

Delta_1 = Delta_1 + delta_2'*a_1; % 25x401 矩阵


% step 5 
% Theta1_grad = 1/m * Delta_1;
% Theta2_grad = 1/m * Delta_2;


% Part 3: Implement regularization with the cost function and gradients.
% update step 5 for regularizations
Theta1_grad(:,1) = 1/m * Delta_1(:,1);
Theta2_grad(:,1) = 1/m * Delta_2(:,1);
Theta1_grad(:,2:end) = 1/m * Delta_1(:,2:end) + lambda/m * Theta1(:,2:end);
Theta2_grad(:,2:end) = 1/m * Delta_2(:,2:end) + lambda/m * Theta2(:,2:end);

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
