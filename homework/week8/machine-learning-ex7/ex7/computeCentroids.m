function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%



% 简单做法， for循环，把所有值加起来，除以自己类的个数
sum_K = zeros(K, n);
count_K = zeros(K,1);
for i=1:m,
    sum_K(idx(i),:) = sum_K(idx(i),:) .+ X(i,:);
    count_K(idx(i)) = count_K(idx(i)) + 1;
end
centroids = sum_K./count_K;


% % 扩展idx成为0，1组成的矩阵

% temp = eye(max(idx));
% onehot_idx = temp(idx,:);



% =============================================================


end

