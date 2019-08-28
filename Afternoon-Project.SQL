SELECT *
FROM invoice i
JOIN invoice_line il ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;

SELECT invoice_date, first_name, last_name, total
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id;

SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM employee e
JOIN customer c ON c.support_rep_id = e.employee_id;

SELECT b.title, r.name
FROM album b
JOIN artist r ON r.artist_id = b.album_id;

SELECT t.playlist_track_id
FROM playlist_track t
JOIN playlist p ON p.playlist_id = t.playlist_id
WHERE name = 'Music';

SELECT t.name
FROM track t
JOIN playlist_track p ON t.track_id = p.track_id
WHERE p.playlist_id = 5;

SELECT t.name, p.name
FROM track t
JOIN playlist p ON p.playlist_id = t.track_id
JOIN playlist_track pt ON t.track_id = pt.track_id;

SELECT t.name, title
FROM track t
JOIN album a ON t.track_id = a.album_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Alternative & Punk';


SELECT *
FROM invoice
WHERE invoice_id IN (SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99);

SELECT *
FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE name = 'Music');

SELECT name
FROM track
WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5);

SELECT *
FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');

SELECT *
FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE name = 'Fireball');

SELECT *
FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE artist_id IN (
SELECT artist_id FROM artist WHERE name = 'Queen'));


UPDATE customer
SET fax = null
WHERE fax IS NOT null;

UPDATE customer
SET company = 'Self'
WHERE company IS null;

UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = 'Barnett';

UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal') AND composer IS null;


SELECT count(*), g.name
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY g.name;

SELECT count(*), g.name
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name;

SELECT count(*), ar.name
FROM artist ar
JOIN album al ON ar.artist_id = al.artist_id
GROUP BY ar.name;


SELECT DISTINCT compose
FROM track;

SELECT DISTINCT billing_postal_code
FROM invoice;

SELECT DISTINCT company
FROM customer;


-- Practice Delete Table
CREATE TABLE practice_delete ( name TEXT, type TEXT, value INTEGER );
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
SELECT * FROM practice_delete;

DELETE FROM practice_delete
WHERE type = 'bronze';

DELETE FROM practice_delete
WHERE type = 'silver';

DELETE FROM practice_delete
WHERE value = 150;


CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  email TEXT
);
CREATE TABLE products(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  price INTEGER
);
CREATE TABLE orders(
  id SERIAL PRIMARY KEY,
  products_id INTEGER REFERENCES products(id)
);

INSERT INTO users
(name, email)
VALUES
('Alex', 'akdkjdsjk@dkfd.df'),
('Harry', 'akdsfalkjdk@dkf.sd'),
('Tom', 'kajfslkj@dlkjf.da')
INSERT INTO products
(name, price)
VALUES
('Wand', 60),
('Broomstick', 400),
('Football', 30) 
INSERT INTO orders
(products_id)
VALUES
(1),
(2),
(3)

SELECT *
FROM orders o
JOIN products p ON p.id = o.products_id
WHERE o.products_id = 1;

SELECT *
FROM orders;

SELECT sum(p.price)
FROM orders o
JOIN products p ON p.id = o.products_id;

ALTER TABLE orders
ADD COLUMN users_id INTEGER REFERENCES users(id);

INSERT INTO orders
(users_id)
VALUES
(1),
(2),
(3);

SELECT *
FROM users u
JOIN orders o ON o.users_id = u.id
WHERE u.id = 1;

SELECT count(o.users_id)
FROM orders o
JOIN users u ON o.users_id = u.id;