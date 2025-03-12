SELECT name_1, sex_2, height_3, weight_4, year_born_5, age_6, country_7, country_noc_8, year_9, sport_10, event_11
FROM {{ source('projet_ascencio_clean', 'athlete_events_V3') }}
UNION ALL
SELECT name_1, sex_2, height_3, weight_4, year_born_5, age_6, country_7, country_noc_8, year_9, sport_10, event_11
FROM {{ source('projet_ascencio_clean', 'asc_olympics_results_athlete_V3') }}