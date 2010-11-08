select y.bto_code, min(y.first_date) as fd, min(user_id)
from observations y,
(select x.bto_code, min(x.first_date) as first_date
  from observations x
  where user_id <> 'BG'
  group by bto_code) a
where y.bto_code = a.bto_code
  and y.first_date = a.first_date
group by y.bto_code

union all
select bto_code, first_date, user_id
from observations
where bto_code not in (
select distinct bto_code from observations where user_id <> 'BG');
order by fd desc;
