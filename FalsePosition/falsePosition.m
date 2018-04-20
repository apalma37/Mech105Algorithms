function [root, fx, ea, iter] = falsePosition(func,xl, xu, es, maxiter)
%falsePosition is a function that estimates the root of a given function by
%using the false position method.
%  Inputs
%     func-the function being evaluated.
%     xl-the lower guess
%     xu- the upper guess
%     es - the desired relative error (will default to 0.0001% if no
%     input)
%     maxiter - the number of iterations desired (will default to 200 if no
%     input)
%  Outputs 
%     root - the estimated root location
%     fx - the function evaluated at the root location
%     ea - the approximate relative error (%)
%     iter - how many iterations were performed
if nargin == 3 || isempty(es) && isempty(maxiter) %this checks to make sure that the required arguments are put it. Also, it sets the default values for the optional inputs.
    es = 0.0001;
    maxiter=200;
elseif nargin == 4  || isempty(maxiter)%these lines make sure to set the correct optional input to its set value.
    maxiter = 200;
elseif nargin == 4 || isempty(es)
    es = 0.0001;
end
if nargin < 3 %This makes sure that the user inputs at least 3 variables.
    error('At least 3 input variables required. Try again')
end
fxl=func(xl); %evaluuates the function values.
fxu=func(xu);
Sign=fxu*fxl; %check to see if the inputs have actually been bracketed.
if Sign>0
    error('Root was not bracketed by guesses.')
end
root = xu - (fxu*(xl-xu)) / (fxl-fxu); %evaluates the false position algorithm to estimate the first estimation.
fx=func(root);
if fxl*fx < 0
    xl=root;
else
    xu=root;
end
%This evaluates the approximate relative error in percent.
fxl=func(xl);
fxu=func(xu);
rootNew=xu-(fxu*(xl-xu)) / (fxl-fxu);
ea = abs(((rootNew-root)/rootNew)*100);
iter=1;
%Initialize a loop to run as many times as the user asked it to.
%The loops evaluates the estimates and the relative error.
while ea>=es && iter<maxiter
    iter=iter+1;
    root=rootNew;
    fx=func(root);
    if fxl*fx < 0 %Check sign to see what the new brackets are going to be. The bracket used should be one that changes sign.
        xl=root;
    else
        xu=root;
    end
    fxl=func(xl);
    fxu=func(xu);
    rootNew= xu - (fxu*(xl-xu)) / (fxl-fxu);
    ea= abs(((rootNew-root)/rootNew)*100);
end

%Display the outputs
root=double(rootNew)
fx=double(func(root))
iter=double(iter)
ea=double(ea)

end
