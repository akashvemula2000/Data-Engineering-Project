with movies as
(
    select
        movie_title,
        release_year,
        budget, 
        box_office
    from {{ ref('stg_Harry_Potter__MoviesList') }}
)

select movies.*,round(((box_office-budget)/budget)*100) as ROI_in_percentage
from movies
order by ROI_in_percentage desc