#!/usr/bin/env bash

set -e

# Run this from the root project dir with scripts/recreate_venv.sh

rm -rf .venv
rm -rf soda_sql.egg-info

#python3 -m venv .venv
python3.9 -m venv .venv 
# shellcheck disable=SC1091
source .venv/bin/activate
pip install --upgrade pip 
pip install "$(grep pip-tools < dev-requirements.in )"  
pip-compile dev-requirements.in 
pip install -r dev-requirements.txt
echo 'pre-commit befor rnd'
pip install pre-commit 
echo 'pre-commit after rnd'

cat requirements.txt | while read requirement || [[ -n $requirement ]];
do
   pip install -e $requirement  
   #print( 'installed succesful')
done
