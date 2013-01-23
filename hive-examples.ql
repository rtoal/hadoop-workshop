drop table films;
create external table if not exists films (
  pid string,
  titles string,
  status string,
  type string,
  origins string,
  rating string,
  person_ids string
)
row format delimited
fields terminated by '\t'
location '/user/ray/c';


describe films;

select count(1)
from films;

select *
from films
limit 10;

select *
from films
where rating='R';

select rating, count(1)
from films
group by rating;

