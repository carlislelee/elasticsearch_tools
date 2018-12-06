select sq,content,sum(c) from(
  select sq,reqid,ss,
)




select sq,r
from
    dm_search.tiktok_search_data_click_through_daily lateral view explode(rs) rstb as r
where
    date = '20181015'
    and ss = 'discover'
limit 1000
