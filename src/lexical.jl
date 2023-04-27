
function rmaccents(s::AbstractString, ortho::MSOrthography)
end

function addacute(s::AbstractString)
    PolytonicGreek.addacute(s)
end

function addcircumflex(s::AbstractString)
    PolytonicGreek.addcircumflex(s)
end

function accentsyllable(s::AbstractString, syll, ortho::MSOrthography)  
    accentsyllable(s,syll,literaryGreek())
end

function augment(s::AbstractString, ortho::MSOrthography)
    augment(s, literaryGreek())
end

#=
function augment(ortho::MSOrthography; s::AbstractString = "")
    PolytonicGreek.augment(literaryGreek(); s = s)
end
=#
function augment_initial(ortho::MSOrthography)
    PolytonicGreek.nfkc("ἐ")
end


function augment_medial(ortho::MSOrthography)
    "ε"
end
