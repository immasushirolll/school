USE jzhao567_streamingdb;

-- Query 1
SELECT title, releaseyear
FROM content
ORDER BY title DESC;

-- Query 2
SELECT title, TIME_TO_SEC(duration)/60 AS duration
FROM content
WHERE contenttype = 'Movie'
ORDER BY duration DESC;

-- Query 3
SELECT c.title AS series_title, COUNT(e.episodenumber) AS total_episodes
FROM content c
JOIN episode e ON c.contentid = e.contentid
WHERE c.contenttype = 'Series'
GROUP BY c.contentid, c.title;

-- Query 4
SELECT name, email
FROM user
ORDER BY name ASC;

-- Query 5
SELECT c.title, w.date AS watch_date, w.duration, w.completed
FROM watches w
JOIN content c ON w.contentid = c.contentid
WHERE w.userid = (SELECT userid FROM user WHERE email = 'john@gmail.com')
ORDER BY w.date;

-- Query 6
SELECT title
FROM content
WHERE contentid NOT IN (SELECT DISTINCT contentid FROM watches);

-- Query 7
SELECT c.title, AVG(r.score) AS average_rating
FROM content c
JOIN rates r ON c.contentid = r.contentid
GROUP BY c.contentid, c.title
HAVING COUNT(r.score) >= 1;

-- Query 8
SELECT c.title
FROM content c
JOIN rates r ON c.contentid = r.contentid
GROUP BY c.contentid, c.title
HAVING AVG(r.score) > 4.0 AND COUNT(r.score) >= 2;

-- Query 9
SELECT u.name, c.title, w.completed AS times_watched
FROM watches w
JOIN user u ON w.userid = u.userid
JOIN content c ON w.contentid = c.contentid
WHERE w.completed > 1;

-- Query 10
SELECT s.name AS plan_name, COUNT(u.userid) AS user_count
FROM subscriptionplan s
LEFT JOIN user u ON s.planid = u.planid
GROUP BY s.planid, s.name
ORDER BY user_count DESC;

-- Query 11
SELECT e.episodenumber, e.title, e.duration, e.releasedate
FROM episode e
JOIN content c ON e.contentid = c.contentid
WHERE c.title = 'The Haunting of Hill House'
ORDER BY e.episodenumber ASC;

-- Query 12
SELECT c.title
FROM content c
JOIN rates r ON c.contentid = r.contentid
GROUP BY c.contentid, c.title
HAVING AVG(r.score) > (SELECT AVG(score) FROM rates);

-- Query 13
SELECT c.title, u.name, r.date
FROM rates r
JOIN content c ON r.contentid = c.contentid
JOIN user u ON r.userid = u.userid
WHERE r.date < DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- Query 14
SELECT u.name
FROM user u
JOIN watches w ON u.userid = w.userid
JOIN content c ON w.contentid = c.contentid
WHERE c.title = 'The Haunting of Hill House' AND w.completed >= 1;

-- Query 15
SELECT title
FROM content
WHERE contenttype = 'Movie' AND TIME_TO_SEC(duration)/60 > 150
UNION
SELECT c.title
FROM content c
JOIN episode e ON c.contentid = e.contentid
WHERE c.contenttype = 'Series'
GROUP BY c.contentid, c.title
HAVING COUNT(e.episodenumber) >= 10;