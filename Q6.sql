DELETE FROM Query6;

CREATE VIEW thirteen AS
SELECT cid, hdi_score FROM hdi WHERE year = 2013;
CREATE VIEW twelve AS
SELECT cid, hdi_score FROM hdi WHERE year = 2012;
CREATE VIEW eleven AS
SELECT cid, hdi_score FROM hdi WHERE year = 2011;
CREATE VIEW ten AS
SELECT cid, hdi_score FROM hdi WHERE year = 2010;
CREATE VIEW nine AS
SELECT cid, hdi_score FROM hdi WHERE year = 2009;

CREATE VIEW increasing AS
SELECT thirteen.cid FROM thirteen, twelve, eleven, ten, nine 
WHERE thirteen.cid = twelve.cid AND
twelve.cid = eleven.cid AND
eleven.cid = ten.cid AND
ten.cid = nine.cid AND
thirteen.hdi_score > twelve.hdi_score AND
twelve.hdi_score > eleven.hdi_score AND
eleven.hdi_score > ten.hdi_score AND
ten.hdi_score > nine.hdi_score;

INSERT INTO Query6 
SELECT c.cid AS cid, c.cname AS cname
FROM country c, increasing i 
WHERE c.cid = i.cid 
GROUP BY c.cid, c.cname 
ORDER BY c.cname ASC;

DROP VIEW increasing;
DROP VIEW nine;
DROP VIEW ten;
DROP VIEW eleven;
DROP VIEW twelve;
DROP VIEW thirteen;