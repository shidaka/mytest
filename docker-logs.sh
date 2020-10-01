#!/bin/sh

echo "---------------------------------------- myzuul ----------------------------------------------"
docker logs myzuul     2> /dev/null | awk '{ if(tolower($0) ~/maxheapsize|maxram/) print $0 }'
echo "---------------------------------------- myeureka --------------------------------------------"
docker logs myeureka   2> /dev/null | awk '{ if(tolower($0) ~/maxheapsize|maxram/) print $0 }'
echo "---------------------------------------- myservice1 ------------------------------------------"
docker logs myservice1 2> /dev/null | awk '{ if(tolower($0) ~/maxheapsize|maxram/) print $0 }'
echo "---------------------------------------- myservice2 ------------------------------------------"
docker logs myservice2 2> /dev/null | awk '{ if(tolower($0) ~/maxheapsize|maxram/) print $0 }'

#cat logs

# rm -f logs


