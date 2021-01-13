-- TODO: better permissions
-- https://docs.snowflake.com/en/user-guide/tasks-intro.html#creating-a-task-administrator-role
use role accountadmin;
grant execute task on account to role sysadmin;
use role sysadmin;

-- stream so this task executes every minute, but only if there's new data
create table just_timestamps_stream_table(value varchar);
create stream just_timestamps_stream on table just_timestamps_stream_table;

-- our goal is to insert new timestamps here
create or replace table just_timestamps(ts timestamp, note varchar);

-- https://docs.snowflake.com/en/user-guide/tasks-intro.html
create or replace task mytask_minute
  warehouse = test_small
  schedule = '1 MINUTE'
  when SYSTEM$STREAM_HAS_DATA('just_timestamps_stream')
as
-- consume stream so tasks doesn't execute again
delete from just_timestamps_stream_table;

alter task mytask_minute resume;

insert into just_timestamps_stream_table values('trigger');

-- proving that it works
select state, error_message, *
from table(information_schema.task_history())
limit 5;

-- now let's add dependent tasks
alter task mytask_minute suspend;

create or replace task mytask_minute_child1
  warehouse = test_small
  after mytask_minute
as
insert into just_timestamps values(current_timestamp, 'child1');

create or replace task mytask_minute_child2
  warehouse = test_small
  after mytask_minute
as
insert into just_timestamps values(current_timestamp, 'child2');

alter task mytask_minute_child2 resume;
alter task mytask_minute_child1 resume;
alter task mytask_minute resume;

-- trigger a new run with new data in the stream
insert into just_timestamps_stream_table values('trigger');

-- it works!
select state, name, scheduled_time, error_message, *
from table(information_schema.task_history())
limit 5;

-- data has been added here
select * 
from just_timestamps 
order by ts desc;

-- clean up?
show tasks;
