
@testset "Test augment" begin
    msortho = msGreek()

    @test augment("κελευε", msortho) == nfkc("ἐκελευε")
    @test augment("ῥυε", msortho) == nfkc("ἐρρυε")

    @test augment("αἱρει", msortho) == nfkc("ᾑρει")
    @test augment("εἰκαζε", msortho) == nfkc("ᾐκαζε")
    @test augment("οἰκει", msortho) == nfkc("ᾠκει")
    @test augment("αὐλησε", msortho) == nfkc("ηὐλησε")
    @test augment("εὐχετο", msortho) == nfkc("ηὐχετο")

    @test augment("ἀκουσε", msortho) == nfkc("ἠκουσε")
    @test augment("ἐλπιζε", msortho) == nfkc("ἠλπιζε")
    @test augment("ὁριζε", msortho) == nfkc("ὡριζε")

    @test augment("ἱκετευε", msortho) == nfkc("ἱ_κετευε")
    @test augment("ὑβριζε", msortho) == nfkc("ὑ_βριζε")


    @test augment_initial(msortho) == nfkc("ἐ")
    @test augment_medial(msortho) == "ε"
   
    @test augment(nfkc("ἐκ#φερε"), msortho) == nfkc("ἐξ#εφερε")

end