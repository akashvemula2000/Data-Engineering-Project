with 

source as (

    select * from {{ source('Harry_Potter', 'Characters') }}

),

renamed as (

    select
        character_id,
        character_name,
        species,
        gender,
        house,
        patronus,
        wand_wood,
        wand_core

    from source

)

select * from renamed
