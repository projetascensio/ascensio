with 

source as (

    select * from {{ source('projet_ascencio_clean', 'swimming_clean_women') }}

),

renamed as (

    select
        discipline,
        mark,
        competitor,
        gender,
        team,
        event,
        date as date_date,
        record,
        mark_seconds

    from source

)

select * from renamed
