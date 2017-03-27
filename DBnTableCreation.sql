
CREATE DATABASE sans;

USE sans;

DROP TABLE MOVIE;

CREATE TABLE MOVIE
(
ID INT PRIMARY KEY AUTO_INCREMENT,
TITLE VARCHAR(50),
FEATURE_FORMAT VARCHAR(10),
FEATURE_LENGTH TIME,
RELEASE_YEAR INT(2),
RATING INT(2) DEFAULT NULL
 );

USE sans;

INSERT INTO MOVIE VALUES (1, 'Star Wars',  'VHS', '03:20:00', 1977, 5);

INSERT INTO MOVIE VALUES (2, 'Game of Thrones',  'DVD', '01:20:00' , 2010, 5);

INSERT INTO MOVIE VALUES (3, 'House of Cards',  'Streaming', '01:10:00', 2008, 5);

INSERT INTO MOVIE VALUES (4, 'Moonlight', 'DVD', '02:05:00', 2016, 5);

INSERT INTO MOVIE VALUES (5, 'Hidden Figures',  'DVD', '02:00:00' , 2017, 5);

INSERT INTO MOVIE VALUES (6, 'La La Land',  'DVD', '02:00:00' , 2017, 5);

INSERT INTO MOVIE VALUES (7, 'The Lion King',  'DVD', '01:28:00' , 1994, 5);

USE sans;

SELECT * FROM movie 
/*where id = 6;  */ 
WHERE 1 = 1;

GRANT ALL PRIVILEGES ON  sans.* TO student@localhost;

