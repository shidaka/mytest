BEGIN {
    count_500 = 0
    count_TO = 0
}
{
    if ($0 ~ /"status":500/) {
        #print ">>>", $0
        count_500 += 1
    } else if ($0 ~ /Connection timed out/) {
        print ">>>", $0
        count_TO += 1
    } else {

        print
    }
}
END {
    print "HTTP Error 500:", count_500
    print "Connection time out:", count_TO
}