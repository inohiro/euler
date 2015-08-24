select
    i
from (
    select
        2 as i
        , 1 as num
    union all
    select
        i
        , row_number() over (order by i) + 1 as num
    from (
        select
            i
            , j
        from ( select * from generate_series(2, 100000) ) a(j)
        cross join ( select * from generate_series(1, 100000, 2) ) b(i)
        where
            i % j = 0
    ) hoge
    group by
        i
    having
        count(j) = 1
    order by
        1
) hoge
where
    num = 10001
;
