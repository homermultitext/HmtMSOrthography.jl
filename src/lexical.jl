
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