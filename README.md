# task4_SQL_Data-Analysis

This task focuses on analyzing Netflix TV shows and movies using **MySQL**. It demonstrates a wide range of SQL techniques — from basic querying and filtering to advanced subqueries, JOINs, aggregate functions, views, and indexing. The analysis provides insights into content types, release trends, popular genres, and more. All queries were executed in MySQL Workbench, and results were documented with screenshots.

## Files

- `netflix.csv` – Netflix CSV dataset
- `sql_queries_task4.sql` – SQL queries from MYSQL Workbench
- `sql_query_output_screenshots.zip` – Screenshots of executed query outputs

## Tools 

- MySQL Workbench
- CSV file

## Dataset Overview

The dataset contains metadata about Netflix titles with the following fields:

- `show_id`, `title`, `type`, `description`
- `release_year`, `age_certification`, `runtime`
- `imdb_id`, `imdb_score`, `imdb_votes`
- `country`, `rating`, `date_added`
- `listed_in`, `director`, `cast`

## SQL Concepts Demonstrated

- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING`
- Aggregate functions (`COUNT`, `AVG`, `SUM`)
- Subqueries (in `WHERE` clause)
- JOINS (`INNER JOIN`, `LEFT JOIN`)
- Views for reusable queries
- Indexing for performance optimization

## SQL Query Descriptions 

1. **Movies Released in or After 2020**  
   Shows all movies with a release year of 2020 or later, ordered from newest to oldest.

2. **Top 10 Recently Added Titles**  
   Retrieves the 10 latest titles based on the date they were added to Netflix.

3. **Titles Containing the Word 'Love'**  
   Searches for titles that include the word "Love" in their name.

4. **Count by Content Type**  
   Counts the total number of entries grouped by whether they are Movies or TV Shows.

5. **Titles Released Each Year**  
   Displays how many titles were released in each year, ordered by year.

6. **Most Common Ratings**  
   Lists content ratings (e.g., PG, TV-MA) in order of frequency.

7. **Average Release Year per Type**  
   Shows the average release year for Movies and TV Shows separately.

8. **Titles Released After Average Year**  
   Filters titles that were released later than the dataset’s overall average year.

9. **Countries with More than Average Titles**  
   Finds countries whose number of titles is above the average across all countries.

10. **Indian Movies After 2010 (View)**  
    Creates a view to display Indian movies released after 2010.

11. **Indian PG-13 Movies from View**  
    Filters the view to display only movies rated PG-13.

12. **Long TV Shows (More Than 2 Seasons)**  
    Creates a view for TV shows with over 2 seasons based on duration string.

13. **Top 5 Long TV Shows**  
    Selects the first five entries from the view of long TV shows.

14. **Create Indexes**  
    Adds indexes on type, release year, and rating columns to speed up filtering.

15. **Show Indexes and Explain Query**  
    Displays created indexes and explains how MySQL plans to run a query.

16. **Genres Table Creation**  
    Creates a new table `genres` to split and store multiple genres per title.

17. **Inner Join on Netflix and Genres**  
    Joins `netflix` and `genres` tables to find titles tagged as 'Comedies'.

18. **Left Join for All Titles with Genres**  
    Shows all titles including those without a genre using a LEFT JOIN.

19. **Movies Longer Than 120 Minutes**  
    Filters out movies with a runtime greater than 2 hours.

20. **Titles Without Director Info**  
    Finds shows or movies with no director listed (NULL or empty).

21. **Titles Added Per Month**  
    Groups the number of titles added to Netflix by calendar month.

22. **Top 5 Countries with Most TV Shows**  
    Lists the countries with the highest count of TV Shows.

23. **Movies Released Same Year as “Inception”**  
    Shows all titles released in the same year as "Inception".

24. **Titles with Most Frequent Rating**  
    Retrieves all titles that have the most commonly used rating.
