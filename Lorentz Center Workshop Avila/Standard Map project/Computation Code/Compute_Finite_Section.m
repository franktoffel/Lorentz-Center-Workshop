function [Eigenfunctions,Lambda]=Compute_Finite_Section(F,F2)
U=pinv(F)*F2;                      % Compute Finite Section
[E,D]=eig(U); Lambda=diag(D);      % Compute Spectrum of Finite Section
Eigenfunctions=F*E;                % Evaluate Eigenfunctions of State-Space
end