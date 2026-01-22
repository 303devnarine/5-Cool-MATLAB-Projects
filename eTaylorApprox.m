% e^x Taylor Polynomial Approximation
clearvars, clc, clf, close all;

% new term for Taylor Poly
newTerm = @(x,n) (x^n) / (factorial(n));

% Taylor Poly & f(x) created as functions of x
T = @(x) 0;
f = @(x) exp(x);

% getting center & degree of polynomial
a = input(">> Where is the center?");
n = input(">> What degree polynomial?");

disp("e^x = ");

syms x

tic;

% display all results
figure(1)
fplot(f, 'r'), hold on;

for i = 0:n 
   T = T + newTerm((x - a), i); % add new term to Taylor Poly
   fprintf("T_%i(x) = %s\n", i, T)
   fplot(T, 'b:'), hold on; % graph Taylor Poly
end

fplot(T, 'g--'), hold on; % graph final Taylor Poly
grid on, hold on;
xlabel('x'),ylabel('y');

time = toc;

% Computation Time / Time Complexity
fprintf("%i secs to compute %i terms\n", time, n);

% display original function & Taylor Poly graphed together
figure(2)
fplot(f, 'r'), hold on;
fplot(T, 'b--'), hold on;
legend('f(x) = e^x', 'nth Deg. Taylor Poly.');
grid on, hold on;
xlabel('x'),ylabel('y');
