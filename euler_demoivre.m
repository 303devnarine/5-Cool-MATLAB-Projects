% Euler & DeMoivre Forms & Formulas
clearvars, clc, clf, close all;

% ask user to input a complex number, z
z = input("Enter a complex number (form a + bi): ");

% real and imaginary parts of z
a = real(z); b = imag(z);

% magnitude and direction of z on polar coords.
r = sqrt(a.^2 + b.^2);
theta = atan(b/a);

% print out z in polar terms
fprintf("\nz = " + z + "\n  = (r, Ø) = (" + r + ", " + theta + ")\n");

% print out z in Euler Form
fprintf("\nEuler's Form: [re^Øi]\n");
fprintf(r + "e^" + (theta/pi) + "πi\n");

% print out z in DeMoirve Form
fprintf("\nDemoirve's Form: [r * (cos(Ø) + i sin(Ø))]\n");
fprintf(r + "(cos(" + theta/pi + "π) + i sin(" + theta/pi + "π))\n");

% get exponent for DeMoivre's Formula application
expon = input("\nEnter a exponent, n, for z^(1/n) = w:");
ex_r = r ^ (1/expon);

% print out w in Euler's Form
fprintf("\nEuler's Form: [r^n * e^((Øi + 2πk) / n)]\n"); 
fprintf(ex_r + "e^" + (theta/(expon * pi)) + "πi + " + (2/expon) + "πk\n");

% print out w in DeMoivre's Form
fprintf("\nDemoirve's Form: [r * (cos((Ø + 2πk)/n + ) + i sin((Ø + 2πk)/n))]\n"); 
fprintf(ex_r + "(cos(" + theta/(expon * pi) + "π) + i sin(" + theta/(expon * pi) + "π))\n\n\n");

% new starting theta angle & angle between w_k values
new_theta = theta / expon;
step_k = 2*pi / expon;

% print out all w_k values
fprintf("w = z^(1 / " + expon + "):\n");
for k= 0:expon-1
   fprintf("w_" + k + " = " +  (ex_r * (cos(new_theta + (step_k*k)) + (i * sin(new_theta + (step_k*k)))) + "\n"))
end