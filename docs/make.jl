# Run this from repository root, e.g. with
# 
#    julia --project=docs/ docs/make.jl
#
using Pkg
Pkg.activate(".")
Pkg.instantiate()

using Documenter, DocStringExtensions
using AtticGreek

makedocs(
    sitename = "HmtMSOrthography.jl",
    pages = [
        "Home" => "index.md"
    ]
)

deploydocs(
    repo = "github.com/homermultitext/HmtMSOrthography.jl.git",
) 