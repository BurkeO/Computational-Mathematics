function [L,U] = LUdecompGauss(A)
% LUdecompGauss - decomposes an n x n matrix [A] into a lower triangular 
%               matrix [L] and an upper triangular matrix [U] (such that 
%               [A] = [L][U]) using the Gauss elimination method (without 
%               pivoting).
%
% Explanation : Obtains the upper triangular matrix by the gauss
% elimination method
%               Step 1: Obtain the pivot coefficient for the current set of
%               equations. Elements of the current column are eliminated by
%               subtracting the (pivot equation * the multiplier) from them.
%               The multipler is found by dividing the current coefficient
%               by the pivot coefficient
%
%               Step 2: This is then done for the next set of equations
%               after eliminating the column and picking the new
%               pivot coefficient
%
%               Step 3: During the process of finding the upper matrix, we
%               find the multipliers which are used to make the lower
%               matrix
%
    [m,n] = size(A);
    upper = A;              %initialise the upper matrix
    lower = zeros(n,n);     %initialise the lower matrix
    for i = 1:n
       lower(i,i) = 1;      %Set the diagonals of the lower matrix to all 1's
    end
    for j = 2:m
        pivCoef = upper(j-1,j-1);   %get the pivot coefficient for the current set of equations
        for i = j:m
            mult = upper(i,j-1)/pivCoef;    %find the current multipler
            lower(i,j-1) = mult;            %assign the multipler to the lower matrix
            subEq = upper(j-1,:)*mult;      %multiply the pivot equation by the multipler
            upper(i,:) = upper(i,:) - subEq; %subtract the equation above from the current equation
        end 
    end
    L = lower;  %return the lower matrix
    U = upper;  %return the upper matrix

end


