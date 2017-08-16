%% Computes cost and gradient for regularized logistic regression,
%% using lambda as regularisation parameter
function [J, grad] = cost_func_reg(theta, X, y, lambda)

  m = length(y); % number of training examples

  J = 0;
  grad = zeros(size(theta));

  A = sum( (-y) .* log(sigmoid(X * theta)) );
  B = sum( (1 - y) .* log(1 - sigmoid(X * theta)) );

  J =  (A - B)/m;

  reg(1) = 0;

  for ii = 2:size(theta, 1)
      reg(ii) = theta(ii)^2;
  end

  reg = sum(reg);
  reg = (lambda * reg) / (2 * m);

  J = J + reg;

  temp = (sigmoid(X * theta) - y) .* X(:,1);
  grad(1) = sum(temp)/m;

  for ii = 2:size(theta, 1)
      temp = (sigmoid(X * theta) - y) .* X(:,ii);
      temp = sum(temp)/m;
      grad(ii) = temp + (lambda * theta(ii)) / m;
  end


end
