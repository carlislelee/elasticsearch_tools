
if [[ $# -lt 1 ]];then
    echo "xxx.sh 1/2"
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
fi

cmd="curl -X -GET $host/_tasks?detailed=true&actions=*/delete/byquery&pretty"
echo $cmd
$cmd
