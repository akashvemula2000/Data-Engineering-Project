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
        budget,
        box_office

    from source

)

select * from renamed
