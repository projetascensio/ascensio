with 

source as (

    select * from {{ source('projet_ascensio_clean', 'swimming_clean_women') }}

),

renamed as (

    select *

    from source

)

select * from renamed
