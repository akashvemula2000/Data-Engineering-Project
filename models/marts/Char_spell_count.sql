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
),
spell as
(
    select
        spell_id,
        incantation,
        spell_name,
        effect
    from {{ ref('stg_Harry_Potter__Spells') }}
)

select character_name,
    count(distinct dialogue_id) as spell_count_per_charecter
from spell s
inner join dialouges d
on upper(d.Dialogue) like concat('%',upper(s.incantation),'%')
inner join chars c
on c.character_id = d.character_id
group by character_name
order by count(dialogue) desc;