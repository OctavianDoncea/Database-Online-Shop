CREATE TABLE useri(
    ID_user INT NOT NULL,
    username VARCHAR(30) NOT NULL unique,
    parola VARCHAR(30) NOT NULL, 
    data_inreg DATE, 
    tip_user VARCHAR(30) NOT NULL,
    data_nastere DATE,
    nr_telefon VARCHAR(10) NOT NULL,
    nume VARCHAR(20) NOT NULL, 
    prenume VARCHAR(30),
    PRIMARY KEY (ID_user)
);

CREATE TABLE categorii(
    ID_categorie INT NOT NULL,
    ID_admin INT NOT NULL,
    nume_categ VARCHAR(20),
    PRIMARY KEY (ID_categorie),
    FOREIGN KEY (ID_admin) REFERENCES useri(ID_user)
);

CREATE TABLE produse(
    ID_produs INT NOT NULL,
    ID_categorie INT NOT NULL,
    ID_colab INT NOT NULL,
    nume_prod VARCHAR(30) NOT NULL,
    pret_prod NUMERIC(4,4) NOT NULL,
    descriere_prod VARCHAR(255),
    stock_prod INT,
    PRIMARY KEY (ID_produs),
    FOREIGN KEY (ID_categorie) REFERENCES categorii(ID_categorie),
    FOREIGN KEY (ID_colab) REFERENCES useri(ID_user)
);



CREATE TABLE comentarii(
    ID_comentariu INT NOT NULL,
    ID_user INT NOT NULL,
    ID_produs INT NOT NULL,
    continut VARCHAR(255),
    rating INT,
    PRIMARY KEY (ID_comentariu),
    FOREIGN KEY (ID_user) REFERENCES useri(ID_user),
    FOREIGN KEY (ID_produs) REFERENCES produse(ID_produs)
);

CREATE TABLE comenzi(
    ID_comanda INT NOT NULL,
    ID_user INT NOT NULL,
    data_comanda DATE NOT NULL,
    tip_plata VARCHAR(20) NOT NULL,
    adresa_livrare VARCHAR(100),
    data_livrare DATE,
    stadiu_livrare VARCHAR(50),
    PRIMARY KEY (ID_comanda),
    FOREIGN KEY (ID_user) REFERENCES useri(ID_user)
);

CREATE TABLE cos_cumparaturi(
    cantitate INT NOT NULL,
    ID_comanda INT NOT NULL,
    ID_user INT NOT NULL,
    ID_produs INT NOT NULL,
    FOREIGN KEY (ID_user) REFERENCES useri(ID_user),
    FOREIGN KEY (ID_produs) REFERENCES produse(ID_produs),
    FOREIGN KEY (ID_comanda) REFERENCES comenzi(ID_comanda)
);

INSERT INTO useri VALUES
(1, 'octav99', 'monkey@10', TO_DATE('2021/01/01', 'yyyy/mm/dd'), 'ADMIN', TO_DATE('1999/12/05', 'yyyy/mm/dd'), '0724834239', 'Doncea', 'Octavian');
INSERT INTO useri VALUES
(2, 'maria_ioana', 'monkey@11', TO_DATE('2021/01/05', 'yyyy/mm/dd'), 'COLABORATOR', TO_DATE('1999/02/15', 'yyyy/mm/dd'), '0762074911', 'Ionescu', 'Maria');
INSERT INTO useri VALUES
(3, 'Andi_33', 'monkey@12', TO_DATE('2021/01/10', 'yyyy/mm/dd'), 'COLABOARTOR', TO_DATE('1999/09/14', 'yyyy/mm/dd'), '0753264353', 'Popescu', 'Andrei');
INSERT INTO useri VALUES
(4, 'the_count', 'monkey@13', TO_DATE('2021/01/15', 'yyyy/mm/dd'), 'CLIENT', TO_DATE('1999/10/04', 'yyyy/mm/dd'), '0712345678', 'Marcu', 'Rares');
INSERT INTO useri VALUES
(5, 'mmmg2508', 'monkey@14', TO_DATE('2021/01/20', 'yyyy/mm/dd'), 'CLIENT', TO_DATE('1999/08/25', 'yyyy/mm/dd'), '0787654321', 'Marinescu', 'Matei');
INSERT INTO useri VALUES
(6, 'skitz', 'monkey@15', TO_DATE('2021/01/25', 'yyyy/mm/dd'), 'CLIENT', TO_DATE('1999/07/20', 'yyyy/mm/dd'), '0724876556', 'Moisi', 'Andrei');
INSERT INTO useri VALUES
(7, 'kepler', 'monkey@16', TO_DATE('2021/01/30', 'yyyy/mm/dd'), 'CLIENT', TO_DATE('1999/04/06', 'yyyy/mm/dd'), '0712344321', 'Filip', 'Horatiu');
INSERT INTO useri VALUES
(8, 'cornel_66', 'monkey@17', TO_DATE('2021/02/04', 'yyyy/mm/dd'), 'CLIENT', TO_DATE('1999/01/24', 'yyyy/mm/dd'), '0742131234', 'Doncea', 'Cornel');
INSERT INTO useri VALUES
(9, 'munte', 'monkey@18', TO_DATE('2021/02/09', 'yyyy/mm/dd'), 'CLIENT', TO_DATE('1999/06/30', 'yyyy/mm/dd'), '0746012349', 'Sicu', 'Bogdan');
INSERT INTO useri VALUES
(10, 'daniela.d', 'monkey@19', TO_DATE('2021/02/14', 'yyyy/mm/dd'), 'CLIENT', TO_DATE('1999/05/17', 'yyyy/mm/dd'), '0739243842', 'Doncea', 'Daniela');



INSERT INTO categorii VALUES (1, 1, 'Carti');
INSERT INTO categorii VALUES (2, 1, 'Manuale scolare');
INSERT INTO categorii VALUES (3, 1, 'Parfumuri');
INSERT INTO categorii VALUES (4, 1, 'Ceasuri');
INSERT INTO categorii VALUES (5, 1, 'Electronice');



INSERT INTO produse VALUES (10, 1, 2, 'Morometii', 24.99, 'aaaaaaa', 30);
INSERT INTO produse VALUES (11, 2, 2, 'Culegere de matematica', 39.99, 'bbbbbbb', 25);
INSERT INTO produse VALUES (12, 3, 3, 'Parfum de barbati Versace', 99.99, 'ccccccc', 9);
INSERT INTO produse VALUES (13, 4, 3, 'Ceas de perete ', 99.99, 'ddddddd', 14);
INSERT INTO produse VALUES (14, 5, 3, 'Televizor LED', 99.99, 'eeeeeee', 6);



INSERT INTO comentarii VALUES (100, 4, 10, 'cea mai buna carte pe care am citit-o pana acum', 10);
INSERT INTO comentarii VALUES (101, 5, 11, 'm-a ajutat destul de sa invat matematica', 9);
INSERT INTO comentarii VALUES (102, 6, 12, 'e parfum contrafacut, nu e de mirare ca e pretul asa mic', 2);
INSERT INTO comentarii VALUES (103, 7, 13, '', 8);
INSERT INTO comentarii VALUES (104, 8, 14, 'l-am luat parintilor mei si sunt multumiti', 8);



INSERT INTO comenzi VALUES (1000, 10, TO_DATE('2021/05/27','yyyy/mm/dd'), 'Cash', 'Bd. Banul Manta 1', TO_DATE('2021/05/29', 'yyyy/mm/dd'), null);
INSERT INTO comenzi VALUES (1001, 9, TO_DATE('2021/05/28','yyyy/mm/dd'), 'Online', 'Bd. Magheru 35', TO_DATE('2021/05/29', 'yyyy/mm/dd'), null);
INSERT INTO comenzi VALUES (1002, 8, TO_DATE('2021/05/29','yyyy/mm/dd'), 'Online', 'Strada Academiei 10', TO_DATE('2021/05/31', 'yyyy/mm/dd'), null);
INSERT INTO comenzi VALUES (1003, 7, TO_DATE('2021/05/30','yyyy/mm/dd'), 'Cash', 'Calea Victoriei 67', TO_DATE('2021/06/01', 'yyyy/mm/dd'), null);
INSERT INTO comenzi VALUES (1004, 6, TO_DATE('2021/05/31','yyyy/mm/dd'), 'Cash', 'Bd. Iuliu Maniu 50', TO_DATE('2021/06/02', 'yyyy/mm/dd'), null);



INSERT INTO cos_cumparaturi VALUES (3, 1000, 10, 10);
INSERT INTO cos_cumparaturi VALUES (1, 1000, 10, 11);
INSERT INTO cos_cumparaturi VALUES (2, 1001, 9, 11);
INSERT INTO cos_cumparaturi VALUES (3, 1001, 9, 12);
INSERT INTO cos_cumparaturi VALUES (4, 1002, 8, 12);
INSERT INTO cos_cumparaturi VALUES (2, 1002, 8, 13);
INSERT INTO cos_cumparaturi VALUES (3, 1003, 7, 13);
INSERT INTO cos_cumparaturi VALUES (5, 1003, 7, 14);
INSERT INTO cos_cumparaturi VALUES (2, 1004, 6, 14);
INSERT INTO cos_cumparaturi VALUES (1, 1004, 6, 10);

