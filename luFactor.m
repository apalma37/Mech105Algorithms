function [L, U, P] = luFactor(A)
%luFactor is a function that determines the LU Factorization of a square matrix. 
%   Inputs-
%       A - coefficient matrix
%   Output-
%       L - lower triangular matrix
%       U - upper tringular matrix
%       P - the pivot matrix

if nargin ~= 1
    error('Invalid number of arguments.')
end
%check size of matrix for later reference/
n= length(A);
[nrow,ncolumn]=size(A); %Assign the n-by-m lengths to variables to be used in code.

%Step 1 - Initialize all wanted matrices.

L = eye(n); % Initializes the L matrix as an identity matrix.
U = A; %Initializes the U matrix as a replica of inputed matrix A .
P = eye(n); %Initializes the P matrix as an identity matrix.



%Step 2 - Do the first pivot.
    %the first column in the A matrix will be checked for its biggest
    %absolute value. The row that corresponds to it will be switched with
    %the first row.
    
[max_col,row_num]=max(abs(A(:,1)));
    %max_col - biggest absolute value in column
    %row_num - keeps track of what row max_col is in.
    
if max_col~=abs(A(1,1)) %Row switch must be performed if the value in A(1,1) is not the biggest.
    U([1 row_num],:)=A([row_num 1],:);
    P([1 row_num],:)=P([row_num 1],:);%Keeps track of the pivot matrix by switching rows correspondingly with the U matrix.
end



% Step 3 - Formation of L and U Matrices + Continued Pivoting
    %A loop will be initialized to eliminate numbers in the matrices to
    %create desired matrix format (this being upper & lower traingular
    %matrices). The loop will use Gauss Elimination (not naive, seeing
    %that there is a pivot element included) to accomplish this.
    
for s=2:ncolumn
    %The following loop's purpose is to keep track of the multipliers
    %needed to eliminate values and store those values in the U matrix.
    %Additionally, it performs Gauss ELimination to find the L matrix 
    for g=s:nrow
        h=s-1;
        L(g,h)=U(g,h)/U(h,h); %Notice I managed to write 'ugh' in this line lol
        U(g,:)=U(g,:)-L(g,h)*U(h,:);
    end
   
    [max_col,row_num]=max(abs(U(s:nrow,s))); %Pivoting
    
    row_num=row_num+(s-1);
    
    if max_col~=abs(U(s,s)) %Row switch must be performed if the value in U(s,s) is not the biggest.
        U([s row_num],:)=U([row_num s],:);
        P([s row_num],:)=P([row_num s],:);
        L([s row_num],1:s-1)=L([row_num s],1:s-1);
    end
end

disp('The L matrix is:')
disp(L)

disp('The U matrix is:')
disp(U)

disp('The P matrix is:')
disp(P)

end
