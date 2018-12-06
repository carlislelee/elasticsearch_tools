
if [[ $# -lt 2 ]];then
    echo "xxx.sh 1/2 node:task"
    exit 1
fi
if [[ $1 -eq 1 ]];then
    host="http://10.110.158.154:9200"
else
    host="http://10.110.158.200:9200"
fi
#curl -X POST "http://10.110.158.154:9200/_tasks/Wl1QD6QXSz2dab5mTPn0uw:87810069/_cancel"
curl -X POST "$host/_tasks/$2/_cancel"
