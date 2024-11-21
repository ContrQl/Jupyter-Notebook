// Power Analysis (Solving for n)
// Sample size needed for EACH GROUP to achieve 0.9 power for detecting a difference in means between the groups, given population SD of 3
power twomeans MEAN1 MEAN2, sd(3) power(0.9) // Computes effect size from MEAN1 and 2, and thus equivalent to doing:
power twomeans MEAN1, diff(MEAN2-1) sd(3) power(0.9)

// Sample size needed to achieve 0.80 power for detecting a difference between two proportions (0.123, 0.8)
power twoproportions 0.123 0.3, power(0.8) alpha(0.05)
power twoproportions 0.123 diff(5), power(0.8) // Default alpha is 0.05, can be left out
power twoproportions 0.123 0.3 n(1000) alpha(0.05) // Solves for power
