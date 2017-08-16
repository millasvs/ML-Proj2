%% Computes the sigmoid function of z, where
%% z can be a vector, scalar or matrix
function g = sigmoid(z)

g = zeros(size(z));
ones_ = ones(size(z));

g = ones_./(1 + exp(-z));

end
