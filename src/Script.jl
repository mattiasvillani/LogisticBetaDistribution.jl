using LogisticBetaDistribution

dist = LogisticBeta(1/2,1/2)

rand(dist, 10)
pdf(dist, 1.4)
cdf(dist, 1.4)