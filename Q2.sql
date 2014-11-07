DELETE FROM Query2;

INSERT INTO Query2
SELECT cid, cname 
FROM country
WHERE cid NOT IN(
SELECT cid
FROM oceanAccess)
ORDER BY cname ASC;