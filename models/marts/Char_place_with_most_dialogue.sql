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
        place_id,
        dialogue
    from {{ ref('stg_Harry_Potter__Dialogue') }}
),
place as 
(
    select
        place_id,
        place_name
    from {{ ref('stg_Harry_Potter__places') }}
),
final as 
(
    select character_name, place_name, count(*) as dialogue_count
    from chars c
    inner join dialouges d
    on c.character_id = d.character_id
    inner join place p
    on p.place_id = d.place_id
    group by 1,2
)

select character_name,place_name, dialogue_count
from final
qualify row_number() over (partition by character_name order by dialogue_count desc) = 1
order by dialogue_count desc