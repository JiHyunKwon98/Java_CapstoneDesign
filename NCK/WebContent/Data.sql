CREATE DATABASE IF NOT EXISTS NCK
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE NCK;

CREATE TABLE user (
	userName VARCHAR (32),
	userAddress VARCHAR (128),
	userEmail  VARCHAR (64),
	userMbank  VARCHAR (16),
	userAccount  VARCHAR (64),
	userID  VARCHAR (32),
	userPw  VARCHAR (32),
	userPwc  VARCHAR (32),
	userAvailable int,
	PRIMARY KEY (userid)
);

CREATE TABLE NCK(
   nckID INT,
   userID VARCHAR(32),
   userEmail VARCHAR(64),
   nckPdName VARCHAR(64),
   nckcTg VARCHAR(32),
   nckEx VARCHAR(2048),
   nckImg VARCHAR(200),
   nckReImg VARCHAR(200),
   nckStart VARCHAR(32),
   nckUnit VARCHAR(32),
   nckTerm1 VARCHAR(16),
   nckTerm2 VARCHAR(16),
   nckShip VARCHAR(16),
   nckAvailable  INT,
   nckCurrent VARCHAR(32),
   nckHit INT,
   PRIMARY KEY(nckID)
);
