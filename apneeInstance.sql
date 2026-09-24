/* **************************************************
  * insertion des resultats de competitions d'apnee *
 ************************************************** */


/* transactions pour remplir les tables Apneiste, Competition, Epreuve, Participe. */
START TRANSACTION;

/* table Apneiste */
INSERT INTO APNEISTE(id, nom, dbirth, nationalite) VALUES
	(1, "Mayol", '1927-04-01', "France"),
	(2, "Maiorca", '1931-06-21', "italienne"),
	(3, "Molchanova", '1962-05-08', "russe"),
	(4, "Ferreras", '1962-01-18', "cubaine"),
	(5, "Pelizzari", '1965-08-28', "italienne"),
	(6, "Leferme", '1970-08-28', "France"),
	(7, "Mifsud", '1971-08-13', "France"),
	(8, "Nitsch", '1970-04-20', "autrichienne"),
	(9, "Streeter", '1973-01-10', "britannique"),
	(10, "Coste", '1976-02-02', "venezuelienne"),
	(11, "Molchanov", '1987-03-06', "russe"),
	(12, "Zecchini", '1992-06-30', "italienne"),
	(13, "Guerin-Boeri", '1984-08-13', "France");

/* table Competition */
INSERT INTO COMPETITION(id, lieu, annee) VALUES
	(0, "Bahamas", 1970),
	(1, "Tenerife", 1992),
	(2, "Bahamas", 1994),
	(3, "Mulhouse", 2015),
	(4, "Kas", 2016),
	(5, "Tenerife", 2014),
	(6, "Kas", 2018),
	(7, "Belgrade", 2021),
	(8, "Belgrade", 2022),
	(9, "Roatan", 2023),
	(10, "Kalamata", 2024),
	(11, "Belgrade", 2024)
	;

/* table Epreuve */
 INSERT INTO EPREUVE(type, compID) VALUES
 	("VWT", 0),
	("CWT", 1),
	("VWT", 1),
	("CWT", 2),
	("VWT", 2),
	("DYN", 3),
	("STA", 3),
	("CWT", 4),
	("VWT", 4),
	("STA", 6),
	("DYN", 7),
	("STA", 7),
	("VWT", 10),
	("CWT", 10)
;

/* table Participe */
INSERT INTO PARTICIPE(apID, EpreuveType, idcompet, duree, distance) VALUES
	(1, "VWT", 0, 214, 87),
	(2, "VWT", 0, 190, 85),
	(3, "VWT", 2, 286, 112),
	(4, "VWT", 2, 301, 111),
	(5, "VWT", 2, 252, 102),
	(5, "CWT", 2, 288, 88),
	(11, "DYN", 3, 190, 289),
	(12, "DYN", 3, 178, 252),
	(13, "DYN", 3, 166, 259)
	;

COMMIT; /* insertion des données et fin de transaction */

/* fin du script */
