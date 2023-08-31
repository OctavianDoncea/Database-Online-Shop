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