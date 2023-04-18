 USE khan_academy ;
 /* Modifying databases with SQL */
 
 /*Challenge 13 : Dynamic Documents
 We've created a database for a documents app, with rows for each document with it's 
title, content, and author. */


CREATE table documents (
    id INTEGER PRIMARY KEY auto_increment,
    title TEXT,
    content TEXT,
    author TEXT);
    
INSERT INTO documents (author, title, content)
    VALUES ("Puff T.M. Dragon", "Fancy Stuff", "Ceiling wax, dragon wings, etc.");
INSERT INTO documents (author, title, content)
    VALUES ("Puff T.M. Dragon", "Living Things", "They're located in the left ear, you know.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Pirate Recipes", "Cherry pie, apple pie, blueberry pie.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Boat Supplies", "Rudder - guitar. Main mast - bed post.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Things I'm Afraid Of", "Talking to my parents, the sea, giant pirates, heights.");

SELECT * FROM documents;

/*Use UPDATE to change the author to 'Jackie Draper' for all rows where it's currently
 'Jackie Paper'. 
Then re-select all the rows to make sure the table changed like you expected.*/

UPDATE documents
SET author = "Jackie Draper" 
WHERE author = "Jackie Paper";

SELECT * FROM documents;

/*Now you'll delete a row, being very careful not to delete all the rows. Only delete 
the row where the title is 'Things I'm Afraid Of'. Then re-select all the rows to 
make sure the table changed like you expected.*/
DELETE FROM documents
WHERE title = "Things I'm Afraid Of";

SELECT * FROM documents;





/*Challenge 14 : Clothing alterations
We've created a database of clothes, and decided we need a price column. 
Use ALTER to add a 'price' column to the table. 
Then select all the columns in each row to see what your table looks like now.*/

CREATE TABLE clothes (
    id INTEGER PRIMARY KEY auto_increment,
    type TEXT,
    design TEXT);
    
INSERT INTO clothes (type, design)
    VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
    VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
    VALUES ("blazer", "black sequin");

ALTER TABLE clothes ADD price Integer;
SELECT * FROM clothes;

/*Now assign each item a price, using UPDATE - item 1 should be 10 dollars, item 2 
should be 20 dollars, item 3 should be 30 dollars. When you're done, do another 
SELECT of all the rows to check that it worked as expected.*/

UPDATE clothes SET price = 10
WHERE id = 1;

UPDATE clothes SET price = 20
WHERE id = 2;

UPDATE clothes SET price = 30
WHERE id = 3;

SELECT * FROM clothes;

/*Now insert a new item into the table that has all three attributes filled in, 
including 'price'. Do one final SELECT of all the rows to check it worked.*/

INSERT INTO clothes (type, design, price)
VALUES ("skirt", "striped", 56);

SELECT * FROM clothes;




/* Project : 
Think about your favorite apps, and pick one that stores your data- like a game 
that stores scores, an app that lets you post updates, etc. 
Now in this project, you're going to imagine that the app stores your data 
in a SQL database (which is pretty likely!), and write SQL statements 
that might look like their own SQL.
CREATE a table to store the data.
INSERT a few example rows in the table.
Use an UPDATE to emulate what happens when you edit data in the app.
Use a DELETE to emulate what happens when you delete data in the app.*/

CREATE TABLE fitness_pal (
    id INTEGER PRIMARY KEY auto_increment,
    name TEXT,
    workout_type TEXT,
    minutes INTEGER);

INSERT INTO fitness_pal (name, workout_type, minutes) VALUES ("Katrina", "running", 50);
INSERT INTO fitness_pal (name, workout_type, minutes) VALUES ("Mel", "jumping", 15);
INSERT INTO fitness_pal (name, workout_type, minutes) VALUES ("Don", "running", 30);
INSERT INTO fitness_pal (name, workout_type, minutes) VALUES ("Deb", "swimming", 60);

#SELECT * from fitness_pal;

UPDATE fitness_pal set name = "Donny"
WHERE id = 3;

#SELECT * from fitness_pal;

DELETE FROM fitness_pal 
WHERE id = 4;

#SELECT * from fitness_pal;