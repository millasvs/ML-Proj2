% Split the data set into a training set
% a test set using
% the following proportions:
% training set: 70%
% test set: 30%

function [X_train y_train X_test y_test] = ...
    split_training_set(X, y)
    
  % shuffle the rows of X and y
  all = [X y];
  all = all(randperm(size(all,1)),:);
  
  X = all(:, 1:size(X,2));
  y = all(:, size(X,2)+1:end);
  
  m = size(X, 1); % number of training examples
  mtrain = ceil(0.7*m);

  X_train = X(1:mtrain, :);
  X_test = X(mtrain+1:end, :);

  y_train = y(1:mtrain, :);
  y_test = y(mtrain+1:end, :);
    
    
end    