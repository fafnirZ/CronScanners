#!/bin/bash

#outbound tcp
pid=$(netstat -anv -p tcp | awk '{print $6,"",$9;}'| grep -i established| awk '{print $2}'| sort| uniq)

printf "Time running script: $(date)\nESTABLISHED TCP CONNECTIONS\n" >> logs/$(date +"%d%m%y")
#HEADING
ps u | head -n 1 | awk '{print $1,"",$2,"",$10,"",$11}' >> logs/$(date +"%d%m%y")


for p in $pid
do
	ps u -p $p | tail -n 1 | awk '{print $1,"",$2,"",$10,"",$11}' >> logs/$(date +"%d%m%y")
done
printf "\n\n"  >> logs/$(date +"%d%m%y")


