function [IC,x,y]=Generate_Standard_Map_IC(Num_IC,delta)
x=linspace(0,1,Num_IC); % Define IC in x Coordinate
y=linspace(0,1,Num_IC); % Define IC in y Coordinate
IC=cell(Num_IC,Num_IC); % Preallocate Grid of IC


for i=1:length(x) % Loop over # of Initial Conditions in x
for j=1:length(y) % Loop over # of Initial Conditions in y
IC{i,j}=[x(i) y(j) delta]'; % Create (x,y,delta) Triplet and Store;
end
end

end