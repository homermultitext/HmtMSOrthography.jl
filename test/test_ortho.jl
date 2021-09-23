
@testset "Test implementation of Orthography functions" begin
    msgreek = msGreek()
    @test codepoints(msgreek) == msgreek.codepoints
    @test tokentypes(msgreek) == [Orthography.LexicalToken, Orthography.PunctuationToken, Orthography.UnanalyzedToken]
end


@testset "Test splitting words on punctuation" begin
    s = "κακῶς⁑"
    splitup = ManuscriptOrthography.splitPunctuation(s)
    @test length(splitup) == 2
end


@testset "Test categorizing valid characters and strings" begin
    @test validstring(msGreek(), "⁑")
    @test validstring(msGreek(), "‡")
    @test validstring(msGreek(), "¶")
    @test validstring(msGreek(), "⸌")
end

@testset "Test tokenization" begin
    s = "κακῶς⁑"
    tkns = tokenize(msGreek(), s)
    @test length(tkns) == 2
    @test tkns[1].tokencategory == LexicalToken()
    @test tkns[2].tokencategory == PunctuationToken()
    s2 = "ἄειδε,"
    tkns2 = tokenize(msGreek(), s2)
    @test length(tkns2) == 2
    @test tkns2[1].tokencategory == LexicalToken()
    @test tkns2[2].tokencategory == PunctuationToken()

    s3 = "οἱ δὲ⸌"
    tkns3 = tokenize(msGreek(), s3)
    @test length(tkns3) == 2
    @test tkns3[1].tokencategory == LexicalToken()
    @test tkns3[2].tokencategory == LexicalToken()
end

