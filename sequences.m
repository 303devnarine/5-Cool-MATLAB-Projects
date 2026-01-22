% sequences
clear vars, clc, clf, close all;

import py.time.sleep

%% recursive sequences
function val = s(n)
    % change for each sequence (add/remove base case terms)
    s_0 = 9; % n = 0 / base case 0
    s_1 = 3; % n = 1 / base case 1
    s_n = @(s_n_1) 3 * s_n_1 + 4; % for n >= 2

    % switch for sequence term (add/remove base case terms)
    switch n
        case 0 
            val = s_0; % base case 0
        case 1
            val = s_1; % base case 1
        otherwise
            val = s_n(s(n-1)); % recursive call
    end
end

% Get a random number of terms based on user input
disp("Random Number of Terms")
rand_low_bound = input("Lower Bound of Random?");
rand_up_bound = input("Upper Bound of Random?");

% random number of terms generated
terms = randi([rand_low_bound, rand_up_bound]);

% print how many terms will be displayed
fprintf("\n%i terms will be displayed: \n", terms)
sleep(1)

% display terms
for i=0:terms-2
    fprintf(s(i) + ", ");
    sleep(1)
end
fprintf(s(terms-1) + "\n\n\n");

sleep(2)

%% Pseudorandom Sequence
disp("Pseudorandom Sequence")

% provide user context for what Pseudorandom Sequences are
disp("Pseudorandom numbers are random numbers generated using an algorithm.")
disp("Such an algorithm can use techniques such as linear congruential")
disp("generators (LCG), which uses modular arithmetic.")
disp("They can be generated via formula x_(n) = (a * x_(n-1) + c) mod m")
disp("- m being non-zero integer");
disp("- 0 <= x0 < m");
disp("- 0 < a < m");
disp("- 0 <= c < m");

% ask user to enter in values for x0, a, c, & m
x0 = input("Enter x0 (initial seed/condition: ");
a = input("Enter a (multiplier): ");
c = input("Enter c (increment): ");
m = input("Enter m (non-zero, range: [0, m]): ");

% print sequence formula
fprintf("\nx_(n) = (%i * x_(n-1) + %i) mod %i with x0 = %i\n", a, c, m, x0); 

% ask how many terms to generate
terms = input("How many terms to generate?");
xn = x0;

for i=0:terms-1
    fprintf("x_%i = %i\n", i, xn);
    xn = mod(a * xn + c, m);
    sleep(1);
end