WITH XTAB AS
     (SELECT   HACKERS.HACKER_ID,
               COUNT (CHALLENGE_ID) AS TOTAL_CHALLENGES
          FROM HACKERS,
               CHALLENGES
         WHERE HACKERS.HACKER_ID = CHALLENGES.HACKER_ID
      GROUP BY HACKERS.HACKER_ID
      ORDER BY 2 DESC,
               HACKER_ID)
SELECT XTAB.HACKER_ID,
       HACKERS.NAME,
       TOTAL_CHALLENGES
  FROM XTAB,
       HACKERS
 WHERE NOT (    (SELECT COUNT (A.TOTAL_CHALLENGES)
                   FROM XTAB A
                  WHERE A.TOTAL_CHALLENGES = XTAB.TOTAL_CHALLENGES) > 1
            AND XTAB.TOTAL_CHALLENGES < (SELECT MAX (A.TOTAL_CHALLENGES)
                                           FROM XTAB A)
           )
   AND HACKERS.HACKER_ID = XTAB.HACKER_ID;