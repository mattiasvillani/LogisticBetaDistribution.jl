import Distributions: logpdf, pdf, cdf, quantile, std, mean, skewness, @check_args, @distr_support
import Base.rand
import Base.length

""" 
    LogisticBeta(α, β) 

The Logistic-Beta distribution, also known Generalized Logistic distribution of Type IV.

```math
f(x) = \\frac{1}{\\mathrm{B}(\\alpha,\\beta)} 
       \\frac{e^{-\\beta x}}{(1 + e^{-x})^{(\\alpha+\\beta)}}, \\quad -\\infty < x < \\infty
```
 
The distribution is defined by:

If Y ∼ Beta(α, β), then X = log(Y/(1-Y)) ∼ LogisticBeta(α, β).

The general LogisticBeta(α, β, μ, σ) is obtained by the location-scale construction: 

LogisticBeta(α, β, μ, σ) = μ + σ*LogisticBeta(α, β)




```julia
d = LogisticBeta(1/2, 1/2)   # LogisticBeta distribution with shape parameters α and β

params(d)          # Get the parameters, i.e. (α and β)
pdf(d, 0.5)        # Probability density function at x = 0.5
mean(d)            # Mean 
```

External links

* [Logistic-Beta distribution on Wikipedia](https://en.wikipedia.org/wiki/Generalized_logistic_distribution#Type_IV)

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
struct LogisticBeta{T<:Real} <: ContinuousUnivariateDistribution
    α::T
    β::T
    LogisticBeta{T}(α::T, β::T) where {T} = new{T}(α, β)
end

function LogisticBeta(α::T, β::T; check_args::Bool=true) where {T <: Real}
    @check_args LogisticBeta (α, α > zero(α)) (α, α > zero(α))
    return LogisticBeta{T}(α, β)
end

LogisticBeta(α::Real, β::Real; check_args::Bool=true) = LogisticBeta(promote(α, β)...;  
    check_args = check_args)
LogisticBeta(α::Integer, β::Integer; check_args::Bool=true) = LogisticBeta(
    float(α), float(β); check_args = check_args)

@distr_support LogisticBeta -Inf Inf

Base.eltype(::Type{LogisticBeta{T}}) where {T} = T

# Non-standardized LogisticBeta
# LogisticBeta(α::T, β::T, μ::T, σ::T) = μ + σ*LogisticBeta(α::T, β::T) where {T<:Real}

#### Conversions
convert(::Type{LogisticBeta{T}}, α::S, β::S) where {T <: Real, S <: Real} = 
    LogisticBeta(T(α), T(β))
Base.convert(::Type{LogisticBeta{T}}, d::LogisticBeta) where {T<:Real} = 
    LogisticBeta{T}(T(d.α), T(d.β))
Base.convert(::Type{LogisticBeta{T}}, d::LogisticBeta{T}) where {T<:Real} = d

#### Parameters
params(d::LogisticBeta) = (d.α, d.β)
partype(::LogisticBeta{T}) where {T} = T

function Base.rand(rng::Random.AbstractRNG, d::LogisticBeta)
    x = rand(rng, Beta(d.α, d.β))
    return logit.(x) # this is log.(x./(1 .- x))
end
#TODO: Implement rand!(rng::Random.AbstractRNG, d::LogisticBeta, x::AbstractArray)

pdf(d::LogisticBeta, x::Real) = (logistic(x)^d.α * logistic(-x)^d.β)/beta(d.α,d.β)
logpdf(d::LogisticBeta, x::Real) = -logbeta(d.α, d.β) + d.α*x - 
    (d.α + d.β)*log1pexp(x)                    
cdf(d::LogisticBeta, x::Real) = beta_inc(d.α, d.β, logistic(x))[1]
quantile(d::LogisticBeta, p) = logit(quantile(Beta(d.α, d.β), p))

mean(d::LogisticBeta) = digamma(d.α) - digamma(d.β)
mode(d::LogisticBeta) = log(d.α/d.β)
var(d::LogisticBeta) = trigamma(d.α) + trigamma(d.β)
std(d::LogisticBeta) = sqrt(trigamma(d.α) + trigamma(d.β))
skewness(d::LogisticBeta) = (polygamma(2, d.α) - polygamma(2, d.β))/(var(d::LogisticBeta)^3)