// open FILE from current working directory
use FILENAME.dta

// open FILE from example datasest
sysuse FILENAME.dta

// open FILE from STATA Manuals
webuse FILENAME.dta

// Visualise all data from FILE
br or browse

// Reveal structure and properties of dataset (a la schema in SQL)
// Each variable has a variable name, storage type (a la C++ int cents), display format,
value label (key-value pair that stores numerical values but displays text), variable lable (which is a description of the variable e.g units)
describe

// Show any notes attached to the dataset
notes

// Summarise VARIABLES in detail (*VARIABLE IS CASE SENSITIVE)
// Reveals 1, 5, 10, 25, 50, 75, 90, 95, 99 percentiles (with the smallest and largest values for S < 50 < L), mean, SD, Variance, Skewness, Kurtosis
summ or summarize (specify VARIRABLE), detail

// Show variable name and variable label, and some summary statistics
// Shows if all values are unique, contains blanks, are missing any values. If values are unique variable can be used as an identifier
codeblock VARIABLE

// Box Plot
graph box VARIABLE

// Histogram with number of bins specified, specific start bin, and checked for normality
hist VARIABLE, bin(n), start(VALUE) normal

// Identifying outliers in data using Q1 and Q3



// Estimate correlation matrix
correlate mrgrate dvcrate medage

//  Estimate covariance matrix
correlate VARIABLE1 VARIABLE2 VARIABLE3 [aweight=VAR], // where VARIABLE as analytic weight
covariance

//
