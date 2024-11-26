
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

// To keep track of work, use the log button (lab notebook icon) to begin a log
