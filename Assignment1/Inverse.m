function Ainv = Inverse(A)
%Inverse  - Returns the inverse of the given matrix
%   Explanation : This returns the inverse of the given matrix by solving
%       the m equations (for a m*m matrix) where each equation is the matrix A
%       * n-th column of the inverse matrix = the n-th column of the identity matrix
%
%       When each column of the inverse matrix is obtained, they form the
%       inverse of the provided matrix. Each of these equations is solved
%       using gauss-jordan elimination.
%
%       For each equation, this is done iteratively. For the i-th
%       iteration, we take the element A(i,i). This is our pivot element and
%       we divide each element in the current row (also denoted by the
%       current iteration) by this pivot element, as well as the identity
%       matrix column.
%       Then, for every OTHER row in the matrices (A and the identity), and for each element in
%       those rows, we subtract it from the element in the same column as the pivot in our
%       current row * the element from our current column from the pivot
%       equation.
%
%       And repeat for each row until we get all 1's on the diagonal and
%       zeros elsewhere. Then the elements in the identity column now equal
%       the elements that are from the inverse column.
%
%       Repeat for all columns in the inverse and then form the matrix from
%       the resulting columns



[m,n] = size(A);
if m ~= n
    Ainv = "The matrix must be square";
else
    tempRes = zeros(m,m);
    for i = 1:m
        copy = A;               %%%%%%%%%%%%Forms identity columns%%%%%%%
        idCol = zeros(m,1);     
        idCol(i,1) = 1;
        %disp(idCol);
        for j = 1:m
        %%%%%%%%%%%%%%%%%%%%%%-divide row by pivot-%%%%%%%%%%%%%%%
            pivot = copy(j,j);
            copy(j,:) = rdivide(copy(j,:),pivot);
            idCol(j,1) = idCol(j,1)/pivot;
        %%%%%%%%%%%%%%%%%%%%%%-eliminate elements from other rows-%%%%%%%%
            for k = 1:m
               if (k == j)
                   continue; %Skip the row corresponding to the current iteration
               end
               fac = copy(k,j);         %%%%%%%Perform the elimination%%%%% Gets the element that will act as the factor
               for c = 1:m
                   first = copy(k,c);   %Gets the element from the current row
                   third = copy(j,c);   %Gets the element from the pivot equation
                   temp = first - (fac*third); %eliminates
                   copy(k,c) = temp;    %write-back
               end
               idCol(k,1) = idCol(k,1) - (fac * idCol(j,1) ); %Perform the operation on the identity column
            end
        end
        tempRes(:,i) = idCol;   %Place the resulting inverse column in the result matrix
    end
    Ainv = tempRes; %return
end
end

