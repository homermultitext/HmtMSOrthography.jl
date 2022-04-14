
@testset "Test augment" begin
    msortho = msGreek()

    @test  augment(msortho) == nfkc("ἐ")

    @test augment(msortho; s = "κελευε") == nfkc("ἐκελευε")
    @test augment(msortho; s = "ῥυε") == nfkc("ἐρρυε")

    @test augment(msortho; s = "αἱρει") == nfkc("ᾑρει")
    @test augment(msortho; s = "εἰκαζε") == nfkc("ᾐκαζε")
    @test augment(msortho; s = "οἰκει") == nfkc("ᾠκει")
    @test augment(msortho; s = "αὐλησε") == nfkc("ηὐλησε")
    @test augment(msortho; s = "εὐχετο") == nfkc("ηὐχετο")

    @test augment(msortho; s = "ἀκουσε") == nfkc("ἠκουσε")
    @test augment(msortho; s = "ἐλπιζε") == nfkc("ἠλπιζε")
    @test augment(msortho; s = "ὁριζε") == nfkc("ὡριζε")

    @test augment(msortho; s = "ἱκετευε") == nfkc("ἱ_κετευε")
    @test augment(msortho; s = "ὑβριζε") == nfkc("ὑ_βριζε")

    @test augment(msortho; s = "") == nfkc("ἐ")

    @test augment_initial(msortho) == nfkc("ἐ")
    @test augment_medial(msortho) == "ε"
   
    
end