function [I] = Simpson(x,y)
%The Simpson function integrates experimental data using the Simpson's 1/3
%rule.
%   Inputs
%       x - the x components in a vector of experimental data
%       y - the y components in a vector of experimental data
%   Outputs
%       I - estimated value of integration
n=length(x)
intervalnum=n-1
% Check the number of arguments input.
if nargin ~= 2
    error('Number of inputs is invalid. Try again.')
end
%Check to see if inputs have the same length.
if length(x) ~= length(y)
    error('Inputs must be the same length.')
end
%Check to see if x values are all equally spaced.
space=diff(x)
if min(space) ~= max(space)
    if max(space)- min(space)== 10^(-10)
        warning('Truncation error is most probably the cause of the statement to be false.')
    else
    error('Values of x should be equally spaced')
    end
end
%Warn user that the Trapezoidal Rule is going to be used. This is because
%there will be an odd number of intervals.
interval = mod(intervalnum,2)
if interval == 1
    warning('Trapezoidal rule will be used for last interval')
end
%create variable for the range (h) .
h=x(n)-x(1)

%There is two different scenarios- 
%   1) there is an even number of intervals and only the simpsons 1/3 rule needs to be performed.
%   2) there is an odd number of intervals and both the simpsons 1/3 rule and the trapezoidal
%      rule will be performed. 

%Scenario 1- Even Intervals
if interval == 0
 
        %Two loops that do the summation that will be needed for the composite
        %Simpsons 1/3 rule will be performed.
        sum4=0 %This initializes the sum that will be multiplied by 4 as zero.
        sum2=0 % This initializes the sum that will be multiplied by 2 as zero.
        k=0
        for i=2:2:intervalnum-2 %Performes a loop that will do the summation of all the even values in x
            k=k+1
            sum2(1,k)=2*y(i+1)
        end
        value2=sum(sum2)
        for i=1:2:intervalnum-1 %Performs the summation of all the odd values in x
            k=k+1
            sum4(1,k)=4*y(i+1)
        end
        value4=sum(sum4)
        I=(h/(3*intervalnum))*(y(1)+value4+value2+y(n)) %Performs Simpsons 1/3 Rule.
   
end
%Scenario 2 - Odd Intervals
if interval == 1
    %Lines 57 through 66 perform the Rimpsons 1/3 Rule the same way that it
    %was done in the scenario 1.
   intervalnum=intervalnum-1
   h=x(n-1)-x(1)
        sum4=0 %This initializes the sum that will be multiplied by 4 as zero.
        sum2=0 % This initializes the sum that will be multiplied by 2 as zero.
        k=0
        for i=2:2:intervalnum-2 %Performes a loop that will do the summation of all the even values in x
            k=k+1
            sum2(1,k)=2*y(i+1)
        end
        value2=sum(sum2)
        for i=1:2:intervalnum-1 %Performs the summation of all the odd values in x
            k=k+1
            sum4(1,k)=4*y(i+1)
        end
        value4=sum(sum4)
        simp=(h/(3*intervalnum))*(y(1)+value4+value2+y(n-1)) %Performs Simpsons 1/3 Rule.
   
    %The trapezoidal rule will be utilized for the last interval.
    g=x(n)-x(n-1)
    trap=(g/2)*(y(n-1) + y(n))
    I=simp+trap % The two are added to get the total approximation for the integral value.

% Display the result.
disp('The value of I is')
disp(I)

end

