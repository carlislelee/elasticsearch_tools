
if [[ $# -lt 2 ]];then
    echo "xxx.sh 1/2 node:task"
    exit 1
fi
if [[ $1 == "va1" ]];then
    host="http://10.110.158.154:9200"
elif [[ $1 == "va2" ]];then
    host="http://10.110.158.200:9200"
elif [[ $1 == "sg1" ]];then
    host="http://10.115.61.90:9200"
elif [[ $1 == "sg2" ]];then
    host="http://10.115.61.120:9200"
else
    echo "va1/va2/sg1/sg2"
    exit 1
fi
curl -X POST "$host/_tasks/$2/_cancel"
