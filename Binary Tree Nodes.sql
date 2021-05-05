SELECT   N,
         CASE
           WHEN P IS NULL THEN 'Root'
           WHEN  (SELECT COUNT(*)
                        FROM BST B
                     WHERE B.P = BST.N) > 0 THEN 'Inner'
           ELSE 'Leaf'
         END AS NODE
    FROM BST
ORDER BY N;