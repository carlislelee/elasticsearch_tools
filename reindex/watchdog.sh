

del_task_num=$(ps -ef|grep lizhaoxi|grep -v grep|grep _reindex|grep curl|grep "10.115.61.120"|wc -l)

echo `date +"%F %T"`" task num : $del_task_num"
if [[ $del_task_num -lt 1 ]];then
    echo -e "\treindex task is not running, restart."
    bash reindex.sh  1>>log.sg2 2>&1 &
else
    echo -e "\treindex task is running, do nothing."
fi
