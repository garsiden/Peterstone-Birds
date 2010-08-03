# Extract 4 digit code, species name, scientific name from gos_list.txt
# Match on scientific name to update birds table

BEGIN {
    OFS = "\t"
    FS  = "\t"
}
{ print $2, $3, $7}
