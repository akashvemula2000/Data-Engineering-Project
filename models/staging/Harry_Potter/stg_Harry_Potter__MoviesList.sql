with 

source as (

    select * from {{ source('Harry_Potter', 'MoviesList') }}

),

renamed as (

    select
        movie_id,
        movie_title,
        release_year,
        runtime,
        replace(replace(budget,'$',''), ',','')::INTEGER as budget,
        replace(replace(box_office,'$',''), ',','')::INTEGER as box_office,

    from source

)

select * from renamed
