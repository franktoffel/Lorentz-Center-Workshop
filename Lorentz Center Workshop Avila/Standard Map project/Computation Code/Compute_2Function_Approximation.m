function [Box]=Compute_2Function_Approximation(F_star1,F_star2,Num_IC,Box_Size)
Min_F_star1=min(min(F_star1));                % Compute Min of Avg.
Min_F_star2=min(min(F_star2));                % Compute Min of Avg.
Max_F_star1=max(max(F_star1-Min_F_star1));    % Compute Max of Shifted Avg.
Max_F_star2=max(max(F_star2-Min_F_star2));    % Compute Max of Shifted Avg.
Box_F1=ceil((F_star1-Min_F_star1)./Max_F_star1*Box_Size); % Map to [0,Box]
Box_F2=ceil((F_star2-Min_F_star2)./Max_F_star2*Box_Size); % Map to [0,Box]
Box_F1(Box_F1==0)=1;                          % Values at 0 are in 1st Box
Box_F2(Box_F2==0)=1;                          % Values at 0 are in 1st Box
Box=Box_F1+(Box_F2-1)*Box_Size;               % Map to [1,Box_Size^2]
Box_Color=zeros(Num_IC^2,1);                  % Alloate Color of Boxes
Box_Color(unique(Box))=rand(length(unique(Box)),1); % Assign Random Colors
Box=reshape(Box,Num_IC^2,1);                  % Reshape Matrix to Vector
Box=Box_Color(Box);                           % Color the Boxes
Box=reshape(Box,Num_IC,Num_IC);               % Reshape Vector to Matrix
end
