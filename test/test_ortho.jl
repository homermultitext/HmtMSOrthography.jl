
@testset "Test implementation of Orthography functions" begin
    msgreek = msGreek()
    @test codepoints(msgreek) == msgreek.codepoints
    @test tokentypes(msgreek) == [Orthography.LexicalToken, Orthography.PunctuationToken, Orthography.UnanalyzedToken]
end


@testset "Test splitting words on punctuation" begin
    s = "κακῶς⁑"
    splitup = HmtMSOrthography.splitPunctuation(s)
    @test length(splitup) == 2
end