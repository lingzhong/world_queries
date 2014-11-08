DELETE FROM Query4;

CREATE VIEW direct_access AS
SELECT c.cname, o.oname
FROM country c, ocean o, oceanAccess oa 
WHERE c.cid = oa.cid AND o.oid = oa.oid;

CREATE VIEW indirect_access AS
SELECT c1.cname AS cname, o.oname
FROM country c1, neighbour n, country c2, oceanAccess oa, ocean o
WHERE c1.cid = n.country AND n.neighbor = c2.cid
AND n.neighbor IN (SELECT cid FROM oceanAccess)
AND n.neighbor = oa.cid AND oa.oid = o.oid;

INSERT INTO Query4
(SELECT * FROM direct_access 
UNION 
SELECT * FROM indirect_access)
ORDER BY cname ASC, oname DESC;