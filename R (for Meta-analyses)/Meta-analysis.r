m.cont <- metacont(n.e = n1, mean.e = m1, sd.e = s1,
n.c = n2, mean.c = m2, sd.c = s2,
studlab = Study, data = “Metadata”, sm = "SMD", 
method.smd = "Hedges", common = FALSE, 
random = TRUE, title = ”SSRI versus placebo for glycaemia")