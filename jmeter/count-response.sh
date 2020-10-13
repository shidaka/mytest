#!/bin/bash
echo "ZUUL (TGZ)-----------------------------------------"
TOTAL=$(ls responses/TGZ | wc -l)

echo "Total: $TOTAL"
if [ $TOTAL != 0 ]
then
    awk -f responses.awk responses/TGZ/*
fi

echo "MYSERVICE (TGM)------------------------------------"
TOTAL=$(ls responses/TGM | wc -l)

echo "Total: $TOTAL"
if [ $TOTAL != 0 ]
then
    awk -f responses.awk responses/TGM/*
fi

