// Hypothesis Testing

// Tests for Categorical Data

P
// Two sample z-test for proportions (H0: Proportion1 = Proportion2)
// Produces proportions of each group, Δproportion, SE, z-statistic, p(observing Z-statistic greater specific value or test statistic z) AKA Pr(Z > z), 95% CI
prtest OUTCOME, by(GROUP) // Testing for difference in success rate between groups (provided with raw data)
prtesti TOTAL1 SUCESSS1 TOTAL2 SUCCESS2, count // immediate t-test where you already know the number of successes in each group (without raw data, or tabulated using tab VARIABLE1, VARIABLE2)

NP
// Sign test

// Chi-square Test, Fisher's Exact Test (or Non-parametric Test of Independence between Categorical Variables using Proportions)
tab VARIABLE1 VARIABLE2, expected // Generates contingency table
tab VARIABLE1 VARIABLE2, chi2 // Chi-square test is used if all expected frequencies are 5 or greater; Chi-Square Statistic: How much the observed frequencies deviate from expected frequencies were the variable independent (Big X^2: Farther from independence); P-value < 0.05: statistically significant association, reject H0 of independence
tab VARIABLE1 VARIABLE2, exact // Fisher's Exact Test is used if any of the expected frequencies are <5; Variables are significantly different if the variables are not independent (statistically, not causally)

>2 variables

// Kruskal-Wallis ANOVA
kwallis // TO-DO
