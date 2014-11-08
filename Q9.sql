DELETE FROM Query9;

CREATE VIEW all_countries AS
SELECT c.cname AS cname, c.height AS height, 
CASE WHEN o.depth IS NULL THEN 0 ELSE o.depth END AS depth 
FROM country c LEFT JOIN oceanAccess oa ON c.cid = oa.cid
LEFT JOIN ocean o ON oa.oid = o.oid;

INSERT INTO Query9
SELECT ac.cname AS cname, ac.height+ac.depth AS span
FROM all_countries ac
WHERE ac.height+ac.depth IN (
SELECT MAX(ac2.height+ac2.depth) 
FROM all_countries ac2
);

DROP VIEW all_countries;