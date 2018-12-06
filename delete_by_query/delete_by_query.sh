
if [[ $# -lt 1 ]];then
    echo "xxx.sh va1/va2/sg1/sg2"
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
echo $host
curl -X POST "$host/ugc_index_aweme_i18n_music_v6/_delete_by_query?requests_per_second=40000&scroll_size=10000&conflicts=proceed" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool":{
        "must_not":{
          "exists": {
              "field":"title"
          }
        }
    }
  }
}
'

