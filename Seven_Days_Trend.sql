SELECT
  CASE
    WHEN "public"."jobs"."date_created" >= (NOW() - INTERVAL '7 days') THEN DATE_TRUNC('day', NOW())
    ELSE DATE_TRUNC('day', NOW() - INTERVAL '7 days')
  END AS "date",
  SUM("public"."jobs"."score") AS "sum"
FROM
  "public"."jobs"
WHERE
  "public"."jobs"."date_created" >= (NOW() - INTERVAL '14 days')
GROUP BY
  "date"
ORDER BY
  "date" ASC
