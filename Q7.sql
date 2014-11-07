DELETE FROM Query7;

INSERT INTO Query7
SELECT r.rid AS rid, r.rname AS rname, SUM(r.rpercentage*c.population) AS followers
FROM religion r, country c
WHERE r.cid = c.cid 
GROUP BY r.rid, r.rname
ORDER BY followers DESC;