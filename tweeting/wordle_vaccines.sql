with timeseries as (
    select month, iso3166_1
        , coalesce(pfv
                   , -- average prev and next when missing 
                   (lag(pfv) over(partition by iso3166_1 order by month)
                   + lead(pfv) over(partition by iso3166_1 order by month)/2) 
                  ) percent_full
    from (
        select date_trunc(month, date) month, iso3166_1, country_region
            , max(people_fully_vaccinated_per_hundred) pfv
            , max(total_vaccinations) tv
        from starschema_covid19.public.owid_vaccinations
        where iso3166_1 in ('JP', 'VN', 'US', 'BR', 'GB')
        and date > '2021-06-01'
        group by 1, 2, 3
    )
), emoji as (
    select $1 iso, $2 emoji
    from values('JP', '🇯🇵'), ('GB', '🇬🇧'), ('BR', '🇧🇷'), ('VN', '🇻🇳'), ('US', '🇺🇸'), ('IN', '🇮🇳') 
), timeseries_emoji as (
    select month, emoji
        , case 
            when percent_full < 50 then '⬜'
            when percent_full < 68 then '🟨'
            else '🟩'
        end percent_full
    from timeseries
    join emoji 
    on iso3166_1=iso
)

select listagg($2, '\n')
from (
    select null::date, listagg(distinct emoji) within group (order by emoji)
    from timeseries_emoji
    union all (
        select month, listagg(percent_full) within group (order by emoji)
        from timeseries_emoji
        group by 1
        order by month
    )
)
