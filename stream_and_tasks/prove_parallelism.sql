-- this will create two parallel child queries that take 10 seconds to execute
-- if they are executed in parallel, then they will insert values at the same time
-- event is triggered by inserting a value in a stream that is checked every minute

use role accountadmin;
grant execute task on account to role sysadmin;
use role sysadmin;

-- stream so this task executes every minute, but only if there's new data
create table just_timestamps_stream_table_with_count(value varchar);
create stream just_timestamps_stream_count on table just_timestamps_stream_table_with_count;

-- https://docs.snowflake.com/en/user-guide/tasks-intro.html
create or replace task mytask_minute_parallel
  warehouse = test_small
  schedule = '1 MINUTE'
  when SYSTEM$STREAM_HAS_DATA('just_timestamps_stream_count')
as
-- consume stream so tasks doesn't execute again
delete from just_timestamps_stream_table_with_count;

-- our goal is to insert new timestamps here
create or replace table just_timestamps(ts timestamp, note varchar);
           
create or replace task mytask_minute_child1_parallel
  warehouse = test_small
  after mytask_minute_parallel
as
insert into just_timestamps
select current_timestamp, 'child1 ' || count(seq4()) from table(generator(timelimit => 10)) v;

create or replace task mytask_minute_child2_parallel
  warehouse = test_small
  after mytask_minute_parallel
as
insert into just_timestamps
select current_timestamp, 'child2 ' || count(seq4()) from table(generator(timelimit => 10)) v;

alter task mytask_minute_child2_parallel resume;
alter task mytask_minute_child1_parallel resume;
alter task mytask_minute_parallel resume;

-- trigger a new run with new data in the stream
insert into just_timestamps_stream_table_with_count values('trigger');

-- it works!
select current_timestamp(), state, name, scheduled_time, error_message, *
from table(information_schema.task_history())
limit 5;

-- data has been added here
select * 
from just_timestamps 
order by ts desc;
-- if everything worked in parallel, both child tasks took 10 seconds, executed in parallel, and inserted at the same time


-- clean up?
show tasks;
alter task mytask_minute_parallel suspend;
drop task mytask_minute_parallel;
drop task mytask_minute_child1_parallel;
drop task mytask_minute_child2_parallel;



