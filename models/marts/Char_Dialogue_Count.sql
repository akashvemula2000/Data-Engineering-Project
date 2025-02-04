with chars as
(
    select
        character_id,
        character_name
    from {{ ref('stg_Harry_Potter__Characters') }}
),
dialouges as
(
    select
        dialogue_id,
        character_id,
        dialogue
    from {{ ref('stg_Harry_Potter__Dialogue') }}
)

select 
    character_name,
    count(distinct dialogue_id) as dialogue_count
from chars c
    inner join dialouges d on c.character_id = d.character_id
group by character_name
order by count(dialogue) desc