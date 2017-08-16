%% Plots Iris data set into a new figure.

function plot_iris(X, y)

setosa = (X(y==1, :));
virgi = (X(y==2, :));
versi = (X(y==3, :));

figure; hold on;

  plot(setosa(:,1), setosa(:,2), 'k+')
  hold on
  plot(versi(:,1), versi(:,2), 'bo', 'MarkerFaceColor', 'y')
  plot(virgi(:,1), virgi(:,2), 'r+')

  % Labels and Legend
  xlabel('Sepal length (cm)')
  ylabel('Sepal width (cm)')

  % Specified in plot order
  legend('Iris-setosa', 'Iris-versicolor', 'Iris-virginica')
  hold off;

  
hold off;

figure; hold on;

  plot(setosa(:,3), setosa(:,4), 'k+')
  hold on
  plot(versi(:,3), versi(:,4), 'bo', 'MarkerFaceColor', 'y')
  plot(virgi(:,3), virgi(:,4), 'r+')

  % Labels and Legend
  xlabel('Petal length (cm)')
  ylabel('Petal width (cm)')

  % Specified in plot order
  legend('Iris-setosa', 'Iris-versicolor', 'Iris-virginica')
  hold off;

hold off;

end
