with 

source as (

    select * from {{ source('Harry_Potter', 'Chapters') }}

),

renamed as (

    select
        chapter_id,
        chapter_name,
        movie_id,
        movie_chapter

    from source

)

select * from renamed
