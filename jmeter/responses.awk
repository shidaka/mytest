BEGIN {
    count_504 = 0
    count_500 = 0
    count_404 = 0
    count_TO = 0
    count_CR = 0
    count_RE = 0
    count_HU = 0
    count_OF = 0
}
{
    if ($0 ~ /"status":500/) {
        #print ">>>", $0
        count_500 += 1
    } else if ($0 ~ /java.net.ConnectException: Connection timed out/) {
        #print ">>>", $0
        count_TO += 1
    } else if ($0 ~ /java.net.SocketException: Connection reset/) {
        #print ">>>", $0
        count_CR += 1
    } else if ($0 ~ /org.apache.http.NoHttpResponseException/) {
        #print ">>>", $0
        count_NR += 1
    } else if ($0 ~ /java.net.ConnectException: Connection refused/) {
        #print ">>>", $0
        count_RE += 1
    } else if ($0 ~ /java.net.NoRouteToHostException: No route to host/) {
        #print ">>>", $0
        count_HU += 1
    } else if ($0 ~ /java.net.SocketException: Too many open files/) {
        #print ">>>", $0
        count_OF += 1
        
    } else if ($0 ~/"status":404/) {
        count_404 += 1
    } else if ($0 ~ /"status":504/) {
        count_504 += 1
    } else if ($0 ~ /Exception/) {
        print
    } else {
        #print
    }
}
END {
    print "HTTP Error 504:", count_504
    print "HTTP Error 500:", count_500
    print "HTTP Error 404:", count_404
    print "Connection time out:", count_TO
    print "Connection reset:", count_CR
    print "Connection refused:", count_RE
    print "No route to host (Host Unreachable):", count_HU
    print "No Http Response:", count_NR
    print "Too manu open files:", count_OF
}
