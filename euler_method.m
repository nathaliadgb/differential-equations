close all;
clear all;

## Numerical methods parameter 
# Diferential equation declaration
function yl = f(x,y)
   yl = 1 + x - y;
end
# Number of points 
n_points = 50;
# Step size
h = 0.1;
# Coordinates for initial value
x0 = 0;

plot_data = zeros(n_points,1)

# Plotting different isoclines
for y0 = -5:0.5:5

  # Auxiliary variables
  points = zeros(n_points, 2);
  xn = x0;
  yn = y0;
  xn1 = 0;
  yn1 = 0;

  for i = 1:n_points
    points(i,:) = [xn yn];
    yl = f(xn, yn);
    xn1 = xn + h;
    yn1 = yn + h*yl;
    xn = xn1;
    yn = yn1;
  endfor

  # Save to plot the result
  plot_data = [plot_data points(:,1)];
  plot_data = [plot_data points(:,2)];
  
endfor

# Remove zeros column
plot_data(:,1) = [];

# plot data for all isoclines
plot(plot_data);