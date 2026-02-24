USE jzhao567_streamingdb;

CREATE VIEW content_summary AS
SELECT 
    c.title,
    c.contenttype,
    AVG(r.score) AS ave_rating,
    COUNT(r.score) AS num_ratings
FROM content c
LEFT JOIN rates r ON c.contentid = r.contentid
GROUP BY c.contentid, c.title, c.contenttype;

SELECT * FROM content_summary;

SELECT *
FROM content_summary
WHERE ave_rating > 4.0
AND num_ratings >= 2
ORDER BY ave_rating DESC;


SELECT * FROM watches;

DELETE FROM watches
WHERE userid = 'U001';

SELECT * FROM watches;

-- attempted deletion from subscriptionplan with dependencies
DELETE FROM subscriptionplan
WHERE planid = 'P003';

-- this fails because another table is referencing that planid, MySQL will
-- prevent the deletion to maintain referential integrity so we need to 
-- delete the dependent records in the user table first