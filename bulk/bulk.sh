input_file=$1
curl -XPOST "http://10.110.158.200:9200/_bulk?pretty" --data-binary @$input_file
