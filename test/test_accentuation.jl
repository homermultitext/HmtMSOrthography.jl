
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
    @test HmtMSOrthography.addacute("α") == "ά"
    @test HmtMSOrthography.addacute("αυ") == "αύ"
    @test HmtMSOrthography.addacute("ᾀ") == "ᾄ"
    @test HmtMSOrthography.addacute("ϊ") == "ΐ"
end


@testset "Test adding circumflex accents to vowels" begin
    @test HmtMSOrthography.addcircumflex("α") == "ᾶ"
    @test HmtMSOrthography.addcircumflex("αυ") == "αῦ"
    @test HmtMSOrthography.addcircumflex("ᾀ") == "ᾆ"
    @test HmtMSOrthography.addcircumflex("ϊ") == "ῗ"
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
    @test HmtMSOrthography.antepenult("ἄνθρωπος", lg) == "ἀν"
    @test HmtMSOrthography.penult("ἄνθρωπος", lg) ==  "θρω"
end

@testset "Test adding accent to specified syllable of word" begin
    lg = literaryGreek()
    @test HmtMSOrthography.accentpenult("γνωμη", :ACUTE, lg) == "γνώμη"
    @test HmtMSOrthography.accentultima("γνωμων", :CIRCUMFLEX, lg) == "γνωμῶν"
    @test HmtMSOrthography.accentantepenult("ἐκελευον", lg) == "ἐκέλευον"
end

@testset "Test flipping grave to acute" begin
    lg = literaryGreek()
    @test HmtMSOrthography.flipaccent("τὰ", lg) == nfkc("τά")
    @test HmtMSOrthography.flipaccent("τῶν", lg) == nfkc("τῶν")
    @test HmtMSOrthography.flipaccent("τά", lg) == nfkc("τά")
end

@testset "Test stripping consonants" begin
    lg = literaryGreek()
    @test HmtMSOrthography.vowelsonly("τῶν", lg) == "ῶ"
end

@testset "Test counting accents" begin
    lg = literaryGreek()
    @test HmtMSOrthography.countaccents("ό", lg) == 1
    @test HmtMSOrthography.countaccents("ἄνθρωπός", lg) == 2
end

@testset "Test stripping enclitic" begin
    lg = literaryGreek()
    @test HmtMSOrthography.stripenclitic("ἄνθρωπός", lg) == "ἄνθρωπος"
end

@testset "Test normalizing word string to morphologically normal form" begin
    lg = literaryGreek()
    @test HmtMSOrthography.tokenform("ἄνθρωπός", lg) == nfkc("ἄνθρωπος")
    @test HmtMSOrthography.tokenform("ὁδὸν", lg) == nfkc("ὁδόν")
end


@testset "Test recognizing final οι/αι as short" begin
    lg = literaryGreek()
    @test HmtMSOrthography.finallong("οι", lg) == false
    @test accentword("ἀνθρωποι", :RECESSIVE, lg) == nfkc("ἄνθρωποι")
    @test accentword("γνωμα_ς", :PENULT, lg) == nfkc("γνώμα_ς")
end

@testset "Test recognizing non-final οι/αι as long" begin
    lg = literaryGreek()
    @test HmtMSOrthography.finallong("οις", lg) 
end

=#