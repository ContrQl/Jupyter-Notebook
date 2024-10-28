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

// Creating and deleting new variables
gen VARIABLE2 = VARIABLE1 * arbitrary transformation
label variable VARIABLE2 "arbitrary description here"
drop VARIABLE2

// Compute numbers
disp VARIABLE * arbitrary calculation

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

// Hypothesis Test

// Two sample z-test for proportions (H0: Proportion1 = Proportion2)
// Produces proportions of each group, Δproportion, SE, z-statistic, p(observing Z-statistic greater specific value or test statistic z) AKA Pr(Z > z), 95% CI
prtest OUTCOME, by(GROUP) // Testing for difference in success rate between groups (provided with raw data)
prtesti TOTAL1 SUCESSS1 TOTAL2 SUCCESS2, count // immediate t-test where you already know the number of successes in each group (without raw data, or tabulated using tab VARIABLE1, VARIABLE2)

// Two sample t-test (mean comparison test) in cases of either equal or unequal variances (H0: Mean1 = Mean2)
// Produces p-values of one-tailed alternative hypotheses in both directions and two-tailed alternative hypothesis (absolute p-value)
// In a left-tailed Ha (Δmean < 0 e.g. lowers BP), Pr(T < t) is the one-tailed probability that the t-statistic is smaller than specific value t (Test statistic) under the null hypothesis (referring to sampling distribution of mean difference, where average mean diff = 0, negative towards the left and positive toward the right)
// In a right-tailed Ha (Δmean > 0 e.g. increases BP), Pr(T > t) is the one-tailed probability that the t-statistic is bigger than specific value t (Test statistic) under the null hypothesis (IT DEPENDS ON THE ALTERNATIVE HYPOTHESIS)
// Pr(|T| < |t|) is the two-tailed probability that the test-statistic is smaller than specific value t undner H0; Data has to be in either the extreme left or extreme right under the null hypothesis, which each equal half of Pr(|T| < t)
// Produces mean difference, SE, SD, 95% CI, t-value (also mean/SE), DoF (no. of paired observations - 1)
ttest VARIABLE_BEFORE == VARIABLE_AFTER // Paired (dependent data)
ttest VARIABLE_DIFFERENCE == 0
ttest VARIABLE1, by(VARIABLE2) // Unpaired (independent data), where the mean VARIABLE1 of groups separated by VARIABLE2 are compared

// Mann Whitney U or Wilcoxon Rank Sum Test (Non-parametric Test of Independent Continuous Variables)
// Produces rank sum values, expected rank sum values, variance adjustment (account for tied ranks), z-statistic, P-value or Prob > |z| or the chance of observing z-value as high as this under the null hypothesis
ranksum VARIABLE1, by(VARIABLE2) // H0: difference in VARIABLE1 between VARIABLE2 = 0; Performed on ranked data rather than data itself

// In cases when output gives alpha or significance level. In a one-tailed hypothesis, alpha = alpha; In a two-tailed hypothesis, each tail = alpha/2. In both cases, complement of the significance level = 1-alpha

// Wilcoxon Signed Rank Test (Non-parametric Test for Paired Variables)
signrank VARIABLE = 0 // H0: Median of VARIABLE = 0 or that mean difference = 0 (median of mean difference will be zero if there is no difference)
signrank VARIABLEbef = VARIABLEaft // Tests if the two paired variables are different
centile VARIABLE, centile(50) // 95% CI for centile difference since we are using a non-parametric test (as opposed to "ci" for mean difference. 95% CI exclude 0: Reject H0

// Chi-square Test, Fisher's Exact Test (or Non-parametric Test of Independence between Categorical Variables using Proportions)
tab VARIABLE1 VARIABLE2, expected // Generates contingency table
tab VARIABLE1 VARIABLE2, chi2 // Chi-square test is used if all expected frequencies are 5 or greater; Chi-Square Statistic: How much the observed frequencies deviate from expected frequencies were the variable independent (Big X^2: Farther from independence); P-value < 0.05: statistically significant association, reject H0 of independence
tab VARIABLE1 VARIABLE2, exact // Fisher's Exact Test is used if any of the expected frequencies are <5; Variables are significantly different if the variables are not independent (statistically, not causally)

// Linear Regression and Correlation Matrices

// Linear Regression
// Produces anaylsis-of-variance table: coefficients (effect of independent variable on dependent variable); SEs; t-values (whether each coefficient is statistically different from 0); p-values (statistical significance of results); R-squared (proportion of variance in the dependent variable explained by the independent variables; F-statistic (whether model as a whole is statistically significant
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
// Second option to check for normality using quantile-quantile plot
// By default y-axis is density; Switch to frequency by appending "freq" as an argument
hist VARIABLE, bin(n), start(VALUE) normal // Look for bell-shape
qnorm VARIABLE // Data normal if points fall near straight line

// Scatter Plot
twoway (scatter VARIABLE1 VARIABLE2) // where VARIABLE1 is plotted on the y-axis and VARIABLE2 is plotted on the x-axis
twoway (scatter VARIABLE1 VARIABLE2), by(VARIABLE3, total) // generating graphs for each subgroup as well as combined graph. by VARIABLE3 sort instead of by(VARIABLE3), 3 separate graphs would be produced rather than 1 output with 3 graphs
twoway (scatter VARIABLE1 VARIABLE2) (line VARIABLEhat VARIABLE2, sort), by(foreign) // Overlaying a predicted line (sorted by x-variable) over the scatter plot

// Box Plot
// Edges of box represent 25 and 75th perecentiles; Whiskers of box plot represent the smallest and lowest values within the inner fence; Data beyond whiskers are in the outer fence and are considered outliers
graph box VARIABLE

// To keep track of work, use the log button (lab notebook icon) to begin a log
