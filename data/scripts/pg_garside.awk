# Process "|" separated file and output as:
#     NG <tab> bto_code <tab> first_date <tab> NULL
#
# Source file format:
#   XX <|> species name <|> number <|> YYYY-MM-DD

BEGIN {
#   default FS is all whitespace, so will remove tabs and spaces
    OFS = "\t"
}
# print first and last fields only and add \N
{print "NG", $1, $(NF), "\\N"}


