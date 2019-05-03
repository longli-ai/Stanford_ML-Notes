function g = sigmoidGradient(z)
%SIGMOIDGRADIENT returns the gradient of the sigmoid function
%evaluated at z
%   g = SIGMOIDGRADIENT(z) computes the gradient of the sigmoid function
%   evaluated at z. This should work regardless if z is a matrix or a
%   vector. In particular, if z is a vector or matrix, you should return
%   the gradient for each element.

g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the gradient of the sigmoid function evaluated at
%               each value of z (z can be a matrix, vector or scalar).


% 难点在g的矩阵大小：g的大小和z相同
% 正常sigmoid的导数，直接能求出来
% sigmoid(z)和1.-sigmoid(z)，这两项没啥问题
% 比如z是nx1,1.-sigmoid(z)也是nx1
% g应该也是nx1，所以需要前后两项点乘才能得到nx1大小矩阵
g = sigmoid(z).*(1.-sigmoid(z));


% =============================================================




end
