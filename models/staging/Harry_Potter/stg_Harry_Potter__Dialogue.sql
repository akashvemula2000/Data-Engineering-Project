with 

source as (

    select * from {{ source('Harry_Potter', 'Dialogue') }}

),

renamed as (

    select
        dialogue_id,
        chapter_id,
        place_id,
        character_id,
        dialogue

    from source

)

select * from renamed
