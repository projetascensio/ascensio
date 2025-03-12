WITH sub_1 AS (

  SELECT 
  discipline,
  COUNT(record) as nb_record_beaten,
  MIN(date) as first_date,
  MAX(date) as last_date,
  FROM `ascencio-453311.projet_ascencio_clean.swimming_clean_women`
  WHERE record = "oui"
  GROUP BY discipline

),
  sub_2 AS(

  SELECT
  discipline,
  nb_record_beaten,
  first_date,
  last_date,
  date_diff(last_date, first_date, YEAR) as time_duration
  FROM sub_1
)
  SELECT
  discipline,
  nb_record_beaten,
  first_date,
  last_date,
  time_duration,
  ROUND(SAFE_DIVIDE(time_duration,nb_record_beaten),2) as time_between_records
  FROM sub_2

