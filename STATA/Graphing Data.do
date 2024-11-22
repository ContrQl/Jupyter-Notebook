// Graphing Data, with an eye toward modelling

// Histogram with number of bins specified (14 bins by default), with a specific start bin, and checked for normality
// Second option to check for normality using quantile-quantile plot (qq-plot)
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
