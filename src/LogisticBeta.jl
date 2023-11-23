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
julia> dist = LogisticBeta(1/2, 1/2)
julia> rand(dist, 4)'
1×4 adjoint(::Vector{Float64}) with eltype Float64:
 1.00851  0.640297  0.566234  2.16941
julia> pdf(dist, 1)
julia> cdf(dist, 1)
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

function Distributions.pdf(dist::LogisticBeta, x::Real)
    return (logistic(x)^dist.α * logistic(-x)^dist.β)/beta(dist.α,dist.β)
end

function Distributions.logpdf(dist::LogisticBeta, x::Real)
    return -logbeta(dist.α, dist.β) + dist.α*x - (dist.α + dist.β)*log1pexp(x) 
                                                            # log1pexp(x) = log(1 + exp(x))
end

function Distributions.cdf(dist::LogisticBeta, x::Real)
    return beta_inc(dist.α, dist.β, logistic(x))[1]
end

function Distributions.quantile(dist::LogisticBeta, p)
    quantBeta = quantile(Beta(dist.α, dist.β), p)
    return logit(quantBeta)  
end

function Distributions.mean(dist::LogisticBeta)
    return digamma(dist.α) - digamma(dist.β)
end

function Distributions.var(dist::LogisticBeta)
    return trigamma(dist.α) + trigamma(dist.β)
end

function Distributions.std(dist::LogisticBeta)
    return sqrt(trigamma(dist.α) + trigamma(dist.β))
end

function Distributions.params(dist::LogisticBeta)
    return dist.α, dist.β
end