# Process tab separated file and output to CSV

BEGIN {
    FS = "|"
    OFS = ","
}
#{ printf( "EW\",%s\",\"%s\"\n\"", $1, $2) }
{ print "\"" $1 "\"", "\"" $2 "\"", "\"" $3 "\"" }
