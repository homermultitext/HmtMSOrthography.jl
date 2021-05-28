"An orthographic system for texts in the pre-Euclidean Attic alphabet."
struct MSOrthography <: PolytonicGreek.GreekOrthography
    codepoints
    tokencategories
    tokenizer
end


function msGreek()
    cps = alphabetic() * " \t\n"
    ttypes = [
        Orthography.LexicalToken,
        Orthography.PunctuationToken
    ]
    AtticOrthography(cps, ttypes, tokenizeAtticGreek)
end