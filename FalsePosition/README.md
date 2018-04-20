 # False Position Algorithm 
## Description
### The False Position algorithm is a function that estimates the root of a given function by
### using the false position method.

#### Inputs
* *func* -the function being evaluated.
* *xl* -the lower guess
* *xu* - the upper guess
* *es*  - the desired relative error (will default to 0.0001% if no
     input)
* *maxiter*  - the number of iterations desired (will default to 200 if no
     input)

#### Outputs
* *root* - the estimated root location
* *fx* - the function evaluated at the root location
* *ea* - the approximate relative error (%)
* *iter* - how many iterations were performed
