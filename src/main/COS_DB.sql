
-- DROP SCHEMA
-- IF EXISTS COS_DB;
-- 	CREATE SCHEMA COS_DB COLLATE = utf8_general_ci;

-- DROP DATABASE COS_DB;

USE COS_DB;

-- TABLES FOR STORING AND RETREIVING USER CREDENTIALS:

CREATE TABLE IF NOT EXISTS COS_DB.NewUser(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    USERNAME VARCHAR(15),
    EMAIL VARCHAR(40),
    PASS VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS COS_DB.ExistingUser(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    USERNAME VARCHAR(15),
    PASS VARCHAR(6)
);

-- INSERT INTO EXISTINGUSER VALUES(1,"IdrisCOS","aCOS69");
-- INSERT INTO EXISTINGUSER VALUES(2,"AryanCOS","aCOS69");
-- INSERT INTO EXISTINGUSER VALUES(3,"JayCOS","aCOS69");

SELECT * FROM EXISTINGUSER;

-- TABLES FOR STORING THE DATE AND TIME OF USER LOGGING ON AND OFF:

-- DROP TABLE COS_DB.NewUser;
-- DROP TABLE cos_db.existinguser;
SHOW TABLES;
-- DELETE FROM cos_db.NEWUSER;
SELECT * FROM COS_DB.NEWUSER;
SELECT * FROM cos_db.EXISTINGUSER;