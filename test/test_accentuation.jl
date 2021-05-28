
@testset "Test stripping accents with default orthography" begin
    s = "πολλά"
    expected = "πολλα"
    @test rmaccents(s) == expected
end

@testset "Test stripping accents with specified orthography" begin
    s = "πολλά"
    expected = "πολλα"
    lg = literaryGreek()
    @test rmaccents(s, lg) == expected
end

@testset "Test adding acute accents to vowels" begin
    @test ManuscriptOrthography.addacute("α") == "ά"
    @test ManuscriptOrthography.addacute("αυ") == "αύ"
    @test ManuscriptOrthography.addacute("ᾀ") == "ᾄ"
    @test ManuscriptOrthography.addacute("ϊ") == "ΐ"
end

@testset "Test adding circumflex accents to vowels" begin
    @test ManuscriptOrthography.addcircumflex("α") == "ᾶ"
    @test ManuscriptOrthography.addcircumflex("αυ") == "αῦ"
    @test ManuscriptOrthography.addcircumflex("ᾀ") == "ᾆ"
    @test ManuscriptOrthography.addcircumflex("ϊ") == "ῗ"
end
#=

@testset "Test adding accents to syllables" begin
    @test accentsyllable("των", :CIRCUMFLEX) == "τῶν"
    @test accentsyllable("τα", :ACUTE) == "τά"
    @test accentsyllable("ᾀ", :ACUTE) == "ᾄ"
end

@testset "Test adding accents to words" begin
    lg = literaryGreek()
    @test accentword("ἀνθρωπος", :RECESSIVE, lg) == "ἄνθρωπος"
    @test accentword("ἀνθρωπους", :RECESSIVE, lg) == "ἀνθρώπους"
    @test accentword("ἀνθρωποι", :RECESSIVE, lg) == nfkc("ἄνθρωποι")
    @test accentword("θεραπαιναι", :RECESSIVE,lg) == nfkc("θεράπαιναι")
    @test accentword("δωρον", :PENULT, lg) == "δῶρον"
    @test accentword("δωρῳ", :PENULT, lg) == "δώρῳ"
end

@testset "Test extracting syllables from words" begin
    lg = literaryGreek()
    @test ManuscriptOrthography.antepenult("ἄνθρωπος", lg) == "ἀν"
    @test ManuscriptOrthography.penult("ἄνθρωπος", lg) ==  "θρω"
end

@testset "Test adding accent to specified syllable of word" begin
    lg = literaryGreek()
    @test ManuscriptOrthography.accentpenult("γνωμη", :ACUTE, lg) == "γνώμη"
    @test ManuscriptOrthography.accentultima("γνωμων", :CIRCUMFLEX, lg) == "γνωμῶν"
    @test ManuscriptOrthography.accentantepenult("ἐκελευον", lg) == "ἐκέλευον"
end

@testset "Test flipping grave to acute" begin
    lg = literaryGreek()
    @test ManuscriptOrthography.flipaccent("τὰ", lg) == nfkc("τά")
    @test ManuscriptOrthography.flipaccent("τῶν", lg) == nfkc("τῶν")
    @test ManuscriptOrthography.flipaccent("τά", lg) == nfkc("τά")
end

@testset "Test stripping consonants" begin
    lg = literaryGreek()
    @test ManuscriptOrthography.vowelsonly("τῶν", lg) == "ῶ"
end

@testset "Test counting accents" begin
    lg = literaryGreek()
    @test ManuscriptOrthography.countaccents("ό", lg) == 1
    @test ManuscriptOrthography.countaccents("ἄνθρωπός", lg) == 2
end

@testset "Test stripping enclitic" begin
    lg = literaryGreek()
    @test ManuscriptOrthography.stripenclitic("ἄνθρωπός", lg) == "ἄνθρωπος"
end

@testset "Test normalizing word string to morphologically normal form" begin
    lg = literaryGreek()
    @test ManuscriptOrthography.tokenform("ἄνθρωπός", lg) == nfkc("ἄνθρωπος")
    @test ManuscriptOrthography.tokenform("ὁδὸν", lg) == nfkc("ὁδόν")
end


@testset "Test recognizing final οι/αι as short" begin
    lg = literaryGreek()
    @test ManuscriptOrthography.finallong("οι", lg) == false
    @test accentword("ἀνθρωποι", :RECESSIVE, lg) == nfkc("ἄνθρωποι")
    @test accentword("γνωμα_ς", :PENULT, lg) == nfkc("γνώμα_ς")
end

@testset "Test recognizing non-final οι/αι as long" begin
    lg = literaryGreek()
    @test ManuscriptOrthography.finallong("οις", lg) 
end

=#