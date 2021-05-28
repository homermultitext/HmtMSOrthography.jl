
    

    """Implement GreekOrthography's consonants function for AtticOrthography.
    
    $(SIGNATURES)    
    """
    function consonants(msortho::MSOrthography)
        consonants(literaryGreek())
    end
    
    
    """Implement GreekOrthography's vowels function for AtticOrthography.
    
    $(SIGNATURES)    
    """
    function vowels(msortho::MSOrthography)
        vowels(literaryGreek())
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
    
    
    
    
    
   
    
    
  
    
 
    
    
  