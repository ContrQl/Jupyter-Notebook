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

determine normality before choosing betwen Pearson and Spearman (NP)

Pearson
//
Strength of correlation



Spearman's correlation for ordinal data (by ranks)
