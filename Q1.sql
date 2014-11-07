DELETE FROM Query1;

CREATE VIEW neighbour_elev AS
SELECT n.country, c.cid, c.height
FROM neighbour n, country c
WHERE n.neighbor=c.cid;

CREATE VIEW neighbour_max_elev AS
SELECT n.country AS country, n.cid AS neighbour
FROM neighbour_elev n
WHERE height = (
SELECT MAX(height)
FROM neighbour_elev n2
WHERE n2.country=n.country
GROUP BY n2.country
);

INSERT INTO Query1
SELECT c1.cid AS c1id, c1.cname AS c1name, c2.cid AS c2id, c2.cname AS c2name
FROM country c1, country c2, neighbour_max_elev n
WHERE c1.cid=n.country AND c2.cid=n.neighbour
ORDER BY c1name ASC;








