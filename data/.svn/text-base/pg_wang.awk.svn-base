# Process tab separated file and output to CSV

BEGIN {
    FS = "\t"
    OFS = ","
}
#{ printf( "EW\",%s\",\"%s\"\n\"", $1, $2) }
{ print "\"EW\"", "\"" $1 "\"", "\"" $2 "\"" }
