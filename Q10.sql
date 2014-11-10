DELETE FROM Query10;

CREATE VIEW country_border_length AS 
SELECT c1.cname AS cname, SUM(n.length) AS borderslength
FROM country c1, neighbour n, country c2
WHERE c1.cid = n.country AND n.neighbor = c2.cid
GROUP BY c1.cid;

INSERT INTO Query10
SELECT * 
FROM country_border_length cbl
WHERE cbl.borderslength IN (
SELECT MAX(borderslength)
FROM country_border_length);

DROP VIEW country_border_length;