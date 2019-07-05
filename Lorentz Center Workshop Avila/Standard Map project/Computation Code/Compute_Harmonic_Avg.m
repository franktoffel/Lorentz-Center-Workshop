function F_star=Compute_Harmonic_Avg(X,f,T,Num_Iter,omega)
F_star=cellfun(f,X);                            % Evaluate Observable on IC
for j=1:Num_Iter-1                                % For Loop Over Time
X=cellfun(T,X,'UniformOutput',false);             % Update IC With Map
F_star=F_star+exp(-1i*2*pi*j*omega).*cellfun(f,X);% Update Harmonic Average
end                                               % End For Loop Over Time
F_star=F_star./Num_Iter;                         % Compute Harmonic Average
end