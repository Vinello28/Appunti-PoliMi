CREATE TABLE Dipendenti
(
	id int identity (1,1) NOT NULL,
	nome varchar(20),
    cognome varchar(20),
	data_n Date,
	indirizzo_residenza varchar(20),
	indirizzo_lavoro varchar(20),
	tel_ufficio int,
	tel_azienda int,
    tel_privato int,
	sesso char,
    assunzione date,
    reparto varchar(15)
);

INSERT INTO Dipendenti (nome, cognome, data_n, indirizzo_residenza, indirizzo_lavoro, tel_ufficio, tel_azienda, tel_privato, sesso, assunzione, reparto)
VALUES ('"Mario"', '"Rossi"', '01/01/1980', '"via piave 14b"', '"via trento 30a"', '329122334', '320101555', '334566328', 'M', '10/2/2006', '"Software"');

INSERT INTO Dipendenti (nome, cognome, data_n, indirizzo_residenza, indirizzo_lavoro, tel_ufficio, tel_azienda, tel_privato, sesso, assunzione, reparto)
VALUES ('"Franco"', '"Marchini"', '05/06/1993', '"via circo 1c"', '"via trento 30a"', '329122996', '320101777', '345566212', 'M', '9/2/2008', '"Vendite"');

INSERT INTO Dipendenti (nome, cognome, data_n, indirizzo_residenza, indirizzo_lavoro, tel_ufficio, tel_azienda, tel_privato, sesso, assunzione, reparto)
VALUES ('"Mario"', '"Rossi"', '6/11/2000', '"viale bello 79d"', '"via trento 30a"', '329122892', '320101222', '329566777', 'M', '8/5/2019', '"Produzione"');
