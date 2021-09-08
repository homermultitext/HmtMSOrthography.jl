# Run this from repository root, e.g. with
#
#    julia --project=docs/ docs/make.jl
#
# Run this from repository root to serve:
#
#   julia -e 'using LiveServer; serve(dir="docs/build")'julia -e 'using LiveServer; serve(dir="docs/build")'
using Pkg
Pkg.activate(".")
Pkg.instantiate()

using Documenter, DocStringExtensions
using ManuscriptOrthography

makedocs(
    sitename = "ManuscriptOrthography.jl",
    pages = [
        "Home" => "index.md",
        "API documentation" => "apis.md"
    ]
)

deploydocs(
    repo = "github.com/homermultitext/ManuscriptOrthography.jl.git",
) 