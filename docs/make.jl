using LogisticBetaDistribution
using Documenter

DocMeta.setdocmeta!(LogisticBetaDistribution, :DocTestSetup, :(using LogisticBetaDistribution); recursive=true)

makedocs(;
    sitename="LogisticBetaDistribution.jl",
    modules=[LogisticBetaDistribution],
    authors="Mattias Villani",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mattiasvillani.github.io/LogisticBetaDistribution.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "home.md",
        "Implemented methods" => "methods.md",
        "Index" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mattiasvillani/LogisticBetaDistribution.jl",
)
