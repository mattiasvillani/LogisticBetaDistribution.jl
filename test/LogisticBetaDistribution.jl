using LogisticBetaDistribution
using Distributions: mean, std, var, pdf, logpdf, cdf, quantile

@testset "LogisticBetaTests.jl" begin


    dist = LogisticBeta(1/2,1/2)
    @test cdf.(dist, quantile.(dist, 0.1:0.1:0.9)) ≈ 0.1:0.1:0.9

    dist = LogisticBeta(3/2,3/2)
    @test cdf.(dist, quantile.(dist, 0.1:0.1:0.9)) ≈ 0.1:0.1:0.9

    @test pdf(dist, 1) ≈ exp(logpdf(dist, 1))

    @test cdf(dist,-1) ≈ 1 - cdf(dist, 1) # symmetry test

    @test var(dist) ≈ std(dist).^2

    # Z-distribution, location scale variant
    x = 1; μ = 2; σ = 3;
    @test mean(LogisticBeta(1/2,1/2, μ, σ)) ≈ μ 
    @test std(LogisticBeta(1/2,1/2, 0, σ)) ≈ σ*std(LogisticBeta(1/2,1/2))
    
    @test pdf(LogisticBeta(1/2,1/2, μ, σ), x) ≈ (1/σ)*pdf(LogisticBeta(1/2,1/2), (x-μ)/σ)
    @test cdf(LogisticBeta(1/2,1/2, μ, σ), x) ≈ cdf(LogisticBeta(1/2,1/2), (x-μ)/σ)

    
end