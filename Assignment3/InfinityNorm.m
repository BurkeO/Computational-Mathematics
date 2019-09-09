function N = InfinityNorm(A)
%Description
%   returns the infinity norm of the given matrix A. (returns N)
%Explanation
%   The infinity norm is simply the maximum of the sums of each row, where 
%   the elements used are the absolute values of the elements in the matrix
    [m,n] = size(A);    % gets the size
    largestSum = 0; % set the maximum sum so far as 0
    for i = 1:m
        currentSum = 0; % set currentSum as 0
        for j = 1:n
            currentVal = abs(A(i,j));   % get the absolute value of the element
            currentSum = currentSum + currentVal;   % add to current sum
        end
        if currentSum > largestSum    % check if sum is larger than current max
            largestSum = currentSum; 
        end
    end
    N = largestSum; % return largest sum (infinity norm)
            