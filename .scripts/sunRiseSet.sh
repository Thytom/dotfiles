#!/bin/bash

# Weather code for Hull, United Kingdom
location="UKXX0075"

# Get sun rise/set data from weather.com
sun_times=$( /usr/bin/lynx --dump http://weather.com/weather/today/l/$location | /bin/grep "\* Sun" | /bin/sed "s/[[:alpha:]]//g;s/*//" )

sunrise=$(/bin/date --date="`echo $sun_times | /usr/bin/awk '{ print $1}'` AM" +%R)
sunset=$(/bin/date --date="`echo $sun_times | /usr/bin/awk '{ print $2}'` PM" +%R)

echo "$sunrise"
echo "$sunset"
