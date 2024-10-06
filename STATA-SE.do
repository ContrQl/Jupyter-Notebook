// Data Management

// open FILE from current working directory
use FILENAME.dta

// open FILE from example datasest
sysuse FILENAME.dta

// open FILE from STATA Manuals
webuse FILENAME.dta

// Visualise all data from FILE
br or browse

// Reveal structure and properties of dataset (a la schema in SQL)
// Each variable has a variable name, storage type (a la C++ int cents), display format, value label (key-value pair that stores numerical values but displays text), variable lable (which is a description of the variable e.g units)
describe

// Show any notes attached to the dataset
notes

// Show variable name and variable label, and some summary statistics
// Shows if all values are unique, contains blanks, are missing any values (value = "., .a -.z"). If values are unique variable can possibly be used as an identifier
// If VARIABLE is an indicator VARIABLE, this function will reveal the key-value pairs. Indicator variables use less memory and can be worked into statistical models
codeblock VARIABLE

// Descriptive Statistics

// Summarise VARIABLE in detail (VARIABLE IS CASE SENSITIVE)
// Reveals 1, 5, 10, 25, 50, 75, 90, 95, 99 percentiles values, the smallest and exterme values at the extremes, mean, SD, Variance, Skewness, Kurtosis. IQR = 75% - 25%
// Mild outliers (inner fence) = 1.5 * IQR below Q1 & above Q3; Extreme outliers (outer fence) = 3 * IQR below Q1 & above Q3
summ VARIRABLE, det

// Box Plot
// Edges of box represent 25 and 75th perecentiles; Whiskers of box plot represent the smallest and lowest values within the inner fence; Data beyond whiskers are in the outer fence and beyond and are considered outliers
graph box VARIABLE

// Histogram with number of bins specified, with a specific start bin, and checked for normality
hist VARIABLE, bin(n), start(VALUE) normal

// Estimate correlation matrix
correlate mrgrate dvcrate medage

//  Estimate covariance matrix
correlate VARIABLE1 VARIABLE2 VARIABLE3 [aweight=VAR], // where VARIABLE as analytic weight
covariance

// Logic

// Conditionals (Examples)
count if VARIABLE > n
br if missing(VARIABLE)
list VARIABLE if missing(VARIABLE)

