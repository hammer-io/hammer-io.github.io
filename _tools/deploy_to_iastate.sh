#!/bin/bash

# This script deploys the project website to the one
# hosted on the iastate.edu domain. It should be run
# from the root folder of the project.
#
# USAGE: _tools/deploy_to_iastate.sh

KYEL='\033[1;33m' # Yellow Color
KNRM='\033[0m'    # Normal Color

printf "\n${KYEL}\$ bundle exec jekyll clean${KNRM}\n"
bundle exec jekyll clean

printf "\n${KYEL}\$ bundle exec jekyll build${KNRM}\n"
bundle exec jekyll build

printf "\n${KYEL}\$ sftp sdmay18-19@sdmay18-19.sd.ece.iastate.edu:www <<< \$'put -r _site/*'${KNRM}\n"
sftp sdmay18-19@sdmay18-19.sd.ece.iastate.edu:www <<< $'put -r _site/*'

# Print notes
printf "\n${KYEL}NOTES: If any new directories were added, you'll need to manually sftp into the domain to add the directories with the mkdir comand. This script uploads all files in the _site folder, but it won't delete any old files that exist on the server, and it won't make any new directories.${KNRM}\n"
