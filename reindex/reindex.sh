
curl -XPOST "http://10.115.61.90:9200/_reindex?requests_per_second=7000&timeout=100s" -d '
{
  "conflicts": "proceed",
  "source": {
    "remote":{
        "host":"http://10.110.158.154:9200"
    },
    "index": "ugc_index_aweme_i18n_user_v5",
    "size" : 700,
    "query": {
      "term": {
        "short_id": 30801038217
      }
    }
  },
  "dest": {
    "index": "ugc_index_aweme_i18n_user_v5",
        "op_type": "create"
  }
}
'
