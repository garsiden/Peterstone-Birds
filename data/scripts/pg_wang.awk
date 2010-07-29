# Output in format suitable for PostgreSQL COPY
# Source file format (BTO code and date):
#   XX <tab> YYYY-XX-XX

BEGIN {
    FS  = "\t"
    OFS = "\t"
}
{ print "EW", $1, $2, "\\N" }
