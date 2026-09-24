
CREATE TABLE adresse(
    id TINYINT UNSIGNED PRIMARY KEY,
    num TINYINT UNSIGNED,
    voie VARCHAR(30),
    codep INT UNSIGNED,
    ville VARCHAR(30)
);

CREATE personne(
    nom VARCHAR(20),
    prenom VARCHAR(20),
    idadress TINYINT UNSIGNED,
    PRIMARY KEY(nom,prenom)
);


INSERT INTO adresse VALUES
    (1,21,'rue Charles DeGaulle',914000,'Orsay'),
    (2,33,'route de la vallee du lys',37190,'Azay-le-Rideau'),
    (3,12,'avenneu des Etoiles',77440,'Mary-sur-Marne');

INSERT INTO personne VALUES
    ('de Saint-Exupery','Antoine',1),
    ('Mermoz','Jean',3),
    ('Bolland','Adrienne',2);

SELECT nom,prenom
    FROM personne
    WHERE prenom LIKE 'A%';

SELECT p.nom, p.prenom
    FROM personne AS p, adresse AS a 
    WHERE p.idadress = a.id 
        AND a.num < 20 ;

