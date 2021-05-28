"An orthographic system for texts in the pre-Euclidean Attic alphabet."
struct AtticOrthography <: PolytonicGreek.GreekOrthography
    codepoints
    tokencategories
    tokenizer
end

"""Implement Orthography's codepoints function for AtticOrthography.

$(SIGNATURES)    
"""
function codepoints(attic::AtticOrthography)
    attic.codepoints
end


"""Implement Orthography's tokentypes function for AtticOrthography.

$(SIGNATURES)    
"""
function tokentypes(attic::AtticOrthography)
    attic.tokencategories
end

"""Implement GreekOrthography's consonants function for AtticOrthography.

$(SIGNATURES)    
"""
function consonants(attic::AtticOrthography)
    atticconsonants()
end


"""Implement GreekOrthography's vowels function for AtticOrthography.

$(SIGNATURES)    
"""
function vowels(attic::AtticOrthography)
    atticvowels()
end


"""
Instantiate an AtticOrthography with correct code points and token types.

$(SIGNATURES)
"""
function atticGreek()
    cps = alphabetic() * " \t\n"
    ttypes = [
        Orthography.LexicalToken,
        Orthography.PunctuationToken
    ]
    AtticOrthography(cps, ttypes, tokenizeAtticGreek)
end

"""Tokenize a string in the Attic Greek alphabet.

$(SIGNATURES)
"""
function tokenizeAtticGreek(s::AbstractString)
    wsdelimited = split(s)
    depunctuated = map(s -> splitPunctuation(s), wsdelimited)
    tknstrings = Iterators.flatten(depunctuated) |> collect
    tkns = map(t -> tokenforstring(t), tknstrings)
end


"""Compose a string with all alphabetic characters.


$(SIGNATURES)
"""
function alphabetic()
    groups = ["αβγδεζθικλμνοπρστυφχς",
    "άέίόύ",
    "ὰὲὶὸὺ",
    "ᾶêῖôῦ",
    "h"
    ]
    join(groups,"") |> nfkc
end

"""Compose a string with all punctuation characters.

"""
function punctuation()
    ".,;:"
end



"""
True if all characters in s are alphabetic.

$(SIGNATURES)    
"""
function isAlphabetic(s::AbstractString)
    chlist = split(s,"")
    alphas = alphabetic()
    tfs = []
    for i in collect(eachindex(s)) 
        push!(tfs, occursin(s[i], alphas))
    end
    tfs = map(c -> occursin(c, alphas), chlist)
    nogood = false in tfs
   
    !nogood
end

"""
True if all characters in s are puncutation.
   
$(SIGNATURES)      
"""
function isPunctuation(s::AbstractString)
    chlist = split(s,"")
    puncts = punctuation()
    tfs = map(c -> occursin(c, puncts), chlist)
    nogood = false in tfs
   
    !nogood
end


"""
Create correct OrthographicToken for a given string.

$(SIGNATURES)    
"""
function tokenforstring(s::AbstractString)
    normed = nfkc(s)
    if isAlphabetic(normed)
        OrthographicToken(normed, LexicalToken())
    elseif isPunctuation(normed)
        OrthographicToken(normed, PunctuationToken())
    else
        OrthographicToken(normed, Orthography.UnanalyzedToken())
    end
end


"""
Split off any trailing punctuation and return an Array of leading string + trailing punctuation.

$(SIGNATURES)  
"""
function splitPunctuation(s::AbstractString)
    punct = Orthography.collecttail(s, AtticGreek.punctuation())
    trimmed = Orthography.trimtail(s, AtticGreek.punctuation())
    filter(s -> ! isempty(s), [trimmed, punct])
end



"""
Alphabetically sort a list of words in Unicode Greek.

$(SIGNATURES)
"""
function sortWords(words, ortho::AtticOrthography)
    ag = atticGreek()
    strippedpairs = map(wd ->   
        (replace(AtticGreek.rmaccents(wd, ortho),"h" => "" ), wd), words)
	sorted = sort(strippedpairs)
	map(pr -> pr[2], sorted)
end