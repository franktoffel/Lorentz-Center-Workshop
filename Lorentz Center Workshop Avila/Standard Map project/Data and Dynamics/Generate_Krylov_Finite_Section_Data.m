function [F,F2]=Generate_Krylov_Finite_Section_Data(X,f,T,Num_IC,Num_Iter)
F(:,1)=reshape(cellfun(f,X),Num_IC^2,1);       % Evaluate Observabele on IC
for i=2:Num_Iter                               % For Loop Over Time
X=cellfun(T,X,'UniformOutput',false);          % Update IC With Map
F(:,i)=reshape(cellfun(f,X),Num_IC^2,1);       % Update Krylov Sequence
disp(num2str(100*i/Num_Iter))                  % Display Progress
end                                            % End For Loop Over Time
F2=[F(:,2:end) zeros(Num_IC^2,1)];             % Allocate Shifted Data
X=cellfun(T,X,'UniformOutput',false);          % Update State
F2(:,end)=reshape(cellfun(f,X),Num_IC^2,1);    % Compute Last Time Shift
end