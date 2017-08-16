function plotDecisionBoundary(theta, X, y, c)
%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta
%   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the 
%   positive examples and o for the negative examples. X is assumed to be 
%   a either 
%   1) Mx3 matrix, where the first column is an all-ones column for the 
%      intercept.
%   2) MxN, N>3 matrix, where the first column is all-ones

% Plot Data
%plot_iris(X,y);
plot_iris(X(:,2:end), y);
y = y == c;

hold on

if size(X, 2) <= 3

    fprintf('yo\n');
    % Only need 2 points to define a line, so choose two endpoints
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2] % min sepal l, max sepal l

    % Calculate the decision boundary line
    plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1)) % min och max sepal w
    % theta(3) - korrelationskoeff sepal width
    % theta(2) - -''- sepal length
    % theta(1) - konstant term
    
    % Plot, and adjust axes for better viewing
    plot(plot_x, plot_y)
    
    % Legend, specific for the exercise
%    legend('Admitted', 'Not admitted', 'Decision Boundary')
    axis([1, 7, 0, 2.5])
else
    fprintf('yoyoyoyo\n');
    % Here is the grid range
    u = linspace(2, 4.5, 50); %y
    v = linspace(4, 8, 50); %x

    z = zeros(length(u), length(v));
    % Evaluate z = theta*x over the grid
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i), v(j))*theta;
        end
    end
    z = z'; % important to transpose z before calling contour

    % Plot z = 0
    % Notice you need to specify the range [0, 0]
    contour(u, v, z, [0, 0], 'LineWidth', 2)
end
hold off

end
