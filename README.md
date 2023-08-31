# Database-Online-Shop

Baza de date este proiectata pentru a gestiona un magazin online. Aceasta va retine produsele din stoc, precum date despre clienti si comenzile facute de acestia. 

Clientii vor putea face comenzi, fiecare comanda avand un anumit numar de produse, numele + numarul de telefon al clientului, adresa livrarii si comentarii legate de comanda. Pentru sistemul de comenzi, site-ul va realiza urmatoarea procesare: se verifica in tabelul “Cos_cumparaturi” produsele al caror “ID_produs” e Null (adica nu apartin niciunei comenzi), iar acestea vor face parte din noua comanda. Dupa, “ID_comanda” se schimba in id-ul comenzii respective. 


Constrangeri 

 

Useri: 

ID_user, username, parola, tip_user, nr_telefon, nume, sa fie diferite de null. 

username sa fie unic 

 

Categorii 

ID_categorie, ID_admin, nume_categ sa fie diferite de null 

 

Produse 

ID_produs, ID_categorie, ID_colab, nume_prod, pret_prod sa fie diferite de null 

 

Comentarii 

ID_comentariu, ID_user, ID_produs, rating sa fie diferite de null 

 

Comenzi 

ID_comanda, ID_user, data_comanda, tip_plata sa fie diferite de null 

 

Cos_cumparaturi 

ID_user, ID_produs, ID_comanda, cantitate sa fie diferite de null 

 

 

Descriere entitati si atribute 

 

Useri: retine detalii despre utilizator, care poate fi de 3 tipuri: client, colaborator (reprezentant al unei firme care vrea sa-si vanda produsele prin intermediul site-ului) si admin 

-ID_user(PK) [int] 

-username [varchar(30)]  

-parola [varchar(30)] 

-data_inreg [date] 

-tip_user [varchar(30)], client/colaborator/admin 

-data_nastere [date] 

-nr_telefon [varchar(10)] 

-nume [varchar(20)] 

-prenume [varchar(30)] 

 

Categorii: reprezinta tipurile de produse 

-ID_categorie(PK) [int] 

-ID_admin(FK) [int], adminul poate sterge/adauga categorii de produse, face legatura cu ID_user din entitatea “Useri” 

-nume_categ [varchar(20)]  

 

Produse: produsele de pe site si detalii despre acestea 

-ID_produs(PK) [int] 

-ID_categorie(FK) [int], face legatura cu entitatea “Categorii” 

-ID_colab(FK) [int], id-ul colaboratorului care a adaugat produsul, face legatura cu ID_user din entitatea “Useri” 

-nume_prod [varchar(30)] 

-pret_prod [numeric(4,2)] 

-descriere_prod [varchar(255)] 

-stock_prod [int], cate produse sunt in stock 

 

Comentarii: retine comentariile pe care le face clientul legate de produs 

-ID_comentariu(PK) [int] 

-ID_user(FK) [int], face legatura cu entitatea “Useri” 

-ID_produs(FK) [int], face legatura cu entitatea “Produse” 

-continut [varchar(255)] 

-rating [int] 

 

Comenzi: retine comenzile si detaliile legate de acestea 

-ID_comanda(PK) [int] 

-ID_user(FK) [int], face legatura cu entitatea “Useri” 

-data_comanda [date] 

-tip_plata [varchar(20)] 

-adresa_livrare [varchar(100)] 

-data_livrare [date] 

-stadiu_livrare [varchar(50)] 

 

Cos_cumparaturi: retine produsele selectate de client pentru a fi comandate 

-cantitate(PK) [int] 

-ID_user(FK) [int], face legatura cu entitatea “Useri” 

-ID_produs(FK) [int], face legatura cu entitatea “Produse” 

-ID_comanda(FK) [int], face legatura cu entitatea “Comenzi” 

 

 

 

Descrierea relatiilor 

 

Useri-Categorii: un admin poate introduce mai multe categorii de produse (one-to-many) 

Useri-Produse: un admin sau colaborator pot introduce mai multe produse (one-to-many) 

Useri-Cos_cumparaturi: un client are un singur cos de cumparaturi (one-to-one) 

Useri-Comentarii: un client poate scrie mai multe comentarii (one-to-many) 

Useri-Comenzi: un client poate face una sau mai multe comenzi (one-to-many) 

Categorii-Produse: o categorie poate avea mai multe produse (one-to-many) 

Produse-Cos_cumparaturi: un cos de cumparaturi poate avea unul sau mai multe produse (one-to-many) 

Produse-Comentarii: un produs are unul sau mai mute comentarii(descrieri) (one-to-many) 

Cos_cumparaturi-Comenzi: cu un cos de cumparaturi poti realiza o singura comanda (one-to-one) 

 

 

Diagrama Entitate-Relatie 

 

 

 

 

Diagrama Conceptuala 

 

 

 

Schemele Relationale 

 

User (PK: ID_user, username, parola, data_inreg, tip_user, data_nastere, nr_telefon, nume, prenume) 

Categorii (PK: ID_categorie, nume_categ, FK: ID_admin) 

Produse (PK: ID_produs, nume_prod, pret_prod, descriere_prod, stock_prod, FK1: ID_categorie, FK2: ID_colab) 

Comentarii (PK: ID_comentariu, continut, rating, FK1: ID_user, FK2: ID_produs) 

Cos_cumparaturi (PK: cantitate, FK1: ID_user, FK2: ID_produs, FK3: ID_comanda) 

Comenzi (PK: ID_comanda, data_comanda, tip_plata, adresa_livrare, data_livrare, stadiu_livrare, FK: ID_user) 

 

 

Normalizarea 

 

FN1: 

 

ID_comanda 

tip_plata 

adresa_livrare 

data_livrare 

1 

cash 

Bd. Banul Manta, nr.1  

31.05.2021 

2 

online 

Bd. Magheru, nr. 25 

31.05.2021 

3 

online 

Str. Academiei, nr. 40 

1.06.2021 

4 

cash 

Bd. Banul Manta, nr. 1 

1.06.2021 

 

 

FN2: 

 

ID_comanda 

ID_user 

adresa_livrare 

data_livrare 

1 

10 

Bd. Banul Manta, nr.1 

31.05.2021 

 

2 

11 

Bd. Magheru, nr. 25 

31.05.2021 

 

3 

12 

Str. Academiei, nr. 40 

1.06.2021 

 

4 

10 

Bd. Banul Manta, nr. 1 

1.06.2021 

 

 

ID_user 

username 

10 

octav99 

11 

maria_ioana 

12 

Andi_33 

 

 

FN3: 

 

ID_produs 

nume_produs 

ID_categorie 

ID_colab 

101 

Culegere de matematica 

01 

001 

102 

Parfum pt barbati 

02 

002 

103 

Culegere de romana 

01 

001 

104 

Ceas de perete 

03 

003 

 

ID_categorie 

nume_categ 

01 

Manuale scolare 

02 

Parfumuri 

02 

Ceasuri 

 

ID_colab 

nume 

001 

Editura Sigma 

002 

Versace 

003 

Rolex 

 

 

Creare tabel + inserare date 

 

 

 

 

 

 

 

 

 

 

 

 

Cereri SQL 

 

--Numarul maxim de comentarii pentru cel mai comentat produs dintr-o anumita categorie, data prin nume (sunt tratate si exceptii) 

  

CREATE OR REPLACE FUNCTION CATEG_PROD_COM (nume_categ categorii.nume_categ%type) 

RETURN INTEGER IS 

    TYPE vector IS VARRAY(10) OF NUMBER(4) 

    ID_produs vector; 

    numar NUMBER(4); 

    aux NUMBER (4); 

    categorie_id categorii.categorie_id%type; 

    exista_categoria EXCEPTION; 

    mai_multe_cu_acelasi_nume EXCEPTION; 

    are_produse EXCEPTION; 

    PROD_NU_AU_COM EXCEPTION; 

BEGIN 

    numar := 0; 

    SELECT COUNT(CATEGORIE_NUME)INTO numar 

    FROM categorii 

    WHERE CATEGORIE_NUME = nume_categ; 

     

    IF (numar = 0) THEN RAISE exista_categoria; 

    ELSIF (numar > 1) THEN RAISE mai_multe_cu_acelasi_nume; 

    END IF; 

    numar := 0; 

     

    SELECT ID_categorie INTO id_cat 

    FROM categorii 

    WHERE CATEGORIE_NUME = nume_categ; 

     

    SELECT COUNT(*) INTO numar 

    FROM produse 

    WHERE ID_categorie = categorie_id; 

     

    IF (numar = 0) THEN RAISE are_produse; 

    END IF; 

     

    SELECT ID_produs BULK COLLECT INTO produse_id 

    FROM produse 

    WHERE ID_categorie = categorie_id; 

     

    numar := 0; 

    FOR i IN produse_id.first..produse_id.last LOOP 

        aux := 0; 

        SELECT COUNT(*) INTO aux 

        FROM comentarii 

        WHERE ID_produs = produse_id(i); 

        IF (aux>numar) THEN 

            numar := aux; 

        END IF; 

    END LOOP; 

     

    IF (numar = 0) THEN RAISE PROD_NU_AU_COM 

    END IF; 

     

    RETURN numar; 

     

    EXCEPTION 

        WHEN exista_categoria THEN 

            DBMS_OUTPUT.PUT_LINE('Nu exista categoria cautata.'); 

            RETURN -1; 

        WHEN mai_multe_cu_acelasi_nume THEN 

            DBMS_OUTPUT.PUT_LINE('Exista mai multe categorii cu accest nume.'); 

            RETURN -1; 

        WHEN are_produse THEN 

            DBMS_OUTPUT.PUT_LINE('Categoria ceruta nu are produse.'); 

            RETURN -1; 

        WHEN PROD_NU_AU_COMM THEN 

            DBMS_OUTPUT.PUT_LINE('Niciun produs din categoria ceruta nu are comentarii.'); 

            RETURN -1; 

        END; 

 

 

--Stocheaza si afiseaza toate produsele de pe site care au pretul mai mare decta o valoare data 

  

CREATE OR REPLACE PROCEDURE pret_mai_mare_decat (nr produse.pret_prod%type) 

    IS 

        TYPE tablou_indexat IS TABLE OF produse%ROWTYPE 

            INDEX BY PLS_INTEGER; 

        produse2 tablou_indexat; 

BEGIN 

    SELECT * BULK COLLECT INTO produse2 

    FROM produse 

    WHERE pret_prod > nr 

    ORDER BY pret_prod; 

    FOR i IN produse2.first..produse2.last LOOP 

        IF produse2.exists(i) THEN 

            DBMS_OUTPUT.PUT_LINE(produse2(i).ID_produs||' '||produse2(i).pret_prod); 

        END IF; 

    END LOOP; 

END; 

  

DECLARE 

    nr produse.pret_prod%TYPE := 40; 

BEGIN 

    pret_mai_mare_decat(nr); 

END; 

 

 

 

--13. 

  

CREATE SEQUENCE c 

START WITH 11 

INCREMENT BY 1 

MAXVALUE 100 

NOCYCLE; 

  

INSERT INTO useri VALUES ('c.nextid', 'liviuu22', 'alabala!!', TO_DATE('2021/03/01', 'yyyy/mm/dd'), 'CLIENT', TO_DATE('1999/12/02', 'yyyy/mm/dd'), '0791283475', 'Ungureanu', 'Andrei'); 

  

ALTER TABLE useri 

CHANGE COLUMN ID_user INTO NOT NULL AUTO_INCREMENT; 

  

  

  

  

  

--14. 

  

USE comentarii; 

CREATE VIEW produse_in_detaliu AS 

SELECT p.ID_produs, p.nume_prod, p.pret_prod, cc.cantitate 

FROM produse p 

JOIN cos_cumparaturi cc ON p.ID_produs = p.ID_produs 

  

--LMD permisa  

SELECT * 

FROM produse_in_detaliu 

  

--LMD nepermisa (nu putem insera in view, deoarec nu putem modifica mai multe tabele in acelasi timp) 

INSERT INTO produse_in_detaliu (ID_produs, nume_prod, pret_prod, cantitate) VALUES (2, 'Televizor LED', 99.99, 5); 

 

 

 

18) BCNF, FN4, FN5 

ID_produs 

Nume_produs 

Pret_produs 

10 

Culegere de romana 

29.99 

30 

Masina de spalat 

1299.99 

10 

Culegere de matematica 

29.99 

40 

Telefon 

1599.99 

 

FN4: 

ID_produs 

Nume_produs 

10 

Culegere de romana 

10 

Masina de spalat 

30 

Culegere de matematica 

40 

Telefon 

 

ID_produs 

Pret_produs 

10 

29.99 

10 

29.99 

30 

1299.99 

40 

1599.99 

 

 

FN5: 

Pret_produs 

ID_produs 

29.99 

10 

29.99 

10 

1299.99 

30 

1599.99 

40 

 

ID_produs 

Nume_produs 

10 

Culegere de romana 

10 

Culegere de matematica 

30 

Masina de spalat 

40 

Telefon 

 

Nume_produs 

Pret_produs 

Culegere de romana 

29.99 

Masina de spalat 

1299.99 

Culegere de matematica 

29.99 

Telefon 

1599.99 

 

 

Non-BCNF: 

ID_produs 

Nume_produs 

Pret_produs 

1 

Culegere de romana 

29.99 

2 

Masina de spalat 

1299.99 

3 

Culegere de matematica 

29.99 

4 

Telefon 

1599.99 

 

BCNF: 

ID_produs 

ID_categorie 

1 

1 

2 

2 

3 

1 

4 

4 

 

ID_categorie 

Nume_produs 

Pret_produs 

1 

Culegere de romana 

29.99 

2 

Masina de spalat 

1299.99 

1 

Culegere de matematica 

29.99 

4 

Telefon 

1599.99 

 
