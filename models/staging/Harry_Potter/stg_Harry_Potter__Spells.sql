with 

source as (

    select * from {{ source('Harry_Potter', 'Spells') }}

),

renamed as (

    select
        spell_id,
        incantation,
        spell_name,
        effect,
        light

    from source

)

select * from renamed
