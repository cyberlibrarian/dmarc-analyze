!/bin/bash
#############################################################################
# Gather DMARC, DKIM, SPF, and miscelaneous DNS records for a domains
#
# This prototype version simply calls the executable "checkdmarc" which
# comes from the PyPi project. It is not very fast. Eventually, we will
# write a python application that does parallel lookups for more speed.
#
# Globals:
#   none
# Arguments:
#   none
# Input:
#   /domain-data/top-1m.csv
# Output:
#   /domain-data/<domain>.json
#
# Notes:
#   This program will read top-1m.csv line-by-line. It must contain
#   a list of DNS domains, one per line in CSV format. The 2nd feild is
#   the domain, the 1st field is ignored (Alexa Top 1 million format)
#
#   If there is not already a file named <domain>.json in the Output
#   directory, we will run checkdmarc and output the file.
#
#############################################################################


cut -d, -f2 /domain-data/top-1m.csv | while read DOMAIN
do
  if [[ ! -f "/domain-data/domains/${DOMAIN}.json" ]]
  then
    checkdmarc ${DOMAIN} > "/domain-data/domains/${DOMAIN}.json"
  fi
done
