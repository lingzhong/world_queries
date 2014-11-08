
BEGIN TRANSACTION;
CREATE TABLE country (
    cid 		INTEGER 	PRIMARY KEY,
    cname 		VARCHAR(20)	NOT NULL,
    height 		INTEGER 	NOT NULL,
    population	INTEGER 	NOT NULL);
INSERT INTO country VALUES(1,'Canada',3,35);
INSERT INTO country VALUES(2,'USA',2,50);
INSERT INTO country VALUES(3,'Mexico',1,20);
CREATE TABLE language (
    cid 		INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT,
    lid 		INTEGER 	NOT NULL,
    lname 		VARCHAR(20) NOT NULL,
    lpercentage	REAL 		NOT NULL,
	PRIMARY KEY(cid, lid));
INSERT INTO language VALUES(1,1,'English',0.8);
INSERT INTO language VALUES(1,2,'French',0.1);
INSERT INTO language VALUES(1,3,'Chinese',0.1);
INSERT INTO language VALUES(2,1,'English',0.9);
INSERT INTO language VALUES(2,3,'Chinese',0.1);
INSERT INTO language VALUES(3,1,'English',1.0);
CREATE TABLE religion (
    cid 		INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT,
    rid 		INTEGER 	NOT NULL,
    rname 		VARCHAR(20) NOT NULL,
    rpercentage	REAL 		NOT NULL,
	PRIMARY KEY(cid, rid));
INSERT INTO religion VALUES(1,1,'Christian',0.6);
INSERT INTO religion VALUES(1,2,'Muslim',0.2);
INSERT INTO religion VALUES(1,3,'Athiest',0.2);
INSERT INTO religion VALUES(2,1,'Christian',0.8);
INSERT INTO religion VALUES(2,3,'Athiest',0.2);
CREATE TABLE hdi (
    cid 		INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT,
    year 		INTEGER 	NOT NULL,
    hdi_score 	REAL 		NOT NULL,
	PRIMARY KEY(cid, year));
INSERT INTO hdi VALUES(1,2009,10.0);
INSERT INTO hdi VALUES(1,2010,11.0);
INSERT INTO hdi VALUES(1,2011,12.0);
INSERT INTO hdi VALUES(1,2012,13.0);
INSERT INTO hdi VALUES(1,2013,14.0);
INSERT INTO hdi VALUES(1,2014,15.0);
CREATE TABLE ocean (
    oid 		INTEGER 	PRIMARY KEY,
    oname 		VARCHAR(20) NOT NULL,
    depth 		INTEGER 	NOT NULL);
INSERT INTO ocean VALUES(1,'Pacific',1000);
INSERT INTO ocean VALUES(2,'Atlantic',800);
INSERT INTO ocean VALUES(3,'Indian',700);
INSERT INTO ocean VALUES(4,'Artic',300);
INSERT INTO ocean VALUES(5,'Antarctic',400);
CREATE TABLE neighbour (
    country 	INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT,
    neighbor 	INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT, 
    length 		INTEGER 	NOT NULL,
	PRIMARY KEY(country, neighbor));
INSERT INTO neighbour VALUES(1,2,1000);
INSERT INTO neighbour VALUES(2,1,1000);
INSERT INTO neighbour VALUES(2,3,100);
INSERT INTO neighbour VALUES(3,2,100);
CREATE TABLE oceanAccess (
    cid 	INTEGER 	REFERENCES country(cid) ON DELETE RESTRICT,
    oid 	INTEGER 	REFERENCES ocean(oid) ON DELETE RESTRICT, 
    PRIMARY KEY(cid, oid));
INSERT INTO oceanAccess VALUES(1,1);
INSERT INTO oceanAccess VALUES(1,2);
CREATE TABLE Query1(
	c1id	INTEGER,
    c1name	VARCHAR(20),
	c2id	INTEGER,
    c2name	VARCHAR(20)
);
CREATE TABLE Query2(
	cid		INTEGER,
    cname	VARCHAR(20)
);
CREATE TABLE Query3(
	c1id	INTEGER,
    c1name	VARCHAR(20),
	c2id	INTEGER,
    c2name	VARCHAR(20)
);
CREATE TABLE Query4(
	cname	VARCHAR(20),
    oname	VARCHAR(20)
);
CREATE TABLE Query5(
	cid		INTEGER,
    cname	VARCHAR(20),
	avghdi	REAL
);
CREATE TABLE Query6(
	cid		INTEGER,
    cname	VARCHAR(20)
);
CREATE TABLE Query7(
	rid			INTEGER,
    rname		VARCHAR(20),
	followers	INTEGER
);
CREATE TABLE Query8(
	c1name	VARCHAR(20),
    c2name	VARCHAR(20),
	lname	VARCHAR(20)
);
CREATE TABLE Query9(
    cname		VARCHAR(20),
	totalspan	INTEGER
);
CREATE TABLE Query10(
    cname			VARCHAR(20),
	borderslength	INTEGER
);
COMMIT;
