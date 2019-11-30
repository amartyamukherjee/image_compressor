function [ P_padded ] = pad15( P )
%pad - produces a new matrix like P, except that the number of rows and
%columns are both multiples of 15.
% Note that P is n x m x 3.
% Rows and columns of 0 are added to the "end" of P, if needed.
% save original size of P
[rows,columns,colours] = size(P);
% determine the number of "extra" rows and columns in P
rm15 = mod(rows,15);
cm15 = mod(columns,15);
% Add 15-rm15 rows of zeros to each of the colour matrices
% The number of rows in each of P1, P2, P3 is now a multiple of 15.
if rm15 > 0
    P_pad(:,:,1) = [P(:,:,1);zeros(15-rm15, columns)];
    P_pad(:,:,2) = [P(:,:,2);zeros(15-rm15, columns)];
    P_pad(:,:,3) = [P(:,:,3);zeros(15-rm15, columns)];
else
    P_pad = P;
end
% Add 15-cm15 columns to the already enlarged matrices
% The number of columns in each of P1, P2, P3 is now a multiple of 15.
[rows,c1] = size(P_pad);
if cm15 > 0
P_padded(:,:,1) = cat(2, P_pad(:,:,1), zeros(rows,15-cm15));
P_padded(:,:,2) = cat(2, P_pad(:,:,2), zeros(rows,15-cm15));
P_padded(:,:,3) = cat(2, P_pad(:,:,3), zeros(rows,15-cm15));
else
P_padded = P_pad;
end
end
