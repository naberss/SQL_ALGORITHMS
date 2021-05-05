SELECT DISTINCT F1.X,
                F1.Y
           FROM FUNCTIONS F1 INNER JOIN FUNCTIONS F2 ON (    F1.X = F2.Y
                                                         AND F1.Y = F2.X
                                                         AND F1.ROWID != F2.ROWID
                                                         AND F1.X <= F1.Y
                                                        )
       ORDER BY F1.X;