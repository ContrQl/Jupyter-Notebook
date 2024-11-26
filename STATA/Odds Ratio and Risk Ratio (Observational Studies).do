// Odds Ratio using Case Control Incidence (cci)
// Retrospective Observational Studies produce OR with no predictive power
// Computes "cross product ratio" or a/c div b/d
cci EXPOSED_DISEASED EXPOSED_NON-DISEASED NON-EXPOSED_DISEASED NON-EXPOSED_NON-DISEASED
// Key outputs: OR and 95% CI

// Risk Ratio using Case Sample Incidence (csi)
// Prospective Observational Studies produce a RR with predictive power
// Computes a/(a+c) div b/(b+d)
csi EXPOSED_DISEASED EXPOSED_NON-DISEASED NON-EXPOSED_DISEASED NON-EXPOSED_NON-DISEASED
// Key outputs: OR and 95%, RR and 95% CI

// N.B. STATA input is the same for both cci and csi
