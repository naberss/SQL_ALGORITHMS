SELECT *
  FROM (SELECT   NAME || '(' || SUBSTR (OCCUPATION, 1, 1) || ')'
            FROM OCCUPATIONS
        ORDER BY NAME ASC)
UNION ALL
SELECT DESCRIPTION
  FROM (SELECT   'There are a total of ' || (SELECT COUNT (*)
                                               FROM OCCUPATIONS OCPS
                                              WHERE OCCUPATIONS.OCCUPATION = OCPS.OCCUPATION) || ' ' || LOWER(OCCUPATION)
                 || 's.' AS DESCRIPTION,
                 (SELECT COUNT (*)
                    FROM OCCUPATIONS OCPS
                   WHERE OCCUPATIONS.OCCUPATION = OCPS.OCCUPATION) AS COUNTS
            FROM OCCUPATIONS
        GROUP BY OCCUPATION
        ORDER BY 2,1);