
select
    i
from (
    select
        *
    from
        generate_series(1, 13195/2)
) s(i)


with recursive solve(prime_num, num) as (
    values(13195, 2)
    union all
    select
        prime_num / num
        , num + 1
    from
        solve
    where
        prime_num % num = 0
        and num <= 13195 / 2
        and prime_num <> 1
)

select
    prime_num
from
    solve
;
