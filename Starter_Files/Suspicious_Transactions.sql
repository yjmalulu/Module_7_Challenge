-- Drop tables
DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS merchant_ctegory CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

-- Create a table of card_holder
CREATE TABLE card_holder (
	id INT PRIMARY KEY,
	name VARCHAR NOT NULL
);

-- Create a table of credit_card
CREATE TABLE credit_card (
	card VARCHAR(20) NOT NULL PRIMARY KEY,
	cardholder_id INT,
	FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

-- Create a table of merchant_category
CREATE TABLE merchant_category (
	id INT PRIMARY KEY,
	name VARCHAR NOT NULL
);

-- Create a table of merchant
CREATE TABLE merchant (
	id INT PRIMARY KEY,
	name VARCHAR NOT NULL,
	id_merchant_category INT,
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

-- Create a table of transaction
CREATE TABLE transaction (
	id INT NOT NULL PRIMARY KEY,
	date TIMESTAMP,
	amount FLOAT,
	card VARCHAR(20),
	FOREIGN KEY (card) REFERENCES credit_card(card),
	id_merchant INT,
	FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);

SELECT * FROM card_holder;
SELECT * FROM credit_card;
SELECT * FROM merchant;
SELECT * FROM merchant_category;
SELECT * FROM transaction;

SELECT * FROM transaction
INNER JOIN credit_card ON transaction.card = credit_card.card
INNER JOIN card_holder ON credit_card.cardholder_id = card_holder.id;