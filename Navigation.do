// Data Management

// open FILE from current working directory
use FILENAME.dta

// open FILE from example datasest
sysuse FILENAME.dta

// open FILE from STATA Manuals
webuse FILENAME.dta

// Visualise all data from FILE
br or browse

// One-way table showing frequency distribution of VARIABLE
tab VARIABLE

// Two-way table showing summarising relationships between two categorical variables, where VARIABLE1 is shown in row and VARIABLE2 is shown in column, and row shows within-row relative frequencies in %
tab VARIABLE1 VARIABLE2, row

// Reveal structure and properties of dataset (a la schema in SQL)
// Each variable has a variable name, storage type (a la C++ int cents), display format, value label (key-value pair that stores numerical values but displays text), variable lable (which is a description of the variable e.g units)
describe

// Show any notes attached to the dataset
notes

// Show variable name and variable label, and some summary statistics
// Shows if all values are unique, contains blanks, are missing any values (value = "., .a -.z"). If values are unique variable can possibly be used as an identifier
// If VARIABLE is an indicator VARIABLE, this function will reveal the key-value pairs. Indicator variables use less memory and can be worked into statistical models
codebook VARIABLE

// Creating and deleting new variables
gen VARIABLE2 = VARIABLE1 * arbitrary transformation
label variable VARIABLE2 "arbitrary description here"
drop VARIABLE2
drop if VARIABLE2<n // Conditional deletion of specific outliers in variable

// Dichotomise data (stratification)
gen VARIABLE = .
replace VARIABLE = 0 if VARIABLE2 < cutoff // Values in low group become 0
replace VARIABLE = 1 if VARIABLE2 >= cutoff & VARIABLE2 !=. // Values in high group and non-missing values become 1

// Compute numbers
di VARIABLE * arbitrary calculation

// Descriptive Statistics

// Summarise VARIABLE in detail (VARIABLE IS CASE SENSITIVE)
// Reveals 1, 5, 10, 25 (1Q), 50 (median), 75 (3Q), 90, 95, 99 percentiles values, the four smallest and four biggest values at the extremes, mean, SD, Variance, Skewness, Kurtosis. IQR = 3Q - 1Q
// Mild outliers (inner fence) = 1.5 * IQR below Q1 & above Q3; Extreme outliers (outer fence) = 3 * IQR below Q1 & above Q3
summ VARIRABLE, det
tabulate VARIABLE2, summ(VARIABLE1) // where groups are separated by VARIABLE1 and summary produced for VARIABLE2

// Produce Mean, SE, and 95% Confidence Interval
ci means VARIABLE

// Logic and Conditionals
// STATA works with usual logical operators: ==; !=; >; <; >=; <=; & (AND); | (OR); !(NOT)

// Built-in Conditionals
generate VARIABLE inlist(VARIABLE, "VALUE1", "VALUE2", "VALUE3") // using inlist qualifier
count if VARIABLE == n
br if missing(VARIABLE)
list VARIABLE if > n
by VARIABLE2, sort: summ VARIABLE1 // where subgroups are separated by VARIABLE1 and summary produced for VARIABLE2

// Power Analysis (Solving for n)
// Sample size needed to achieve 0.80 power for detecting a difference between two proportions (0.123, 0.8)
power twoproportions 0.123 0.3, power(0.8) alpha(0.05)
power twoproportions 0.123 0.3 n(1000) alpha(0.05) // Solves for power

// To keep track of work, use the log button (lab notebook icon) to begin a log
