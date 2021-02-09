Dynamic PIVOTs in SQL with Snowflake
--

See https://medium.com/@hoffa/dynamic-pivots-in-sql-with-snowflake-c763933987c

Usage:
--- 
```sql
select name, date_trunc(quarter, month) pivot_column, sum(month_views) pivot_value
from hero_views
group by 1,2
;

call pivot_prev_results();

select * from table(result_scan(last_query_id(-2)));
```

Procedure:
---

```sql
create or replace procedure pivot_prev_results()
returns string
language javascript
execute as caller as
$$
  var cols_query = `
      select '\\'' 
        || listagg(distinct pivot_column, '\\',\\'') within group (order by pivot_column)
        || '\\'' 
      from table(result_scan(last_query_id(-1)))`;
  var stmt1 = snowflake.createStatement({sqlText: cols_query});
  var results1 = stmt1.execute();
  results1.next();
  var col_list = results1.getColumnValue(1);
  
  pivot_query = `
         select * 
         from (select * from table(result_scan(last_query_id(-2)))) 
         pivot(max(pivot_value) for pivot_column in (${col_list}))
     `
  var stmt2 = snowflake.createStatement({sqlText: pivot_query});
  stmt2.execute();
  return `select * from table(result_scan('${stmt2.getQueryId()}'));\n  select * from table(result_scan(last_query_id(-2)));`;
$$;
```

Sample data:
---
```sql
create or replace table hero_views as
select $1 name, $2::date month, $3 month_views
from (values('Spider-Man','2020-04-01',210457), ('Spider-Man','2020-08-01',180055), ('Spider-Man','2020-12-01',229166), ('Spider-Man','2020-01-01',150171), ('Spider-Man','2020-07-01',164904), ('Spider-Man','2020-10-01',205147), ('Spider-Man','2020-05-01',191329), ('Spider-Man','2020-06-01',172506), ('Spider-Man','2020-09-01',175904), ('Spider-Man','2020-11-01',236432), ('Spider-Man','2020-03-01',157379), ('Spider-Man','2020-02-01',134859), ('Wonder Woman','2020-10-01',98388), ('Wonder Woman','2020-11-01',113600), ('Wonder Woman','2020-06-01',115926), ('Wonder Woman','2020-02-01',90333), ('Wonder Woman','2020-12-01',406326), ('Wonder Woman','2020-07-01',99840), ('Wonder Woman','2020-08-01',121413), ('Wonder Woman','2020-05-01',125235), ('Wonder Woman','2020-04-01',110816), ('Wonder Woman','2020-03-01',101583), ('Wonder Woman','2020-09-01',101168), ('Wonder Woman','2020-01-01',110806), ('Iron Man','2020-11-01',87757), ('Iron Man','2020-08-01',95862), ('Iron Man','2020-04-01',121403), ('Iron Man','2020-03-01',86143), ('Iron Man','2020-06-01',83922), ('Iron Man','2020-02-01',69272), ('Iron Man','2020-07-01',83316), ('Iron Man','2020-10-01',90943), ('Iron Man','2020-12-01',93141), ('Iron Man','2020-09-01',100696), ('Iron Man','2020-01-01',95296), ('Iron Man','2020-05-01',116757), ('Wolverine','2020-08-01',82151), ('Wolverine','2020-07-01',81343), ('Wolverine','2020-09-01',76360), ('Wolverine','2020-01-01',69570), ('Wolverine','2020-02-01',64213), ('Wolverine','2020-11-01',79048), ('Wolverine','2020-12-01',68448), ('Wolverine','2020-03-01',83920), ('Wolverine','2020-06-01',78275), ('Wolverine','2020-05-01',92548), ('Wolverine','2020-04-01',96679), ('Wolverine','2020-10-01',81325)) 
;
```
