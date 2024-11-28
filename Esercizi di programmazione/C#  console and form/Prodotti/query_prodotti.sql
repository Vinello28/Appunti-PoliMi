CREATE TABLE Prodotti
(
	id_pr INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	descr VARCHAR(20) NOT NULL,
	prezzo FLOAT NOT NULL,
	qt INT NOT NULL,

);

INSERT INTO Prodotti (descr, prezzo, qt) VALUES ('mele', 2, 10);
INSERT INTO Prodotti (descr, prezzo, qt) VALUES ('banane', 1, 12);
INSERT INTO Prodotti (descr, prezzo, qt) VALUES ('cocco', 4, 9);
INSERT INTO Prodotti (descr, prezzo, qt) VALUES ('hamburger', 6, 9);
