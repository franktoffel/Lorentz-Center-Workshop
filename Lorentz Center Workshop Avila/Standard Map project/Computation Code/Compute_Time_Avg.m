function F_star=Compute_Time_Avg(X,f,T,Num_Iter)
F_star=cellfun(f,X);                            % Evaluate Observable on IC
for i=1:Num_Iter-1                              % For Loop Over Time
X=cellfun(T,X,'UniformOutput',false);           % Update IC With Map
F_star=F_star+cellfun(f,X);                     % Update Time Average
end                                             % End For Loop Over Time
F_star=F_star./Num_Iter;                        % Compute Harmonic Average
end