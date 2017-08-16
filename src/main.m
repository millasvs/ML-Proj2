%% Using logistic regression on the classical Iris data set,
%% taken from UCI: http://archive.ics.uci.edu/ml/datasets/Iris

clear ; close all; clc

% (there might be a more efficient way to get data from the file, 
% but it was the first one that worked for me)
[a, b, c, d, e] = textread ('iris.txt', ...
"%f %f %f %f %s", "delimiter", ",");

%% prepare data set
  X = [a b c d];
  y = e;
  
  % convert the y vector into classes "1", "2" and "3"
  class_one = strcmp(y(:,1),'Iris-setosa');
  class_two = strcmp(y(:,1),'Iris-virginica')*2;
  class_three = strcmp(y(:,1),'Iris-versicolor')*3;
  y = class_one + class_two + class_three;
  num_labels = 3;

  % plot iris data set
  plot_iris(X, y);  
  
  % divide into training and test set  
  [X y X_test y_test] = split_training_set(X, y);

  % add constant term
  [m n] = size(X);
  X = [ones(m, 1) X];
  [m n] = size(X_test);
  X_test = [ones(m, 1) X_test];
  
  % fitting parameters
  init_theta = zeros(size(X, 2), 1);

  % regularization parameter 
  lambda = 1;

  options = optimset('GradObj', 'on', 'MaxIter', 400);

  all_y = [y_test == 1 y_test == 2 y_test == 3];
  
  classes = [ 'iris-setosa' ; 'iris-virginica' ; 'iris-versicolor'];

  for c = 1:num_labels
  
    y_temp = y == c;
    
    % find min of cost function using library function fminunc
    [theta, J, exit_flag] = ...
      fminunc(@(t)(cost_func_reg(t, X, y_temp, lambda)), init_theta, options);

    all_theta(c,:) = theta;

    % compute accuracy on our training set
    prediction = sigmoid(X_test * theta)>= 0.5;
    answer = y_test == c;
    all_preds(:,c) = prediction;
    fprintf('Training accuracy for class %s: %f\n', classes(c,:), ...
    mean(double(prediction == answer)) * 100);
  end
  
  pause;
  fprintf('\n\n');
  fprintf('Overall training accuracy: %f\n', mean( mean(double(all_preds == all_y)) ) * 100);

  %% Testing the predictions on new data
  test = [ [1 7 4 6 2] ; [1 4 2 1 0] ; [1 7.5 4 6.5 2] ; [1 6 3 4 1.5] ;
  [1 6 3 4 1.5]];

  for i = 1:5
    p = sigmoid(test(i,:) * all_theta');
    [prob class] = max(p);
    fprintf(['For a flower with %f cm in sepal length, %f cm in sepal width,'...
    '%f cm in petal length and %f cm in petal width the likely class would be %s' ...
    ' with a probability of %f\n'], test(i,2), test(i,3), test(i,4), ...
    test(i,5), classes(class,:), prob);    
  end
     
%TODO: plot decision boundary?
    % plot boundary between classes - hard to do when there are more
    % features than two
%    plotDecisionBoundary(theta, X, y);
%    hold on;
%    title(sprintf('lambda = %g', lambda))
%    hold off;