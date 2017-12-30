#!/bin/bash

# Create temp_pairs.txt
# Read each line of the slug_mp3_pairs.txt
# For each line, check if there is a file in finished_transcripts
# If not, write the line to temp_pairs.txt
# Rename temp_pairs to slug_mp3_pairs

touch temp_pairs.txt

while IFS=, read -r slug mp3
do
    if [ ! -f ./finished_transcripts/$slug.* ]; then
    echo $slug,$mp3 >> temp_pairs.txt
    fi
done < slug_mp3_pairs.txt

mv temp_pairs.txt slug_mp3_pairs.txt