SHOW DATABASES;

DROP DATABASE IF EXISTS jzhao567_streamingdb;

CREATE DATABASE jzhao567_streamingdb;

USE jzhao567_streamingdb;

DROP USER IF EXISTS 'ta'@'localhost';
CREATE USER 'ta'@'localhost' IDENTIFIED BY 'cs3319';

GRANT USAGE ON *.* TO 'ta'@'localhost';
GRANT ALL PRIVILEGES ON jzhao567_streamingdb.* TO 'ta'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'ta'@'localhost'; 

SHOW TABLES;

CREATE TABLE subscriptionplan (
    planid CHAR(4) NOT NULL,
    name VARCHAR(100),
    monthlyprice DECIMAL(10,2),
    maxvideoquality VARCHAR(50),
    maxconcurrentstreams INT,
    PRIMARY KEY (planid)
);

CREATE TABLE user (
    userid CHAR(4) NOT NULL,
    name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(100),
    regdate DATE,
    planid CHAR(4) NOT NULL,
    FOREIGN KEY (planid) REFERENCES subscriptionplan(planid),
    PRIMARY KEY (userid)
);

CREATE TABLE content (
    contentid CHAR(4) NOT NULL,
    title VARCHAR(255),
    releaseyear INT,
    agerating VARCHAR(50),
    language VARCHAR(50),
    contenttype VARCHAR(50),
    duration TIME DEFAULT '00:00:00',
    PRIMARY KEY (contentid)
);

CREATE TABLE episode (
    contentid CHAR(4) NOT NULL,
    episodenumber INT NOT NULL,
    title VARCHAR(255),
    duration TIME DEFAULT '00:00:00',
    releasedate DATE,
    FOREIGN KEY (contentid) REFERENCES content(contentid),
    PRIMARY KEY (contentid, episodenumber)
);

CREATE TABLE profile (
    userid CHAR(4) NOT NULL,
    profilename VARCHAR(100) NOT NULL,
    agerestriction VARCHAR(50),
    FOREIGN KEY (userid) REFERENCES user(userid),
    PRIMARY KEY (userid, profilename)
);

CREATE TABLE watches (
    userid CHAR(4) NOT NULL,
    contentid CHAR(4) NOT NULL,
    date DATE NOT NULL,
    duration TIME DEFAULT '00:00:00',
    completed INT DEFAULT 0,
    FOREIGN KEY (userid) REFERENCES user(userid),
    FOREIGN KEY (contentid) REFERENCES content(contentid),
    PRIMARY KEY (userid, contentid, date)
);

CREATE TABLE rates (
    userid CHAR(4) NOT NULL,
    contentid CHAR(4) NOT NULL,
    score INT,
    date DATE,
    FOREIGN KEY (userid) REFERENCES user(userid),
    FOREIGN KEY (contentid) REFERENCES content(contentid),
    PRIMARY KEY (userid, contentid)
);

SHOW TABLES;