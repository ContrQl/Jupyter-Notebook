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
tabulate VARIABLE

// Two-way table showing summarising relationships between two categorical variables, where VARIABLE1 is shown in row and VARIABLE2 is shown in column, and row shows within-row relative frequencies in %
tabulate VARIABLE1 VARIABLE2, row

// Reveal structure and properties of dataset (a la schema in SQL)
// Each variable has a variable name, storage type (a la C++ int cents), display format, value label (key-value pair that stores numerical values but displays text), variable lable (which is a description of the variable e.g units)
describe

// Show any notes attached to the dataset
notes

// Show variable name and variable label, and some summary statistics
// Shows if all values are unique, contains blanks, are missing any values (value = "., .a -.z"). If values are unique variable can possibly be used as an identifier
// If VARIABLE is an indicator VARIABLE, this function will reveal the key-value pairs. Indicator variables use less memory and can be worked into statistical models
codebook VARIABLE

// Creating new variables
gen VARIABLE2 = VARIABLE1 * arbitrary transformation
label variable VARIABLE2 "arbitrary description here"

// Compute numbers
display VARIABLE * arbitrary calculation

// Descriptive Statistics

// Summarise VARIABLE in detail (VARIABLE IS CASE SENSITIVE)
// Reveals 1, 5, 10, 25 (1Q), 50 (median), 75 (3Q), 90, 95, 99 percentiles values, the four smallest and four biggest values at the extremes, mean, SD, Variance, Skewness, Kurtosis. IQR = 3Q - 1Q
// Mild outliers (inner fence) = 1.5 * IQR below Q1 & above Q3; Extreme outliers (outer fence) = 3 * IQR below Q1 & above Q3
summ VARIRABLE, det
tabulate VARIABLE2, summ(VARIABLE1) // where groups are separated by VARIABLE1 and summary produced for VARIABLE2

// Logic and Conditionals
// STATA works with usual logical operators: ==; !=; >; <; >=; <=; & (AND); | (OR); !(NOT)

// Built-in Conditionals
generate VARIABLE inlist(VARIABLE, "VALUE1", "VALUE2", "VALUE3") // using inlist qualifier
count if VARIABLE == n
br if missing(VARIABLE)
list VARIABLE if > n
by VARIABLE2, sort: summ VARIABLE1 // where subgroups are separated by VARIABLE1 and summary produced for VARIABLE2

// Hypothesis Test

// Two sample t-test (mean comparison test) with equal variances
// Produces p-values of one-tailed alternative hypothesis in both directions and two-tailed alternative hypothesis. For example, Pr(T < t) is the probability that the t-statistic would be smaller than the Test statistic under the null hypothesis
ttest VARIABLE1, by(VARIABLE2) // where the mean VARIABLE1 of groups separated by VARIABLE2 are compared

// Linear Regression and Correlation Matrices

// Linear Regression
// Produces anaylsis-of-variance table: coefficients (effect of independent variable on dependent variable); standard errors; t-values (whether each coefficient is statistically different from 0); p-values (statistical significance of results); R-squared (proportion of variance in the dependent variable explained by the independent variables; F-statistic (whether model as a whole is statistically significant
regress VARIABLE1 VARIABLE2 ... VARIABLE(n) // where VARIABLE1 is the dependent variable and VARIABLE2-n are the independent variables

// Postestimation (after a linear regression)
predict VARIABLEhat, xb // put into new variable the predicted values for the model, where hat is the statistical convention for fitted values
predict VARIABLE, resid // put into new variable the residuals from the model
predict VARIABLE, stdp // put into new variable the standard errors of the predicted values

// Also: Test for heteroskedasticity (estat hettest); Plot residuals versus fitted values (rvfplot); Test for joint significance (test VAIRABLE1 VARIABLE2); Get VIF to check for multicollinearity (estat vif); Plot leverage vs residuals to check for outliers (lvr2plot)

// Estimate Correlation Matrix
// +/- = positive/negative correlation
correlate VARIABLE1 VARIABLE2 VARIABLE ... (n)
by VARIABLE3, sort: correlate VARIABLE1 VARIABLE2 ... VARIABLE(n)

//  Estimate Covariance Matrix
correlate VARIABLE1 VARIABLE2 VARIABLE3 [aweight=VARIABLE4], covariance // where VARIABLE4 is used as analytic weight

// Graphing Data, with an eye toward modelling

// Histogram with number of bins specified (14 bins by default), with a specific start bin, and checked for normality
// By default y-axis is density; Switch to frequency by appending "freq" as an argument
hist VARIABLE, bin(n), start(VALUE) normal freq

// Scatter Plot
twoway (scatter VARIABLE1 VARIABLE2) // where VARIABLE1 is plotted on the y-axis and VARIABLE2 is plotted on the x-axis
twoway (scatter VARIABLE1 VARIABLE2), by(VARIABLE3, total) // generating graphs for each subgroup as well as combined graph. by VARIABLE3 sort instead of by(VARIABLE3), 3 separate graphs would be produced rather than 1 output with 3 graphs
twoway (scatter VARIABLE1 VARIABLE2) (line VARIABLEhat VARIABLE2, sort), by(foreign) // Overlaying a predicted line (sorted by x-variable) over the scatter plot

// Box Plot
// Edges of box represent 25 and 75th perecentiles; Whiskers of box plot represent the smallest and lowest values within the inner fence; Data beyond whiskers are in the outer fence and are considered outliers
graph box VARIABLE

// To keep track of work, use the log button (lab notebook icon) to begin a log
