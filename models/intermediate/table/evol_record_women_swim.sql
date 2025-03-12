WITH ranked_data AS (
    SELECT 
        discipline,  -- Or another time-based column
        competitor,
        team,
        mark_seconds,
        date,
        RANK() OVER (PARTITION BY discipline ORDER BY mark_seconds DESC) AS record_rank,
        LAG(mark_seconds) OVER (PARTITION BY discipline ORDER BY discipline) AS previous_mark  -- Get previous row value
    FROM `ascencio-453311.projet_ascencio_clean.swimming_clean_women`
    WHERE record = "oui"
    ORDER BY discipline, record_rank
)
SELECT 
    discipline,
    competitor,
    team,
    date,
    record_rank,
    mark_seconds,
    previous_mark,
    SAFE_DIVIDE(mark_seconds - previous_mark, previous_mark) * 100 AS percentage_diff
FROM ranked_data