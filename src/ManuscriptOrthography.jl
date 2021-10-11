module ManuscriptOrthography

using Unicode 

using Orthography
import Orthography: OrthographyTrait
import Orthography: tokentypes 
import Orthography: codepoints 
import Orthography: tokenize

using PolytonicGreek
import PolytonicGreek: syllabify
import PolytonicGreek: accentword
import PolytonicGreek: accentultima
import PolytonicGreek: accentpenult
import PolytonicGreek: accentantepenult
import PolytonicGreek: sortWords
import PolytonicGreek: vowels
import PolytonicGreek: consonants
import PolytonicGreek: rmaccents
import PolytonicGreek: countaccents
import PolytonicGreek: augment

using Documenter, DocStringExtensions

export ManuscriptOrthography, msGreek

export codepoints, tokentypes, tokenize

#export atticGreek, vowels, consonants
#export sortWords


#export rmaccents, countaccents
#export accentword, accentultima, accentpenult, accentantepenult

#export syllabify


include("ortho.jl")
include("lexical.jl")

end # module
