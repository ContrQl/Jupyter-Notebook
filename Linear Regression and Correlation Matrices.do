// Linear Regression and Correlation Matrices

// Multivariable Linear Regression
// Produces anaylsis-of-variance table: coefficients (effect of independent variable on dependent variable); SEs; t-values (whether each coefficient is statistically different from 0); p-values (statistical significance of results); R-squared (proportion of variance in the dependent variable explained by the independent variables; F-statistic (whether model as a whole is statistically significant
reg VARIABLE1 VARIABLE2 ... VARIABLE(n) // where VARIABLE1 is the dependent variable and VARIABLE2-n are the independent confounding variables to be controlled. Model: VARIABLE1 = α + β*VARIABLE2 + α + β*VARIABLE3 ... + α + β*VARIABLEn
reg VAIRABLE1 VARIABLE2 // Simple linear regression. Model: VARIABLE1 = α + β*VARIABLE2
reg VAIRABLE1 i.VARIABLE2 // Logistic regression, where VARIABLE2 is binary. Model: VARIABLE1 = α + β*VARIABLE2

// Postestimation (after a linear regression)
predict VARIABLEhat, xb // put into new variable the predicted values for the model, where hat is the statistical convention for fitted values
predict VARIABLE, resid // put into new variable the residuals from the model
predict VARIABLE, stdp // put into new variable the standard errors of the predicted values

// Also: Test for heteroskedasticity (estat hettest); Plot residuals versus fitted values (rvfplot); Test for joint significance (test VAIRABLE1 VARIABLE2); Get VIF to check for multicollinearity (estat vif); Plot leverage vs residuals to check for outliers (lvr2plot)

// Estimate Correlation Matrix
// Pearson Correlation or Product Moment Correlation
correlate VARIABLE1 VARIABLE2 VARIABLE ... (n)
by VARIABLE3, sort: correlate VARIABLE1 VARIABLE2 ... VARIABLE(n)

// Spearman Correlation or Rank Correlation (Non-parametric; Check assumptions)
spearman VARIABLE1 VARIABLE2

//  Estimate Covariance Matrix
correlate VARIABLE1 VARIABLE2 VARIABLE3 [aweight=VARIABLE4], covariance // where VARIABLE4 is used as analytic weight
