DELETE FROM Query8

CREATE VIEW most_popular_language AS
SELECT l.cid AS cid, l.lid AS lid
FROM language l
WHERE l.lpercentage IN (
SELECT MAX(l2.lpercentage)
FROM language l2
GROUP BY l2.cid);

INSERT INTO Query8
SELECT c1.cname as c1name, c2.cname as c2name, l.lname as lname
FROM country c1, most_popular_language mpl1, 
neighbour n, language l,
country c2, most_popular_language mpl2
WHERE mpl1.cid = n.country AND c1.cid = mpl1.cid 
AND mpl2.cid = n.neighbor AND c2.cid = mpl2.cid
AND mpl1.lid = mpl2.lid and mpl1.lid = l.lid
GROUP BY c1name, c2name, lname
ORDER BY lname ASC, c1name DESC;

DROP VIEW most_popular_language;