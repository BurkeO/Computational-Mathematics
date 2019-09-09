function D = Determinant(A)
%Determinant - Returns the determinant of the given matrix
%   Explanation : This solution is recursive to the point where 
%               you're working with a 2*2 matrix A where the determinant
%               is simply (A(1,1) * A(2,2)) - (A(1,2) * A(2,1)).
%
%               For any larger matrix, we take the first row and for each
%               element in that row we multiply it by the determinant of
%               the submatrix that is the current matrix with the row and
%               column of the current element removed. We also multiply
%               this by -1 if the element coordinates ie. A(1,2), sum up to
%               be odd (1+2 = 3 which is odd).
%               We do this for every element in the first row, summing up
%               the final values for each element which gives us our
%               determinant
[m,n] = size(A);
if m ~= n                             %Checks that the matrix is square
    D = "The matrix must be square";  %Returns the error message otherwise
elseif m == 2                         %If matrix is 2*2,
    first = A(1,1) * A(2,2);          %performs the determinant calculation
    res = first - (A(1,2) * A(2,1));  %as described above.
    D = res;
else
    res = 0;
    for i = 1:m                %For each element in first row
        tempMat = A;           %temp mat forms the submatrix by removing
        tempMat(1,:) = [];     %the row and column of the current element
        tempMat(:,i) = [];
        if mod((1+i),2) == 1    %Find if the coordinates are odd (described above)
           temp = (A(1,i) * -1) * Determinant(tempMat); %Multiplies the current element by the determinant of the 
           res = res + temp;                            %submatrix, recursively, if the coordinates are odd.
        else
           temp = A(1,i) * Determinant(tempMat);    %If they are not odd
           res = res + temp;
        end
    end
    D = res;
end
end


