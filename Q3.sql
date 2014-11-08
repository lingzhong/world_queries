DELETE FROM Query3;

CREATE VIEW landlocked_countries AS
SELECT *
FROM country
WHERE cid NOT IN(
SELECT cid
FROM oceanAccess);

CREATE VIEW single_landlocked_cid AS
SELECT llc.cid 
FROM neighbour n, landlocked_countries llc
WHERE n.country = llc.cid
GROUP BY llc.cid
HAVING COUNT(n.neighbor) = 1;

INSERT INTO Query3
SELECT c1.cid AS c1id, c1.cname AS c1name, c2.cid AS c2id, c2.cname AS c2name
FROM single_landlocked_cid sllc, country c1, neighbour n, country c2
WHERE sllc.cid = c1.cid AND sllc.cid = n.country AND n.neighbor = c2.cid
ORDER BY c1name ASC;

DROP VIEW single_landlocked_cid;
DROP VIEW landlocked_countries;