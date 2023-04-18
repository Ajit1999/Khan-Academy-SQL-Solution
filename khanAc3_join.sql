 USE khan_academy ;
 /* JOIN(Relational queries)*/
 
 /* Challenge 9 : Bobby's Hobbies */
 CREATE TABLE persons (
    id INTEGER PRIMARY KEY auto_increment,
    name TEXT,
    age INTEGER);
    
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);

CREATE table hobbies (
    id INTEGER PRIMARY KEY auto_increment,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");


/*We've created a database of people and hobbies, and each row in hobbies is related to a row in persons 
via the person_id column. Insert one more row in persons and then one more row in hobbies that is 
related to the newly inserted person.*/
INSERT INTO persons (name, age) VALUES ("adg", 14);
INSERT INTO hobbies (person_id, name) VALUES (6, "meowing");

#select * from hobbies;

/*Select the 2 tables with a join so that you can see each person's name next to their hobby.*/

SELECT persons.name, hobbies.name FROM persons 
JOIN hobbies 
ON persons.id = hobbies.person_id;

/*Show only the name and hobbies of 'Bobby McBobbyFace', using JOIN combined with WHERE.*/

SELECT persons.name, hobbies.name FROM persons 
JOIN hobbies 
ON persons.id = hobbies.person_id
WHERE persons.name = "Bobby McBobbyFace";




/* Challenge 10 : Customer's orders
We've created a database for customers and their orders. Note, not all of the customers 
have made orders. */

 CREATE TABLE customers (
    id INTEGER PRIMARY KEY auto_increment,
    name TEXT,
    email TEXT);
    
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY auto_increment,
    customer_id INTEGER,
    item TEXT,
    price REAL);

INSERT INTO orders (customer_id, item, price)
    VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (1, "TARDIS", 1000000.00);

/*Come up with a query that lists the name and email of every
 customer followed by the item and price of orders they've made. Use a LEFT OUTER JOIN 
 so that a customer is listed even if they've made no orders, and don't add any 
 ORDER BY.*/

 SELECT customers.name, customers.email, orders.item, orders.price
 FROM customers
 LEFT OUTER JOIN orders
 ON customers.id = orders.customer_id;

 /*Create another query that will result in one row per each customer, with their name, 
 email, and total amount of money they've spent on orders. Sort the rows according to 
 the total money spent, from the most spent to the least spent.
(Tip: You should always GROUP BY on the column that is most likely to be unique 
in a row.)*/

 SELECT customers.name, customers.email, SUM(orders.price) AS "total"
 FROM customers
 LEFT OUTER JOIN orders
 ON customers.id = orders.customer_id
 GROUP BY customers.id
 ORDER BY orders.price DESC;



/*Challenge 11 : Sequels in SQL
We've created a table with all the 'Harry Potter' movies, with a sequel_id column 
that matches the id of the sequel for each movie. */

CREATE TABLE movies (id INTEGER PRIMARY KEY ,
    title TEXT,
    released INTEGER,
    sequel_id INTEGER);
#drop table movies;

INSERT INTO movies 
    VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movies 
    VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movies 
    VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movies 
    VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movies 
    VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movies 
    VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movies 
    VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movies 
    VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);



/*Issue a  SELECT that will show the title of each movie next to its 
sequel's title (or NULL if it doesn't have a sequel).*/

SELECT movies.title AS "movie_title", sequel.title AS "sequel_title"
FROM movies
LEFT OUTER JOIN movies sequel
ON movies.sequel_id = sequel.id;



/* Challenge 12 : FriendBook
We've created a database for a friend networking site, with a table storing data on 
each person, a table on each person's hobbies, and a table of friend connections 
between the people.*/


CREATE TABLE person (
    id INTEGER PRIMARY KEY auto_increment,
    fullname TEXT,
    age INTEGER);
    
INSERT INTO person (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO person (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO person (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO person (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO person(fullname, age) VALUES ("Fluffy Sparkles", "8");

CREATE table hobbie (
    id INTEGER PRIMARY KEY auto_increment,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbie (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbie (person_id, name) VALUES (1, "coding");
INSERT INTO hobbie (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbie (person_id, name) VALUES (2, "coding");
INSERT INTO hobbie(person_id, name) VALUES (3, "skating");
INSERT INTO hobbie (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbie (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbie (person_id, name) VALUES (4, "coding");
INSERT INTO hobbie (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbie (person_id, name) VALUES (4, "meowing");

CREATE table friends (
    id INTEGER PRIMARY KEY auto_increment,
    person1_id INTEGER,
    person2_id INTEGER);

INSERT INTO friends (person1_id, person2_id)
    VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id)
    VALUES (2, 3);
    

/*Use a JOIN to display a table showing people's names with their hobbies.*/
SELECT person.fullname, hobbie.name
FROM person
JOIN hobbie
ON person.id = hobbie.person_id;

/*Use another SELECT with a  JOIN to show the names of each pair of friends, 
based on the data in the friends table.*/
SELECT a.fullname, b.fullname
FROM friends
JOIN person a
ON a.id = friends.person1_id
JOIN person b
ON b.id = friends.person2_id;



/**Project: Famous people
In this project, you’re going to make your own table with some small 
set of “famous people”, then make more tables about things they do and join 
those to create nice human readable lists. Contains at least two tables with at 
least 15 rows total. One of the tables contains a column that relates to the primary key of another table.
Has at least one query that does a JOIN.*/

CREATE TABLE billionares (
    id INTEGER PRIMARY KEY auto_increment,
    fullname TEXT,
    age INTEGER,
    nationality TEXT);
    
INSERT INTO billionares (fullname, age, nationality) VALUES ("Jeff Bezos", 54, "US");
INSERT INTO billionares (fullname, age, nationality) VALUES ("Bill Gates", 62, "US");
INSERT INTO billionares (fullname, age, nationality) VALUES ("Warren Buffet", 87, "US");
INSERT INTO billionares (fullname, age, nationality) VALUES ("Bernard Arnault", 69, "France");
INSERT INTO billionares (fullname, age, nationality) VALUES ("Mark Zucherberg", 33, "US");

CREATE table wealth (
    id INTEGER PRIMARY KEY auto_increment,
    billionare_id INTEGER,
    net_worth TEXT,
    source_wealth TEXT);
    
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (1, "112 billion", "Amazon");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (2, "90 billion", "Microsoft");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (3, "84 billion", "Berkshire Hathaway");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (4, "72 billion", "LVMH");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (5, "71 billion", "Facebook");


/*Return total net worth for each billionare*/
SELECT billionares.fullname, wealth.net_worth
FROM billionares
JOIN wealth
ON billionares.id = wealth.billionare_id;