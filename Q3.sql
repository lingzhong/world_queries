DELETE FROM Query3;

CREATE VIEW landlocked_countries AS
SELECT *
FROM country
WHERE cid NOT IN(
SELECT cid
FROM oceanAccess);

INSERT INTO Query3
SELECT llc.cid AS c1id, llc.cname AS c1name, c.cid AS c2ID, c.cname AS c2name
FROM neighbour n, landlocked_countries llc, country c
WHERE n.country = llc.cid AND n.neighbor = c.cid
GROUP BY n.country
HAVING COUNT(n.neighbor) = 1
ORDER BY c1name ASC;

DROP VIEW landlocked_countries;