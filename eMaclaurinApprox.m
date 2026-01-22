% e^x Maclaurin Polynomial Approximation
clearvars, clc, clf, close all;

% new term of Maclaurin Poly 
newTerm = @(x,n) (x^n) / (factorial(n));

% Maclaurin Poly & f(x) created as functions of x
M = @(x) 0;
f = @(x) exp(x);

% gettimg degree of polynomial
n = input("What degree polynomial?");

disp("e^x = ");

syms x

tic;

% display all results
figure(1)
fplot(f, 'r'), hold on;

for i = 0:n 
   M = M + newTerm(x, i); % add new term to Maclaurin Poly
   fprintf("M_%i(x) = %s\n", i, M)
   fplot(M, 'b:'), hold on; % graph Maclaurin Poly
end

fplot(M, 'g--'), hold on; % graph final Maclaurin Poly
grid on, hold on;
xlabel('x'),ylabel('y');

time = toc;

% Computation Time / Time Complexity
fprintf("\n%i secs to compute %i terms\n", time, n);

% display original function & Maclaurin Poly graphed together 
figure(2)
fplot(f, 'r'), hold on;
fplot(M, 'b--'), hold on;
legend('f(x) = e^x', 'nth Deg. Maclaurin Poly.');
grid on, hold on;
xlabel('x'),ylabel('y');