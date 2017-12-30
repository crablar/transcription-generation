#!/bin/bash

NUM_TRANSCRIPTIONS_TO_MAKE=1

sh check_for_finished_transcriptions.sh

for i in `seq 1 $NUM_TRANSCRIPTIONS_TO_MAKE`;
do
    line=$(head -n 1 slug_mp3_pairs.txt)
    IFS=', ' read -r -a vars <<< "$line"
    slug=${vars[0]}
    mp3=${vars[1]}
    python get_mp3.py $mp3 $slug
    
    #convert mp3 to flac
    ffmpeg -i $slug.mp3 ${slug}stereo.flac
    ffmpeg -i ${slug}stereo.flac -ac 1 $slug.flac
    rm $slug.mp3
    rm ${slug}stereo.flac
done