using LogisticBetaDistribution
using Distributions: mean, std, var, pdf, logpdf, cdf, quantile, skewness

@testset "LogisticBetaTests.jl" begin

    d = LogisticBeta(1/2,1/2)
    @test cdf.(d, quantile.(d, 0.1:0.1:0.9)) ≈ 0.1:0.1:0.9

    d = LogisticBeta(3/2,3/2)
    @test cdf.(d, quantile.(d, 0.1:0.1:0.9)) ≈ 0.1:0.1:0.9

    @test pdf(d, 1) ≈ exp(logpdf(d, 1))

    @test pdf(d, 1) ≈ pdf(d, -1) # symmetry test

    @test cdf(d,-1) ≈ 1 - cdf(d, 1) # symmetry test

    @test var(d) ≈ std(d).^2

    β = rand()
    params(LogisticBeta(2*β, β)) == (2*β, β)
    @test mode(LogisticBeta(2*β, β)) ≈ log(2) 
    @test mean(LogisticBeta(1, 2)) ≈ -1

    # Z-distribution, location scale variant
    x = 1; μ = 2; σ = 3;
    @test mean(μ + LogisticBeta(1/2,1/2)) ≈ μ 
    @test std(LogisticBeta(1/2, 1/2)*σ) ≈ σ*std(LogisticBeta(1/2,1/2))
    
    @test pdf(μ + LogisticBeta(1/2,1/2)*σ, x) ≈ (1/σ)*pdf(LogisticBeta(1/2,1/2), (x-μ)/σ)
    @test cdf(μ + LogisticBeta(1/2,1/2)*σ, x) ≈ cdf(LogisticBeta(1/2,1/2), (x-μ)/σ)
    @test skewness(μ + LogisticBeta(1/2,1/2)*σ) ≈ skewness(LogisticBeta(1/2,1/2))
    
end