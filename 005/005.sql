with recursive minimum_product(num1, num2) as (
    values(1::bigint, 2::bigint)
    union all
    select
        num1 * num2
        , num2 + 1
    from
        minimum_product
    where
        num2 <= 20
)
select
    *
from
    minimum_product
;
