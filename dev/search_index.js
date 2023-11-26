var documenterSearchIndex = {"docs":
[{"location":"methods/#Implemented-methods","page":"Implemented methods","title":"Implemented methods","text":"","category":"section"},{"location":"methods/","page":"Implemented methods","title":"Implemented methods","text":"rand\npdf\nlogpdf\ncdf\nquantile\nmean\nmode\nvar\nstd\nskewness","category":"page"},{"location":"methods/#Base.rand","page":"Implemented methods","title":"Base.rand","text":"rand(d::LogisticBeta[, n::Integer])\n\nDraw n random numbers from the logistic-beta distribution d. \n\n\n\n\n\n","category":"function"},{"location":"methods/#Distributions.pdf","page":"Implemented methods","title":"Distributions.pdf","text":"pdf(d::LogisticBeta, x::Real)\n\nCompute the pdf of the logistic-beta distribution d at x. \n\n\n\n\n\n","category":"function"},{"location":"methods/#Distributions.logpdf","page":"Implemented methods","title":"Distributions.logpdf","text":"logpdf(d::LogisticBeta, x::Real)\n\nCompute the logpdf of the logistic-beta distribution d at x. \n\n\n\n\n\n","category":"function"},{"location":"methods/#Distributions.cdf","page":"Implemented methods","title":"Distributions.cdf","text":"cdf(d::LogisticBeta, x::Real)\n\nCompute the cdf of the logistic-beta distribution d at x. \n\n\n\n\n\n","category":"function"},{"location":"methods/#Statistics.quantile","page":"Implemented methods","title":"Statistics.quantile","text":"quantile(d::LogisticBeta, p::Real) \n\nCompute the p-quantile of the logistic-beta distribution d. \n\n\n\n\n\n","category":"function"},{"location":"methods/#Statistics.mean","page":"Implemented methods","title":"Statistics.mean","text":"mean(d::LogisticBeta) \n\nCompute the mean of the logistic-beta distribution d. \n\n\n\n\n\n","category":"function"},{"location":"methods/#StatsBase.mode","page":"Implemented methods","title":"StatsBase.mode","text":"mode(d::LogisticBeta) \n\nCompute the mode of the logistic-beta distribution d. \n\n\n\n\n\n","category":"function"},{"location":"methods/#Statistics.var","page":"Implemented methods","title":"Statistics.var","text":"var(d::LogisticBeta) \n\nCompute the variance of the logistic-beta distribution d. \n\n\n\n\n\n","category":"function"},{"location":"methods/#Statistics.std","page":"Implemented methods","title":"Statistics.std","text":"std(d::LogisticBeta) \n\nCompute the standard deviation of the logistic-beta distribution d. \n\n\n\n\n\n","category":"function"},{"location":"methods/#StatsBase.skewness","page":"Implemented methods","title":"StatsBase.skewness","text":"skewness(d::LogisticBeta) \n\nCompute the skewness of the logistic-beta distribution d. \n\n\n\n\n\n","category":"function"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = LogisticBetaDistribution","category":"page"},{"location":"#LogisticBetaDistribution","page":"Home","title":"LogisticBetaDistribution","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for the Logistic-Beta Distribution also known as Type IV generalized logistic distribution.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [LogisticBetaDistribution]","category":"page"},{"location":"#LogisticBetaDistribution.LogisticBeta","page":"Home","title":"LogisticBetaDistribution.LogisticBeta","text":"LogisticBeta(α, β)\n\nThe Logistic-Beta distribution, also known Generalized Logistic distribution of Type IV.\n\nf(x) = frac1mathrmB(alphabeta) \n       frace^-beta x(1 + e^-x)^(alpha+beta) quad -infty  x  infty\n\nThe distribution is defined by:\n\nIf Y ∼ Beta(α, β), then X = log(Y/(1-Y)) ∼ LogisticBeta(α, β).\n\nThe general LogisticBeta(α, β, μ, σ) is obtained by the location-scale construction: \n\nLogisticBeta(α, β, μ, σ) = μ + σ*LogisticBeta(α, β)\n\nd = LogisticBeta(1/2, 1/2)   # LogisticBeta distribution with shape parameters α and β\n\nparams(d)          # Get the parameters, i.e. (α and β)\npdf(d, 0.5)        # Probability density function at x = 0.5\nmean(d)            # Mean \n\nExternal links\n\nLogistic-Beta distribution on Wikipedia\n\nExamples\n\njulia> d = LogisticBeta(1/2, 1/2)\njulia> rand(d, 4)'\n1×4 adjoint(::Vector{Float64}) with eltype Float64:\n 1.00851  0.640297  0.566234  2.16941\njulia> pdf(d, 1)\njulia> cdf(d, 1)\njulia> dist_general = 3 + 2*LogisticBeta(1/2, 1/2)\njulia> pdf(dist_general, 1)\n\n\n\n\n\n","category":"type"},{"location":"#Base.rand-Tuple{Random.AbstractRNG, LogisticBeta}","page":"Home","title":"Base.rand","text":"rand(d::LogisticBeta[, n::Integer])\n\nDraw n random numbers from the logistic-beta distribution d. \n\n\n\n\n\n","category":"method"},{"location":"#Distributions.cdf-Tuple{LogisticBeta, Real}","page":"Home","title":"Distributions.cdf","text":"cdf(d::LogisticBeta, x::Real)\n\nCompute the cdf of the logistic-beta distribution d at x. \n\n\n\n\n\n","category":"method"},{"location":"#Distributions.logpdf-Tuple{LogisticBeta, Real}","page":"Home","title":"Distributions.logpdf","text":"logpdf(d::LogisticBeta, x::Real)\n\nCompute the logpdf of the logistic-beta distribution d at x. \n\n\n\n\n\n","category":"method"},{"location":"#Distributions.pdf-Tuple{LogisticBeta, Real}","page":"Home","title":"Distributions.pdf","text":"pdf(d::LogisticBeta, x::Real)\n\nCompute the pdf of the logistic-beta distribution d at x. \n\n\n\n\n\n","category":"method"},{"location":"#Statistics.mean-Tuple{LogisticBeta}","page":"Home","title":"Statistics.mean","text":"mean(d::LogisticBeta) \n\nCompute the mean of the logistic-beta distribution d. \n\n\n\n\n\n","category":"method"},{"location":"#Statistics.quantile-Tuple{LogisticBeta, Real}","page":"Home","title":"Statistics.quantile","text":"quantile(d::LogisticBeta, p::Real) \n\nCompute the p-quantile of the logistic-beta distribution d. \n\n\n\n\n\n","category":"method"},{"location":"#Statistics.std-Tuple{LogisticBeta}","page":"Home","title":"Statistics.std","text":"std(d::LogisticBeta) \n\nCompute the standard deviation of the logistic-beta distribution d. \n\n\n\n\n\n","category":"method"},{"location":"#Statistics.var-Tuple{LogisticBeta}","page":"Home","title":"Statistics.var","text":"var(d::LogisticBeta) \n\nCompute the variance of the logistic-beta distribution d. \n\n\n\n\n\n","category":"method"},{"location":"#StatsBase.mode-Tuple{LogisticBeta}","page":"Home","title":"StatsBase.mode","text":"mode(d::LogisticBeta) \n\nCompute the mode of the logistic-beta distribution d. \n\n\n\n\n\n","category":"method"},{"location":"#StatsBase.skewness-Tuple{LogisticBeta}","page":"Home","title":"StatsBase.skewness","text":"skewness(d::LogisticBeta) \n\nCompute the skewness of the logistic-beta distribution d. \n\n\n\n\n\n","category":"method"}]
}
