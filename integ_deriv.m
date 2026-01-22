%% Basic Integral & Derivative
% calc functions & stuff
clearvars, clc, clf, close all;

% import sleep from time Python library
import py.time.sleep

% original f(x), with integral & derivative of f(x)
syms x;
f = x.^3 + 3*x;
F = int(f);
df = diff(f);

% print original f(x), integral & derivative of f(x)
fprintf("f(x) = %s\n", f)
fprintf("F(x) = C + %s\n", F)
fprintf("f'(x) = %s\n", df)

% graph original f(x), integral & derivative of f(x)
figure(1)
fplot(f, 'c-'), hold on;
fplot(F, 'm-'), hold on;
fplot(df, 'y-'), hold on;

legend('f(x)','F(x)',"f'(x)")

sleep(5)

%% Multiple Derivatives
% creates temporary derivative holder
tempDeriv = f;

% prompts user to enter how many derivatives to be taken
recurs = input("\nHow many derivatives do you wish to take? |:");

figure(2)
fplot(tempDeriv, 'b'), hold on;

% prints out and plots each derivative
for i = 1:recurs
    tempDeriv = diff(tempDeriv);
    fprintf("%i derivatives of %s is %s\n", i, f, tempDeriv)
    fplot(tempDeriv, 'r'), hold on;
    sleep(1)
end

%% Multiple Integrals
% creates temporary derivative holder
tempInteg = f;

% prompts user to enter how many derivatives to be taken
recurs = input("\nHow many integrals do you wish to take? |:");

figure(3)
fplot(tempInteg, 'b'), hold on;

% prints out and plots each derivative
for i = 1:recurs
    tempInteg = int(tempInteg);
    fprintf("%i derivatives of %s is C + %s\n", i, f, tempInteg)
    fplot(tempInteg, 'r'), hold on;
    sleep(1)
end