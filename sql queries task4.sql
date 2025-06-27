CREATE DATABASE netflix_db;
USE netflix_db;

CREATE TABLE netflix (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(20),
    title TEXT,
    director TEXT,
    cast TEXT,
    country VARCHAR(100),
    date_added DATE,
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(20),
    listed_in TEXT,
    description TEXT
);

show tables

LOAD DATA LOCAL INFILE 'C:/netflix.csv'
INTO TABLE netflix
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT * FROM netflix;


#1 all movies released in or after 2020
SELECT title, release_year
FROM netflix
WHERE type = 'Movie' AND release_year >= 2020
ORDER BY release_year DESC;



#2 the 10 most recently added titles
SELECT title, date_added
FROM netflix
ORDER BY STR_TO_DATE(date_added, '%M %d, %Y') DESC
LIMIT 10;



#3. Titles with the word 'Love' in their title
SELECT title
FROM netflix
WHERE title LIKE '%Love%';


#4. Count of titles by content type 
SELECT type, COUNT(*) AS total_count
FROM netflix
GROUP BY type;


#5. Total titles released each year
SELECT release_year, COUNT(*) AS title_count
FROM netflix
GROUP BY release_year
ORDER BY release_year DESC;


#6. Most common ratings
SELECT rating, COUNT(*) AS count
FROM netflix
GROUP BY rating
ORDER BY count DESC;


#7. Average release year per type
SELECT type, AVG(release_year) AS avg_release_year
FROM netflix
GROUP BY type;


#8. Titles with release year greater than average
SELECT title, release_year
FROM netflix
WHERE release_year > (
    SELECT AVG(release_year) FROM netflix
);


#9. Countries with more than average number of titles
SELECT country, COUNT(*) AS total
FROM netflix
GROUP BY country
HAVING total > (
    SELECT AVG(cnt) FROM (
        SELECT COUNT(*) AS cnt FROM netflix GROUP BY country
    ) AS subq
);


#10. a view of Indian Movies after 2010
CREATE VIEW indian_movies_2010_onward AS
SELECT title, release_year, rating
FROM netflix
WHERE country = 'India' AND type = 'Movie' AND release_year > 2010;

# View Filter by rating
SELECT * 
FROM indian_movies_2010_onward
WHERE rating = 'PG-13';



#11. View for TV Shows with more than 2 seasons
CREATE VIEW long_tv_shows AS
SELECT title, duration
FROM netflix
WHERE type = 'TV Show' AND duration LIKE '%seasons%'
AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 2;

# View Limit output to top 5
SELECT * 
FROM long_tv_shows
LIMIT 5;


#12. Indexing
CREATE INDEX idx_type ON netflix(type);
CREATE INDEX idx_year ON netflix(release_year);
CREATE INDEX idx_rating ON netflix(rating);

SHOW INDEX FROM netflix;

EXPLAIN SELECT * FROM netflix WHERE release_year > 2015;



# new table
CREATE TABLE genres (
    show_id VARCHAR(10),
    genre VARCHAR(50)
);



#13. INNER JOIN: Join netflix with genres
SELECT n.title, g.genre
FROM netflix n
JOIN genres g ON n.show_id = g.show_id
WHERE g.genre = 'Comedies';


#14. LEFT JOIN: Shows with or without genre match
SELECT n.title, g.genre
FROM netflix n
LEFT JOIN genres g ON n.show_id = g.show_id;


#15. Movies longer than 120 minutes
SELECT title, duration
FROM netflix
WHERE type = 'Movie' AND duration LIKE '%min'
AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 120;


#16. Shows missing director info
SELECT title
FROM netflix
WHERE director IS NULL OR director = '';


#17. Count of shows added each month
SELECT MONTH(STR_TO_DATE(date_added, '%M %d, %Y')) AS month_num,
       COUNT(*) AS total
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY month_num;


#18. Top 5 countries with most TV Shows
SELECT country, COUNT(*) AS show_count
FROM netflix
WHERE type = 'TV Show'
GROUP BY country
ORDER BY show_count DESC
LIMIT 5;


#19. All movies released in the same year as “Inception”
SELECT title, release_year
FROM netflix
WHERE release_year = (
    SELECT release_year
    FROM netflix
    WHERE title = 'Inception'
    LIMIT 1
);


#20. All titles with a rating equal to the most common one
SELECT title, rating
FROM netflix
WHERE rating = (
    SELECT rating
    FROM netflix
    GROUP BY rating
    ORDER BY COUNT(*) DESC
    LIMIT 1
);


