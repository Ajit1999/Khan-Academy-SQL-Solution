CREATE DATABASE khan_academy ;
 USE khan_academy ;
 
 /*Challenge 1 : Book list database
Create a table to store a list of books. It should have columns for id, name, and rating. 
Add three of your favorite books into the table. */

CREATE TABLE books (id INTEGER PRIMARY KEY, name TEXT, rating INTEGER);
INSERT INTO books VALUES (1, "learn SQL", 5);
INSERT INTO books VALUES (2, "learn Python", 4);
INSERT INTO books VALUES (3, "learn java", 4);


/*Challenge 2: Box office hits database 
This database contains an incomplete list of box office hits and their release year. 
You're going to get the results back out of the database in different ways! 
 */
CREATE TABLE movies (id INTEGER PRIMARY KEY, name TEXT, release_year INTEGER);
INSERT INTO movies VALUES (1, "Avatar", 2009);
INSERT INTO movies VALUES (2, "Titanic", 1997);
INSERT INTO movies VALUES (3, "Star Wars: Episode IV - A New Hope", 1977);
INSERT INTO movies VALUES (4, "Shrek 2", 2004);
INSERT INTO movies VALUES (5, "The Lion King", 1994);
INSERT INTO movies VALUES (6, "Disney's Up", 2009);
 
 /*Select all the movies.*/
SELECT * from movies;

/*Retrieve only the movies that were released in the year 2000 or later, not before. 
Sort the results so that the earlier movies are listed first. */
SELECT * FROM movies WHERE release_year>=2000
 ORDER BY release_year;
 
 
 
 /*Challenge 3: TODO list database stats
 Here's a table containing a TODO list with the number of minutes it will take to complete each item. 
Insert another item to your todo list with the estimated minutes it will take.
Select the SUM of minutes it will take to do all of the items on your TODO list.*/
 CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);
INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on KA", 60);
INSERT INTO todo_list VALUES (4, "watch news", 30);
INSERT INTO todo_list VALUES (5, "rivision of KA", 30);
 
/*Step 2 : Select the SUM of minutes it will take to do all of the items on your TODO list. 
You should only have one SELECT statement.*/
SELECT SUM(minutes) from todo_list;


/*Challenge 4 : Project: Design a store database
Create your own store! Your store should sell one type of things, like clothing or bikes, whatever you want
 store to specialize in. You should have a table for all the items in your store, and at least 5 columns 
 for the kind of data you think you'd need to store. You should sell at least 15 items, and use select 
 statements to order your items by price and show at least one statistic about the items.*/

CREATE TABLE clothing (id INTEGER PRIMARY KEY, item_type TEXT, quantity INTEGER, price INTEGER, size TEXT);

INSERT INTO clothing VALUES (1, "Dress", 10, 54.00, "L");
INSERT INTO clothing VALUES (2, "Skirt", 5, 64.00, "L");
INSERT INTO clothing VALUES (3, "Shorts", 50, 4.00, "M");
INSERT INTO clothing VALUES (4, "Pants", 6, 104.00, "L");
INSERT INTO clothing VALUES (5, "Jeans", 60, 298.00, "L");
INSERT INTO clothing VALUES (6, "Leggings", 7, 33.00, "M");
INSERT INTO clothing VALUES (7, "Socks", 77, 5.00, "S");
INSERT INTO clothing VALUES (8, "Underware", 8, 4.99, "L");
INSERT INTO clothing VALUES (9, "Bras", 80, 75.00, "L");
INSERT INTO clothing VALUES (10, "Bathing Suit", 200, 54.00, "L");
INSERT INTO clothing VALUES (11, "Bikini", 100, 150.00, "L");
INSERT INTO clothing VALUES (12, "Shoes", 1000, 500.00, "L");
INSERT INTO clothing VALUES (13, "Scarf", 66, 99.00, "S");
INSERT INTO clothing VALUES (14, "Shirt", 88, 54.00, "M");
INSERT INTO clothing VALUES (15, "Tank Top", 99, 54.00, "L");

SELECT * FROM clothing 
ORDER BY price;

SELECT SUM(quantity) FROM clothing;

SELECT size,SUM(quantity) FROM clothing group by size;


