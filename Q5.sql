DELETE FROM Query5;

INSERT INTO Query5
SELECT h.cid AS cid, c.cname AS cname, AVG(hdi_score) AS avghdi
FROM hdi h, country c
WHERE h.cid = c.cid AND h.year >= 2009 AND h.year <= 2013
GROUP BY h.cid, c.cname
ORDER BY avghdi DESC
LIMIT 10;
