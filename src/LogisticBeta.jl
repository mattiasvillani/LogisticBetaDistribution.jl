import Distributions: logpdf, pdf, cdf, quantile, std, mean
import Base.rand
import Base.length

""" 
    LogisticBeta(α, β) 

Define the LogisticBeta(α, β, 0, 1)-distribution. 

This standardized case of the LogisticBeta distribution is the same as 
log(x/(1-x)) for x ∼ Beta(α, β).
The general LogisticBeta(α, β, μ, σ) is obtained by the Distributions.jl location-scale construction:
μ + σ*LogisticBeta(α, β)

# Examples
```julia-repl
julia> d = LogisticBeta(1/2, 1/2)
julia> rand(d, 4)'
1×4 adjoint(::Vector{Float64}) with eltype Float64:
 1.00851  0.640297  0.566234  2.16941
julia> pdf(d, 1)
julia> cdf(d, 1)
julia> dist_general = 3 + 2*LogisticBeta(1/2, 1/2)
julia> pdf(dist_general, 1)
```
""" 
struct LogisticBeta <: ContinuousUnivariateDistribution
    α::Real
    β::Real
end

LogisticBeta(α::Real, β::Real, μ::Real, σ::Real) = μ + σ*LogisticBeta(α, β)

function rand(rng::Random.AbstractRNG, d::LogisticBeta)
    x = rand(Beta(d.α, d.β))
    return logit.(x) # this is log.(x./(1 .- x))
end

function Distributions.pdf(d::LogisticBeta, x::Real)
    return (logistic(x)^d.α * logistic(-x)^d.β)/beta(d.α,d.β)
end

function Distributions.logpdf(d::LogisticBeta, x::Real)
    return -logbeta(d.α, d.β) + d.α*x - (d.α + d.β)*log1pexp(x) 
                                                            # log1pexp(x) = log(1 + exp(x))
end

function Distributions.cdf(d::LogisticBeta, x::Real)
    return beta_inc(d.α, d.β, logistic(x))[1]
end

function Distributions.quantile(d::LogisticBeta, p)
    quantBeta = quantile(Beta(d.α, d.β), p)
    return logit(quantBeta)  
end

function Distributions.mean(d::LogisticBeta)
    return digamma(d.α) - digamma(d.β)
end

function Distributions.var(d::LogisticBeta)
    return trigamma(d.α) + trigamma(d.β)
end

function Distributions.std(d::LogisticBeta)
    return sqrt(trigamma(d.α) + trigamma(d.β))
end

function Distributions.params(d::LogisticBeta)
    return d.α, d.β
end