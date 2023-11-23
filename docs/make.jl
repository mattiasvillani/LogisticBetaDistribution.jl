using LogisticBetaDistribution
using Documenter

DocMeta.setdocmeta!(LogisticBetaDistribution, :DocTestSetup, :(using LogisticBetaDistribution); recursive=true)

makedocs(;
    modules=[LogisticBetaDistribution],
    authors="Mattias Villani, Oskar Gustafsson",
    repo="https://github.com/mattiasvillani/LogisticBetaDistribution.jl/blob/{commit}{path}#{line}",
    sitename="LogisticBetaDistribution.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mattiasvillani.github.io/LogisticBetaDistribution.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mattiasvillani/LogisticBetaDistribution.jl",
    devbranch="main",
)
