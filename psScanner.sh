#get all unique pid processes running
#not system
#not google
#not an application
pid=$(ps aux | sed '/System/d' | sed '/Google/d' | sed '/gpu-preferences/d' | sed '/.*\.app/d' | awk '{print $2,"",$11}' | sort -u -k2 | sed '/PID/d' | cut -d' ' -f1)

echo "Starting scan at $(date)" >> pslogs/$(date +"%d%m%y")

ps u | head -n 1| awk '{print $1,"",$9,"",$10,"",$11}' >> pslogs/$(date +"%d%m%y")

for p in $pid
do
	ps u -p $p | tail -n 1 | awk '{print $1,"",$9,"",$10,"",$11}'| sed '/STARTED/d' >> pslogs/$(date +"%d%m%y")
done

printf "\n\n" >>  pslogs/$(date +"%d%m%y")

