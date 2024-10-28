// Hypothesis Testing

// Tests for Categorical Data

// Two sample z-test for proportions (H0: Proportion1 = Proportion2)
// Produces proportions of each group, Δproportion, SE, z-statistic, p(observing Z-statistic greater specific value or test statistic z) AKA Pr(Z > z), 95% CI
prtest OUTCOME, by(GROUP) // Testing for difference in success rate between groups (provided with raw data)
prtesti TOTAL1 SUCESSS1 TOTAL2 SUCCESS2, count // immediate t-test where you already know the number of successes in each group (without raw data, or tabulated using tab VARIABLE1, VARIABLE2)

// Sign test (Non-parameteric)

// Chi-square Test, Fisher's Exact Test (or Non-parametric Test of Independence between Categorical Variables using Proportions)
tab VARIABLE1 VARIABLE2, expected // Generates contingency table
tab VARIABLE1 VARIABLE2, chi2 // Chi-square test is used if all expected frequencies are 5 or greater; Chi-Square Statistic: How much the observed frequencies deviate from expected frequencies were the variable independent (Big X^2: Farther from independence); P-value < 0.05: statistically significant association, reject H0 of independence
tab VARIABLE1 VARIABLE2, exact // Fisher's Exact Test is used if any of the expected frequencies are <5; Variables are significantly different if the variables are not independent (statistically, not causally)

// Tests for Continuous Data

// Two sample t-test (Parametric Test for Paired Variables)
// Tests for differences in mean in cases of either equal or unequal variances (H0: Mean1 = Mean2)
// Produces p-values of one-tailed alternative hypotheses in both directions and two-tailed alternative hypothesis (absolute p-value)
// In a left-tailed Ha (Δmean < 0 e.g. lowers BP), Pr(T < t) is the one-tailed probability that the t-statistic is smaller than specific value t (Test statistic) under the null hypothesis (referring to sampling distribution of mean difference, where average mean diff = 0, negative towards the left and positive toward the right)
// In a right-tailed Ha (Δmean > 0 e.g. increases BP), Pr(T > t) is the one-tailed probability that the t-statistic is bigger than specific value t (Test statistic) under the null hypothesis (IT DEPENDS ON THE ALTERNATIVE HYPOTHESIS)
// Pr(|T| < |t|) is the two-tailed probability that the test-statistic is smaller than specific value t undner H0; Data has to be in either the extreme left or extreme right under the null hypothesis, which each equal half of Pr(|T| < t)
// Produces mean difference, SE, SD, 95% CI, t-value (also mean/SE), DoF (no. of paired observations - 1)
ttest VARIABLE_BEFORE == VARIABLE_AFTER // Paired (dependent data)
ttest VARIABLE_DIFFERENCE == 0

// Wilcoxon Signed Rank Test (Non-parametric Test for Paired Variables)
signrank VARIABLE = 0 // H0: Median of VARIABLE = 0 or that mean difference = 0 (median of mean difference will be zero if there is no difference)
signrank VARIABLEbef = VARIABLEaft // Tests if the two paired variables are different
centile VARIABLE, centile(50) // 95% CI for centile difference since we are using a non-parametric test (as opposed to "ci" for mean difference. 95% CI exclude 0: Reject H0

// Unpaired Two sample t-test (Parametric Test of Independent Continuous Variables)
ttest VARIABLE1, by(VARIABLE2) // The mean VARIABLE1 of groups separated by VARIABLE2 are compared

// Mann Whitney U or Wilcoxon Rank Sum Test (Non-parametric Test for Independent Continuous Variables)
// Produces rank sum values, expected rank sum values, variance adjustment (account for tied ranks), z-statistic, P-value or Prob > |z| or the chance of observing z-value as high as this under the null hypothesis
ranksum VARIABLE1, by(VARIABLE2) // H0: difference in VARIABLE1 between VARIABLE2 = 0; Performed on ranked data rather than data itself

// In cases when output gives alpha or significance level. In a one-tailed hypothesis, alpha = alpha; In a two-tailed hypothesis, each tail = alpha/2. In both cases, complement of the significance level = 1-alpha
