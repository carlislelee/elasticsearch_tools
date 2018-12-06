select '${date}'as date,vid,
case when search.device_id is not null then 'y' else 'n' end as whether_search
    ,count(distinct dlu.device_id)as user_num
	,sum(session_duration) as session_duration
    ,sum(vv) as vv
    ,sum(hot_vv)as hot_vv
    ,sum(follow_vv)as follow_vv
    ,sum(play_duration) as play_duration
    ,sum(publish_cnt) as publish_cnt
    ,count(distinct if(publish_cnt >0,dlu.device_id, null)) as publish_uv
    ,sum(publish_cnt_db) as publish_cnt_db
    ,count(distinct if(publish_cnt_db >0,dlu.device_id, null)) as publish_uv_db
    ,sum(like_cnt) as like_cnt
    ,count(distinct if(like_cnt >0,dlu.device_id, null)) as like_uv
    ,sum(follow_cnt) as follow_cnt
    ,count(distinct if(follow_cnt >0,dlu.device_id, null)) as follow_uv
    ,sum(comment_cnt) as comment_cnt
    ,count(distinct if(comment_cnt >0,dlu.device_id, null)) as comment_uv
    ,sum(share_cnt) as share_cnt
    ,count(distinct if(share_cnt >0,dlu.device_id, null)) as share_uv
    ,(count(distinct ret.device_id)/count(distinct dlu.device_id))as ret

from
(select device_id,vid
 from musically.stg_server_impression_hour
  a lateral view explode(split(version_id, ',')) b as vid
 where date = '${date}'
 and app_id = '1233'
 and vid in ('616791','616792','616793','616794')
 group by device_id,vid
)user
left join
(select distinct cast(device_id as bigint)as device_id from musically.stg_app_event_log_hour
 where date = '${date}'
 and app_id = '1233'
 and event = 'search')search
 on user.device_id = search.device_id
left join
(
  select device_id
  ,new_flag
  ,session_duration
  ,vv
  ,hot_vv
  ,follow_vv
  ,play_duration
  ,publish_cnt
  ,publish_cnt_db
  ,like_cnt
  ,follow_cnt
  ,comment_cnt
  ,share_cnt
  FROM musically.mds_fact_device_daily
  where date = '${date}'
  and app_id = '1233'
)dlu on user.device_id = dlu.device_id
left join
(select device_id from growth.m_device_distinct
 where p_date = '${DATE+1}'
 and app_id = '1233')ret
 on user.device_id = ret.device_id
group by vid,
case when search.device_id is not null then 'y' else 'n' end
