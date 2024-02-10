-- Comments in SQL Start with dash-dash --

-- 1. id of 1880
SELECT * FROM analytics
WHERE id = 1880;

-- 2. id and name updated after 8/1/2018
SELECT id, app_name FROM analytics
WHERE last_updated = '2018-08-01';

-- 3. num apps in each category
SELECT category, COUNT(category) FROM analytics
GROUP BY category;

-- 4. top 5 reviewed apps
SELECT app_name, reviews FROM analytics
ORDER BY reviews DESC LIMIT 5;

-- 5. most reviews with a rating >= 4.8
SELECT app_name from analytics
WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

-- 6. avg rating of category highest to lowest
SELECT category, AVG(rating) FROM analytics
GROUP BY category ORDER BY AVG(rating) DESC;

-- 7. most expensive app with rating less than 3
SELECT app_name, price, rating from analytics
WHERE rating < 3
ORDER BY price DESC
LIMIT 1;

-- 8. all apps with min install of > 50 and rating > 0. order by rating
SELECT * FROM analytics
WHERE min_installs <= 50
AND rating IS NOT NULL
ORDER BY rating DESC;

-- 9. all apps rated less than 3 and reviews > 10000
SELECT * FROM analytics
WHERE rating > 3 AND reviews >= 10000;

-- 10. 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT * FROM analytics
WHERE price BETWEEN 0.10 AND 1.00
ORDER BY reviews DESC
LIMIT 10;

-- 11. most out of date app
SELECT * FROM analytics
ORDER BY last_updated LIMIT 1;

-- 12. most expensive app
SELECT * FROM analytics
ORDER BY price DESC LIMIT 1;

-- 13. all reviews
SELECT SUM(reviews) FROM analytics;

-- 14. categories with more than 300 apps
SELECT category, COUNT(category) FROM analytics
GROUP BY category
HAVING COUNT(*) > 300;

-- 15. highest proportion of min_installs to reviews with at least 100,000 installs
SELECT app_name, reviews, min_installs, min_installs / reviews AS proportion FROM analytics
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMI 1;
