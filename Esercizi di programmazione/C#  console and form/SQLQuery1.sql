CREATE TABLE Città
(
	id_city INT IDENTITY (1,1) NOT NULL,
	descrizione VARCHAR(30),
	CONSTRAINT pk_city PRIMARY KEY(id_city)
);

INSERT INTO Città (descrizione) VALUES ('Milano');
INSERT INTO Città (descrizione) VALUES ('Ancona');
INSERT INTO Città (descrizione) VALUES ('Roma');