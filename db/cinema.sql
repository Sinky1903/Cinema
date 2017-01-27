DROP TABLE customers CASCADE;
DROP TABLE films CASCADE;
DROP TABLE tickets;

CREATE TABLE customers (
id SERIAL8 primary key,
name VARCHAR(255) not null,
funds INT4 not null
);

CREATE TABLE films (
id SERIAL8 primary key,
title VARCHAR(255) not null,
price INT4 not null
);

CREATE TABLE tickets (
id SERIAL8 primary key,
customer_id INT4 references customers(id) ON DELETE CASCADE,
film_id INT4 references films(id) ON DELETE CASCADE
);