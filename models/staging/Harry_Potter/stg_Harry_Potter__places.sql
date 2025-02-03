with 

source as (

    select * from {{ source('Harry_Potter', 'places') }}

),

renamed as (

    select
        place_id,
        place_name,
        place_category

    from source

)

select * from renamed
