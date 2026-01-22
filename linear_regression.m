% Linear Regression
clearvars, clc, clf, close all;

% ask how many *random* data points to generate
n = input("How many random data points do you want?");

data_vals = randi([-1000, 1000], 2, n);

% graph all randomly-generated data points
figure;
for i = 1:n 
    plot(data_vals(1,i), data_vals(2,i), 'b.'); hold on;  
end

x_vals = data_vals(1, 1:n); % get x values vector from original data values matrix
y_vals = data_vals(2, 1:n); % get x values vector from original data values matrix
xy_vals = x_vals .* y_vals; % multiply corresponding elements in x_vals & y_vals
x_sq_vals = x_vals.^2;      % square values in x_vals

x_sum = sum(x_vals); % sum of all x vals
y_sum = sum(y_vals); % sum of all y vals
xy_sum = sum(xy_vals); % sum of all xy vals
x_sq_sum = sum(x_sq_vals); % sum of all x_sq vals

x_mean = x_sum / n; % mean of x_vals
y_mean = y_sum / n; % mean of y_vals

% formula taken from GeeksForGeeks
a = ((y_sum * x_sq_sum) - (x_sum * xy_sum)) / (n * x_sq_sum - x_sum.^2);
b = ((n * xy_sum) - (x_sum * y_sum)) / (n * x_sq_sum - x_sum.^2);

% create least squares regression line (LSRL)
syms x;
lsrl = @(x) a + b * x;

% plot LSRL
fplot(lsrl, 'r');

% plot mean of data set
plot(x_mean, y_mean, 'y*');

% final LSRL printed
fprintf("\ny = " + a + " + (" + b + ")x")