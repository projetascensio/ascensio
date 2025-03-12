WITH sub1 as(
SELECT 
name_1 as name,
sex_2 as sex,
height_3 as height,
weight_4 as weight,
year_born_5 as year_born,
age_6 as age,
country_7 as country,
country_noc_8 as country_noc,
year_9 as year_compet,
sport_10 as sport,
event_11 as event
FROM {{ ref('union_results') }}
)
SELECT 
DISTINCT name,
sex,
height,
weight,
year_born,
age,
country,
country_noc,
year_compet,
sport,
event,
REPLACE(
  REPLACE(
    REPLACE(
      REPLACE(
REGEXP_REPLACE(NORMALIZE(lower(name), NFD), r'\p{M}', ''),'"',''),"(",""), ")", ""), "ß","ss"
)AS name,
FROM sub1