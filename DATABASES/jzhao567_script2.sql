USE jzhao567_streamingdb;

/* ========================= */
/* subscription plan         */
/* ========================= */

SELECT * FROM subscriptionplan;

INSERT INTO subscriptionplan VALUES
('P001','Basic',9.99,'720p',1),
('P002','Standard',14.99,'1080p',2),
('P003','Premium',19.99,'4K',4);

SELECT * FROM subscriptionplan;


/* ========================= */
/* user                      */
/* ========================= */

SELECT * FROM user;

INSERT INTO user VALUES
('U001','SpongeBob SquarePants','spongebob@gmail.com','USA','2024-01-10','P001'),
('U002','Bugs Bunny','bugs@gmail.com','USA','2024-02-15','P002'),
('U003','Jane Doe','jane@gmail.com','USA','2024-03-01','P003'),
('U004','John Cena','john@gmail.com','Canada','2024-03-20','P002'),
('U005','Raven','raven@gmail.com','UK','2024-04-05','P001'),
('U006','Wednesday Addams','wednesday@gmail.com','USA','2024-04-18','P003'),
('U007','Coraline Jones','coraline@gmail.com','USA','2024-05-01','P003');

SELECT * FROM user;


/* ========================= */
/* content                   */
/* ========================= */

SELECT * FROM content;

INSERT INTO content VALUES
('C001','Miss Peregrine''s Home for Peculiar Children',2016,'PG-13','English','Movie','02:07:00'),
('C002','IT',2017,'R','English','Movie','02:15:00'),
('C003','Pan''s Labyris',2016,'PG-13','English','Serinth',2006,'R','Spanish','Movie','01:58:00'),
('C004','Parasite',2019,'R','Korean','Movie','02:12:00'),
('C005','Stranger Thinges','00:00:00'),
('C006','The Haunting of Hill House',2018,'R','English','Series','00:00:00'),
('C007','Wednesday',2022,'PG-13','English','Series','00:00:00');

SELECT * FROM content;


/* ========================= */
/* episode                   */
/* ========================= */

SELECT * FROM episode;

INSERT INTO episode VALUES
('C005',1,'The Vanishing of Will Byers','00:48:00','2016-07-15'),
('C005',2,'The Weirdo on Maple Street','00:50:00','2016-07-15'),
('C005',3,'Holly, Jolly','00:49:00','2016-07-22'),
('C006',1,'Steven Sees the Truth','00:55:00','2018-10-12'),
('C006',2,'Open Casket','00:57:00','2018-10-19'),
('C007',1,'Wednesday’s First Day','00:52:00','2022-11-23'),
('C007',2,'The Sleepover','00:54:00','2022-11-30');

SELECT * FROM episode;


/* ========================= */
/* profile                   */
/* ========================= */

SELECT * FROM profile;

INSERT INTO profile VALUES
('U001','SpongeBobMain','All'),        
('U001','SpongeBobKids','PG'),         
('U002','BugsMain','All'),             
('U003','JaneMain','18+'),             
('U004','JohnMain','18+'),             
('U005','RavenMain','PG-13'),          
('U006','WednesdayMain','PG-13'),      
('U007','CoralineMain','PG-13');

SELECT * FROM profile;


/* ========================= */
/* wathces                   */
/* ========================= */

SELECT * FROM watches;

INSERT INTO watches VALUES
('U001','C001','2025-01-01','02:28:00',1),
('U002','C002','2025-01-02','02:16:00',1),
('U003','C003','2025-01-03','02:12:00',1),
('U004','C004','2025-01-04','00:50:00',0),
('U005','C005','2025-01-05','00:58:00',0),
('U006','C006','2025-01-06','00:57:00',2),
('U001','C007','2025-01-07','01:00:00',0),
('U002','C003','2025-01-08','02:12:00',1),
('U003','C004','2025-01-09','00:48:00',0),
('U004','C005','2025-01-10','02:28:00',1);

SELECT * FROM watches;


/* ========================= */
/* rates                     */
/* ========================= */

SELECT * FROM rates;

INSERT INTO rates VALUES
('U001','C001',5,'2025-01-02'),
('U002','C002',4,'2025-01-03'),
('U003','C003',5,'2025-01-04'),
('U004','C001',4,'2025-01-11'),
('U005','C005',5,'2025-01-12');

SELECT * FROM rates;

/* ========================= */
/* update price of plan      */
/* ========================= */

SELECT * FROM subscriptionplan;

UPDATE subscriptionplan
SET monthlyprice = 15.99
WHERE planid = 'P002';

SELECT * FROM subscriptionplan;

/* ============================= */
/* update agerating for content  */
/* ============================= */

SELECT * FROM content;

UPDATE content
SET agerating = 'PG-13'
WHERE releaseyear < 2017;

SELECT * FROM content;