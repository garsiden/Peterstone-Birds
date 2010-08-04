# Extract 2 and 5 digit code from BTO_Species_List
# additional BTO 2 digit codes to add to birds table

BEGIN {
    OFS = "\t"
}

(length($NF) == 2 && length($(NF - 1)) == 5) {
    print nodot2($(NF)), nodot2($(NF - 1))
}

function nodot(code)
{
    gsub(/\./,"", code)
    return code
}

function nodot2(code)
{
    return gensub(/\./,"","g",code)
}
