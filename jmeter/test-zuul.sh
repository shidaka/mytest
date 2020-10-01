#!/bin/sh

JMETER_TEST_PLAN='Test Plan-zuul.jmx'
SAMPLES_OUT='Test Plan-zuul.jtl'
JMETER_LOGFILE='Test Plan-zuul.log'

jmeter -n -t "$JMETER_TEST_PLAN" -l "$SAMPLES_OUT" -j "$JMETER_LOGFILE"

