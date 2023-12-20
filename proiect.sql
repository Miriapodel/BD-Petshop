--EXERCITIUL 10

--Crearea unei secvențe ce va fi utilizată în inserarea înregistrărilor în tabele.

CREATE SEQUENCE GENERARE_ID
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100
CYCLE


--EXERCITIUL 11

-- Crearea tabelelor în SQL și inserarea de date coerente în fiecare dintre acestea
-- (minimum 5 înregistrări în fiecare tabel neasociativ; minimum 10 înregistrări în tabelele asociative).


CREATE TABLE CLIENT
(
    CNP VARCHAR2(25) PRIMARY KEY,
    nume VARCHAR2(25),
    prenume VARCHAR2(25),
    telefon VARCHAR2(25)
)


INSERT INTO CLIENT(CNP, nume, prenume, telefon)
VALUES ('5045189240173', 'Popescu', 'Aurel', '0753982176')

INSERT INTO CLIENT(CNP, nume, prenume, telefon)
VALUES ('5071290436821', 'Ditu', 'Tudor', '0713576892')

INSERT INTO CLIENT(CNP, nume, prenume, telefon)
VALUES ('5073904532267', 'Munteanu', 'Andrei', '0789435218')

INSERT INTO CLIENT(CNP, nume, prenume, telefon)
VALUES ('5072189533204', 'Pangratie', 'Mihai', '0722135879')

INSERT INTO CLIENT(CNP, nume, prenume, telefon)
VALUES ('5099231476852', 'Danciu', 'Alexandru', '0789321556')

--------------------------------------------------------------------------

CREATE TABLE FIRMA_CURIERAT
(
    CUI VARCHAR2(25) PRIMARY KEY,
    nume VARCHAR2(25) NOT NULL,
    tarif NUMBER(5,2) NOT NULL
)


INSERT INTO FIRMA_CURIERAT(CUI, nume, tarif)
VALUES ('6587321', 'Cargus', 12)

INSERT INTO FIRMA_CURIERAT(CUI, nume, tarif)
VALUES ('8714903', 'FAN', 15)

INSERT INTO FIRMA_CURIERAT(CUI, nume, tarif)
VALUES ('9152056', 'Sameday', 11)

INSERT INTO FIRMA_CURIERAT(CUI, nume, tarif)
VALUES ('4824367', 'TNT', 11.5)

INSERT INTO FIRMA_CURIERAT(CUI, nume, tarif)
VALUES ('3874912', 'DHL', 12)


--------------------------------------------------------------------------


CREATE TABLE ANGAJAT
(
 CNP VARCHAR2(25) PRIMARY KEY,
 nume VARCHAR2(25) NOT NULL,
 prenume VARCHAR2(25) NOT NULL,
 salariu FLOAT(5) NOT NULL
)


INSERT INTO ANGAJAT(CNP, nume, prenume, salariu)
VALUES('5079134822190', 'Andreescu', 'Cristian', 2500)

INSERT INTO ANGAJAT(CNP, nume, prenume, salariu)
VALUES('6018732490135', 'Radu', 'Olivia', 2400)

INSERT INTO ANGAJAT(CNP, nume, prenume, salariu)
VALUES('6083267451904', 'Gherghe', 'Mara', 3000)

INSERT INTO ANGAJAT(CNP, nume, prenume, salariu)
VALUES('6037590127352', 'Ciocarlan', 'Carmen', 2900)

INSERT INTO ANGAJAT(CNP, nume, prenume, salariu)
VALUES('5091740237891', 'Barbu', 'Emilian', 3200)


--------------------------------------------------------------------------

CREATE TABLE FURNIZOR
(
    CUI VARCHAR2(25) PRIMARY KEY,
    denumire VARCHAR2(25) NOT NULL
)


INSERT INTO FURNIZOR(CUI, denumire)
VALUES('8467132', 'Faber Impex')

INSERT INTO FURNIZOR(CUI, denumire)
VALUES('7428491', 'VR Services')

INSERT INTO FURNIZOR(CUI, denumire)
VALUES('9142074', 'Play Tech')

INSERT INTO FURNIZOR(CUI, denumire)
VALUES('5619032', 'Zolis')

INSERT INTO FURNIZOR(CUI, denumire)
VALUES('2274516', 'Venus')


--------------------------------------------------------------------------


CREATE TABLE REDUCERE
(   ID_reducere INT PRIMARY KEY,
    procent INTEGER NOT NULL,
    categorie VARCHAR2(25) NOT NULL,
    valabilitate DATE NOT NULL
)


INSERT INTO REDUCERE(ID_reducere, procent, categorie, valabilitate)
VALUES(52891, 25, 'Mancare', '20-MAY-23')

INSERT INTO REDUCERE(ID_reducere, procent, categorie, valabilitate)
VALUES(83672, 15, 'Jucarii', '25-AUG-23')

INSERT INTO REDUCERE(ID_reducere, procent, categorie, valabilitate)
VALUES(11129, 20, 'Haine', '2-JUL-23')

INSERT INTO REDUCERE(ID_reducere, procent, categorie, valabilitate)
VALUES(27143, 10, 'Suplimente', '1-JUN-23')

INSERT INTO REDUCERE(ID_reducere, procent, categorie, valabilitate)
VALUES(47189, 30, 'Ingrijire', '5-SEP-23')


--------------------------------------------------------------------------


CREATE TABLE ADRESA
(
    id_adresa INTEGER PRIMARY KEY,
    strada VARCHAR2(25) NOT NULL,
    numar_strada VARCHAR2(25) NOT NULL,
    bloc VARCHAR2(10),
    numar_locuinta INTEGER,
    cladire VARCHAR2(25),
    CUI_curierat VARCHAR2(25),
    FOREIGN KEY(CUI_curierat) REFERENCES FIRMA_CURIERAT(CUI),
    CNP_client VARCHAR2(25),
    FOREIGN KEY (CNP_client) REFERENCES CLIENT(CNP),
    CUI_furnizor VARCHAR2(25),
    FOREIGN KEY (CUI_furnizor) REFERENCES FURNIZOR(CUI)
)


INSERT INTO ADRESA(id_adresa, strada, numar_strada, bloc, numar_locuinta, CNP_client)
VALUES(58912, 'Raului', 58, '1C', 5, '5045189240173')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, bloc, numar_locuinta, CNP_client)
VALUES(75439, 'Fantanele', 55, 'B6', 64, '5071290436821')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, bloc, numar_locuinta, CNP_client)
VALUES(37891, 'Augustin Ion', 19, '4A', 81, '5073904532267')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, bloc, numar_locuinta, CNP_client)
VALUES(17903, 'Calea Feldioarei', 18, '3D', 10, '5072189533204')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, cladire, CUI_furnizor)
VALUES(49872, 'Artarilor', 2, '5B' ,'8467132')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, cladire, CUI_furnizor)
VALUES(90657, 'Bisericii', 16, '9B', '7428491')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, cladire, CUI_furnizor)
VALUES(89326, 'Apateului', 7, '7C' ,'9142074')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, cladire, CUI_furnizor)
VALUES(27912, 'Stefanesti', 23, '1A', '5619032')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, cladire, CUI_furnizor)
VALUES(55689, 'I.L. Caragiale', 15, '3E' ,'8467132')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, cladire, CUI_curierat)
VALUES(89102, 'Lalelelor', 1, '11F' ,'6587321')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, cladire, CUI_curierat)
VALUES(53901, 'T. Vladimirescu', 104, '4G', '8714903')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, cladire, CUI_curierat)
VALUES(42653, 'Vitan', 106, '3C' ,'9152056')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, cladire, CUI_curierat)
VALUES(19478, 'Cicero', 21, '5D', '4824367')

INSERT INTO ADRESA(id_adresa, strada, numar_strada, cladire, CUI_curierat)
VALUES(66729, 'Marasesti', 18, '7F' ,'3874912')

--------------------------------------------------------------------------------


CREATE TABLE CARD
(
    numar_card VARCHAR2(25) PRIMARY KEY,
    data_expirare DATE NOT NULL,
    CVV VARCHAR2(5) NOT NULL,
    CNP_client VARCHAR2(25),
    FOREIGN KEY (CNP_client) REFERENCES CLIENT(CNP)
)


INSERT INTO CARD(numar_card, data_expirare, CVV, CNP_client)
VALUES('3478519479351904', '13-JAN-27', '813', '5045189240173')

INSERT INTO CARD(numar_card, data_expirare, CVV, CNP_client)
VALUES('6184290573897510', '15-APR-30', '540', '5045189240173')

INSERT INTO CARD(numar_card, data_expirare, CVV, CNP_client)
VALUES('5019562957463277', '2-JUL-25', '901', '5073904532267')

INSERT INTO CARD(numar_card, data_expirare, CVV, CNP_client)
VALUES('1904278592045322', '25-AUG-24', '513', '5073904532267')

INSERT INTO CARD(numar_card, data_expirare, CVV, CNP_client)
VALUES('9058312789456731', '5-OCT-28', '291', '5099231476852')


-----------------------------------------------------------------------------------


CREATE TABLE COS
(
    ID_cos INT PRIMARY KEY,
    CNP_client VARCHAR2(25),
    FOREIGN KEY (CNP_client) REFERENCES CLIENT(CNP)
)


INSERT INTO COS(ID_cos, CNP_client)
VALUES(84716, '5045189240173')

INSERT INTO COS(ID_cos, CNP_client)
VALUES(29013, '5071290436821')

INSERT INTO COS(ID_cos, CNP_client)
VALUES(87902, '5073904532267')

INSERT INTO COS(ID_cos, CNP_client)
VALUES(41523, '5072189533204')

INSERT INTO COS(ID_cos, CNP_client)
VALUES(78139, '5099231476852')


-------------------------------------------------------------------------------------------


CREATE TABLE COMANDA
(
    ID_comanda INT PRIMARY KEY,
    data DATE NOT NULL,
    CNP_client VARCHAR2(25),
    FOREIGN KEY (CNP_client) REFERENCES CLIENT(CNP),
    numar_card VARCHAR2(25),
    FOREIGN KEY (numar_card) REFERENCES CARD(numar_card),
    CUI_curierat VARCHAR2(25),
    FOREIGN KEY (CUI_curierat) REFERENCES FIRMA_CURIERAT(CUI)
)


INSERT INTO COMANDA(ID_comanda, data, CNP_client, CUI_curierat, numar_card)
VALUES(43901, '14-APR-23', '5099231476852', '4824367', '9058312789456731')

INSERT INTO COMANDA(ID_comanda, data, CNP_client, CUI_curierat)
VALUES(61843, '12-MAY-23', '5071290436821', '9152056')

INSERT INTO COMANDA(ID_comanda, data, CNP_client, CUI_curierat)
VALUES(23315, '13-OCT-23', '5071290436821', '8714903')

INSERT INTO COMANDA(ID_comanda, data, CNP_client, CUI_curierat)
VALUES(49012, '20-JUL-23', '5072189533204', '6587321')


INSERT INTO COMANDA(ID_comanda, data, CNP_client, CUI_curierat)
VALUES(35871, '3-NOV-23', '5072189533204', '4824367')

INSERT INTO COMANDA(ID_comanda, data, CNP_client, CUI_curierat)
VALUES(22478, '2-DEC-23', '5072189533204', '3874912')

INSERT INTO COMANDA(ID_comanda, data, CNP_client, CUI_curierat, numar_card)
VALUES(89436, '15-JUN-23', '5045189240173', '6587321', '3478519479351904')

INSERT INTO COMANDA(ID_comanda, data, CNP_client, CUI_curierat, numar_card)
VALUES(71392, '3-JUL-23', '5099231476852', '8714903', '9058312789456731')

INSERT INTO COMANDA(ID_comanda, data, CNP_client, CUI_curierat)
VALUES(90548, '5-JUL-23', '5045189240173', '9152056')

INSERT INTO COMANDA(ID_comanda, data, CNP_client, CUI_curierat)
VALUES(24671, '8-AUG-23', '5071290436821', '4824367')

INSERT INTO COMANDA(ID_comanda, data, CNP_client, CUI_curierat, numar_card)
VALUES(78120, '23-SEP-23', '5073904532267', '3874912', '1904278592045322')


-------------------------------------------------------------------------------------------------------


CREATE TABLE FACTURA
(
    ID_factura INT PRIMARY KEY,
    ID_comanda INT,
    FOREIGN KEY (ID_comanda) REFERENCES COMANDA(ID_comanda),
    suma NUMBER(5,2) NOT NULL
)


INSERT INTO FACTURA(ID_factura, ID_comanda, suma)
VALUES(GENERARE_ID.nextval, 23315, (select sum(round(pret - (pret *  (CASE
                                  WHEN EXISTS(SELECT *
                                              FROM COMANDA_REDUCERE CR2
                                              JOIN REDUCERE R2 on CR2.ID_reducere = R2.ID_reducere
                                              WHERE CR2.ID_comanda = pc.ID_comanda AND R2.categorie = P.categorie AND R2.valabilitate >= (SELECT DATA FROM COMANDA WHERE COMANDA.ID_comanda = '23315'))
                                  THEN (SELECT PROCENT FROM REDUCERE r WHERE r.categorie = p.categorie)
                                  ELSE 0
                                  END)) / 100, 2)) as suma
from PRODUS_COMANDA pc
join PRODUS p on p.cod_produs = pc.cod_produs
where pc.ID_comanda = '23315'
) )

INSERT INTO FACTURA(ID_factura, ID_comanda, suma)
VALUES(GENERARE_ID.nextval, 24671,(SELECT sum(round(pret - (pret *  (CASE
                                  WHEN EXISTS(SELECT *
                                              FROM COMANDA_REDUCERE CR2
                                              JOIN REDUCERE R2 on CR2.ID_reducere = R2.ID_reducere
                                              WHERE CR2.ID_comanda = pc.ID_comanda AND R2.categorie = P.categorie AND R2.valabilitate >= (SELECT DATA FROM COMANDA WHERE COMANDA.ID_comanda = '24671'))
                                  THEN (SELECT PROCENT FROM REDUCERE r WHERE r.categorie = p.categorie)
                                  ELSE 0
                                  END)) / 100, 2)) as suma
FROM PRODUS_COMANDA pc
JOIN PRODUS p on p.cod_produs = pc.cod_produs
WHERE pc.ID_comanda = '24671'))

INSERT INTO FACTURA(ID_factura, ID_comanda, suma)
VALUES(GENERARE_ID.nextval, 35871,(SELECT sum(round(pret - (pret *  (CASE
                                  WHEN EXISTS(SELECT *
                                              FROM COMANDA_REDUCERE CR2
                                              JOIN REDUCERE R2 on CR2.ID_reducere = R2.ID_reducere
                                              WHERE CR2.ID_comanda = pc.ID_comanda AND R2.categorie = P.categorie AND R2.valabilitate >= (SELECT DATA FROM COMANDA WHERE COMANDA.ID_comanda = '35871'))
                                  THEN (SELECT PROCENT FROM REDUCERE r WHERE r.categorie = p.categorie)
                                  ELSE 0
                                  END)) / 100, 2)) as suma
FROM PRODUS_COMANDA pc
JOIN PRODUS p on p.cod_produs = pc.cod_produs
WHERE pc.ID_comanda = '35871'))

INSERT INTO FACTURA(ID_factura, ID_comanda, suma)
VALUES(GENERARE_ID.nextval, 43901,(SELECT sum(round(pret - (pret *  (CASE
                                  WHEN EXISTS(SELECT *
                                              FROM COMANDA_REDUCERE CR2
                                              JOIN REDUCERE R2 on CR2.ID_reducere = R2.ID_reducere
                                              WHERE CR2.ID_comanda = pc.ID_comanda AND R2.categorie = P.categorie AND R2.valabilitate >= (SELECT DATA FROM COMANDA WHERE COMANDA.ID_comanda = '43901'))
                                  THEN (SELECT PROCENT FROM REDUCERE r WHERE r.categorie = p.categorie)
                                  ELSE 0
                                  END)) / 100, 2)) as suma
FROM PRODUS_COMANDA pc
JOIN PRODUS p on p.cod_produs = pc.cod_produs
WHERE pc.ID_comanda = '43901'))

INSERT INTO FACTURA(ID_factura, ID_comanda, suma)
VALUES(GENERARE_ID.nextval, 49012,(SELECT sum(round(pret - (pret *  (CASE
                                  WHEN EXISTS(SELECT *
                                              FROM COMANDA_REDUCERE CR2
                                              JOIN REDUCERE R2 on CR2.ID_reducere = R2.ID_reducere
                                              WHERE CR2.ID_comanda = pc.ID_comanda AND R2.categorie = P.categorie AND R2.valabilitate >= (SELECT DATA FROM COMANDA WHERE COMANDA.ID_comanda = '49012'))
                                  THEN (SELECT PROCENT FROM REDUCERE r WHERE r.categorie = p.categorie)
                                  ELSE 0
                                  END)) / 100, 2)) as suma
FROM PRODUS_COMANDA pc
JOIN PRODUS p on p.cod_produs = pc.cod_produs
WHERE pc.ID_comanda = '49012'))

INSERT INTO FACTURA(ID_factura, ID_comanda, suma)
VALUES(GENERARE_ID.nextval, 61843,(SELECT sum(round(pret - (pret *  (CASE
                                  WHEN EXISTS(SELECT *
                                              FROM COMANDA_REDUCERE CR2
                                              JOIN REDUCERE R2 on CR2.ID_reducere = R2.ID_reducere
                                              WHERE CR2.ID_comanda = pc.ID_comanda AND R2.categorie = P.categorie AND R2.valabilitate >= (SELECT DATA FROM COMANDA WHERE COMANDA.ID_comanda = '61843'))
                                  THEN (SELECT PROCENT FROM REDUCERE r WHERE r.categorie = p.categorie)
                                  ELSE 0
                                  END)) / 100, 2)) as suma
FROM PRODUS_COMANDA pc
JOIN PRODUS p on p.cod_produs = pc.cod_produs
WHERE pc.ID_comanda = '61843'))

INSERT INTO FACTURA(ID_factura, ID_comanda, suma)
VALUES(GENERARE_ID.nextval, 71392,(SELECT sum(round(pret - (pret *  (CASE
                                  WHEN EXISTS(SELECT *
                                              FROM COMANDA_REDUCERE CR2
                                              JOIN REDUCERE R2 on CR2.ID_reducere = R2.ID_reducere
                                              WHERE CR2.ID_comanda = pc.ID_comanda AND R2.categorie = P.categorie AND R2.valabilitate >= (SELECT DATA FROM COMANDA WHERE COMANDA.ID_comanda = '71392'))
                                  THEN (SELECT PROCENT FROM REDUCERE r WHERE r.categorie = p.categorie)
                                  ELSE 0
                                  END)) / 100, 2)) as suma
FROM PRODUS_COMANDA pc
JOIN PRODUS p on p.cod_produs = pc.cod_produs
WHERE pc.ID_comanda = '71392'))

INSERT INTO FACTURA(ID_factura, ID_comanda, suma)
VALUES(GENERARE_ID.nextval, 78120,(SELECT sum(round(pret - (pret *  (CASE
                                  WHEN EXISTS(SELECT *
                                              FROM COMANDA_REDUCERE CR2
                                              JOIN REDUCERE R2 on CR2.ID_reducere = R2.ID_reducere
                                              WHERE CR2.ID_comanda = pc.ID_comanda AND R2.categorie = P.categorie AND R2.valabilitate >= (SELECT DATA FROM COMANDA WHERE COMANDA.ID_comanda = '78120'))
                                  THEN (SELECT PROCENT FROM REDUCERE r WHERE r.categorie = p.categorie)
                                  ELSE 0
                                  END)) / 100, 2)) as suma
FROM PRODUS_COMANDA pc
JOIN PRODUS p on p.cod_produs = pc.cod_produs
WHERE pc.ID_comanda = '78120'))

INSERT INTO FACTURA(ID_factura, ID_comanda, suma)
VALUES(GENERARE_ID.nextval, 89436,(SELECT sum(round(pret - (pret *  (CASE
                                  WHEN EXISTS(SELECT *
                                              FROM COMANDA_REDUCERE CR2
                                              JOIN REDUCERE R2 on CR2.ID_reducere = R2.ID_reducere
                                              WHERE CR2.ID_comanda = pc.ID_comanda AND R2.categorie = P.categorie AND R2.valabilitate >= (SELECT DATA FROM COMANDA WHERE COMANDA.ID_comanda = '89436'))
                                  THEN (SELECT PROCENT FROM REDUCERE r WHERE r.categorie = p.categorie)
                                  ELSE 0
                                  END)) / 100, 2)) as suma
FROM PRODUS_COMANDA pc
JOIN PRODUS p on p.cod_produs = pc.cod_produs
WHERE pc.ID_comanda = '89436'))

INSERT INTO FACTURA(ID_factura, ID_comanda, suma)
VALUES(GENERARE_ID.nextval, 90548,(SELECT sum(round(pret - (pret *  (CASE
                                  WHEN EXISTS(SELECT *
                                              FROM COMANDA_REDUCERE CR2
                                              JOIN REDUCERE R2 on CR2.ID_reducere = R2.ID_reducere
                                              WHERE CR2.ID_comanda = pc.ID_comanda AND R2.categorie = P.categorie AND R2.valabilitate >= (SELECT DATA FROM COMANDA WHERE COMANDA.ID_comanda = '90548'))
                                  THEN (SELECT PROCENT FROM REDUCERE r WHERE r.categorie = p.categorie)
                                  ELSE 0
                                  END)) / 100, 2)) as suma
FROM PRODUS_COMANDA pc
JOIN PRODUS p on p.cod_produs = pc.cod_produs
WHERE pc.ID_comanda = '90548'))

INSERT INTO FACTURA(ID_factura, ID_comanda, suma)
VALUES(GENERARE_ID.nextval, 22478,(SELECT sum(round(pret - (pret *  (CASE
                                  WHEN EXISTS(SELECT *
                                              FROM COMANDA_REDUCERE CR2
                                              JOIN REDUCERE R2 on CR2.ID_reducere = R2.ID_reducere
                                              WHERE CR2.ID_comanda = pc.ID_comanda AND R2.categorie = P.categorie AND R2.valabilitate >= (SELECT DATA FROM COMANDA WHERE COMANDA.ID_comanda = '22478'))
                                  THEN (SELECT PROCENT FROM REDUCERE r WHERE r.categorie = p.categorie)
                                  ELSE 0
                                  END)) / 100, 2)) as suma
FROM PRODUS_COMANDA pc
JOIN PRODUS p on p.cod_produs = pc.cod_produs
WHERE pc.ID_comanda = '22478'))


------------------------------------------------------------------------------------------------------------

CREATE TABLE PRODUS
(
    cod_produs VARCHAR2(25) PRIMARY KEY,
    denumire VARCHAR2(25) NOT NULL,
    pret NUMBER(5,2) NOT NULL,
    categorie VARCHAR2(25) NOT NULL,
    descriere VARCHAR2(50) NOT NULL,
    CUI_furnizor VARCHAR2(25),
    FOREIGN KEY (CUI_furnizor) REFERENCES FURNIZOR(CUI)
)


INSERT INTO PRODUS(cod_produs, denumire, pret, categorie, descriere, CUI_furnizor)
VALUES('101332', 'Fan Padovan', 15.99, 'Mancare', 'Fan pentru rozatoare Padovan 1KG', '8467132')

INSERT INTO PRODUS(cod_produs, denumire, pret, categorie, descriere, CUI_furnizor)
VALUES('132173', 'Tunel cu fan', 43.99, 'Hrana', 'Tunel cu fan pentru rozatoare Jr Farm 200 g', '7428491')

INSERT INTO PRODUS(cod_produs, denumire, pret, categorie, descriere, CUI_furnizor)
VALUES('128901', 'Minge impletita', 15.99, 'Jucarii', 'Jucaria pentru rozatoare Beeztees Minge Impletita', '9142074')

INSERT INTO PRODUS(cod_produs, denumire, pret, categorie, descriere, CUI_furnizor)
VALUES('133263', 'Roata cu recompense', 28.99, 'Jucarii', 'Roata din lemn cu recompense pentru rozatoare', '5619032')

INSERT INTO PRODUS(cod_produs, denumire, pret, categorie, descriere, CUI_furnizor)
VALUES('100107', 'Aspirator cu pompa', 26.99, 'Ingrijire', 'Aspirator cu pompa pentru acvariu Acti Zoo', '2274516')


-------------------------------------------------------------------------------------------


CREATE TABLE RECENZIE
(
    ID_recenzie INT PRIMARY KEY,
    rating INT NOT NULL,
    descriere VARCHAR2(50) NOT NULL,
    ID_comanda INT,
    FOREIGN KEY (ID_comanda) REFERENCES COMANDA(ID_comanda)
)


INSERT INTO RECENZIE(ID_recenzie, rating, descriere, ID_comanda)
VALUES(78452, 4, 'A intarziat 2 zile', 89436)

INSERT INTO RECENZIE(ID_recenzie, rating, descriere, ID_comanda)
VALUES(43189, 2, 'A lipsit un produs din comanda', 23315)

INSERT INTO RECENZIE(ID_recenzie, rating, descriere, ID_comanda)
VALUES(81523, 5, 'Excelent!', '71392')

INSERT INTO RECENZIE(ID_recenzie, rating, descriere, ID_comanda)
VALUES(91437, 3, 'Comanda a venit deteriorata.', 90548)

INSERT INTO RECENZIE(ID_recenzie, rating, descriere, ID_comanda)
VALUES(57192, 5, 'Produsele sunt mai bune decat credeam', 24671)

INSERT INTO RECENZIE(ID_recenzie, rating, descriere, ID_comanda)
VALUES(39471, 4, 'Produsele pareau mai mari in poze', 78120)

INSERT INTO RECENZIE(ID_recenzie, rating, descriere, ID_comanda)
VALUES(98012, 5, 'Animalutul meu le iubeste', 22478)

--------------------------------------------------------------------------------------------------------------


CREATE TABLE ANGAJAT_COMANDA
(
    ID_comanda INT,
    FOREIGN KEY (ID_comanda) REFERENCES COMANDA(ID_comanda),
    CNP_ang VARCHAR2(25),
    FOREIGN KEY (CNP_ang) REFERENCES ANGAJAT(CNP),
    PRIMARY KEY (ID_comanda, CNP_ang)
)


INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES(43901, '6037590127352')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES(43901, '5091740237891')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES(61843, '6037590127352')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES(61843, '6083267451904')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES(23315, '5079134822190')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES(22478, '6018732490135')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES(49012, '6037590127352')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES(35871, '5091740237891')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES('89436', '5079134822190')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES('89436', '6018732490135')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES('71392', '6018732490135')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES('90548', '6083267451904')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES('90548', '6037590127352')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES('90548', '5091740237891')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES('24671', '5079134822190')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES('24671', '5091740237891')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES('78120', '6083267451904')

INSERT INTO ANGAJAT_COMANDA(ID_comanda, CNP_ang)
VALUES('78120', '6037590127352')

--------------------------------------------------------------------------------------------------

CREATE TABLE COS_PRODUS
(
    ID_cos INT,
    FOREIGN KEY (ID_cos) REFERENCES COS(ID_cos),
    cod_produs VARCHAR2(25),
    FOREIGN KEY (cod_produs) REFERENCES PRODUS(cod_produs),
    PRIMARY KEY (ID_cos, cod_produs)
)


INSERT INTO COS_PRODUS(ID_cos, cod_produs)
VALUES('84716', '101332')

INSERT INTO COS_PRODUS(ID_cos, cod_produs)
VALUES('84716', '132173')

INSERT INTO COS_PRODUS(ID_cos, cod_produs)
VALUES('84716', '128901')

INSERT INTO COS_PRODUS(ID_cos, cod_produs)
VALUES('84716', '133263')

INSERT INTO COS_PRODUS(ID_cos, cod_produs)
VALUES('29013', '100107')

INSERT INTO COS_PRODUS(ID_cos, cod_produs)
VALUES('29013', '132173')

INSERT INTO COS_PRODUS(ID_cos, cod_produs)
VALUES('87902', '128901')

INSERT INTO COS_PRODUS(ID_cos, cod_produs)
VALUES('87902', '133263')

INSERT INTO COS_PRODUS(ID_cos, cod_produs)
VALUES('87902', '100107')

INSERT INTO COS_PRODUS(ID_cos, cod_produs)
VALUES('41523', '132173')

--------------------------------------------------------------------------------------------------

CREATE TABLE PRODUS_COMANDA
(
    cod_produs VARCHAR2(25),
    FOREIGN KEY (cod_produs) REFERENCES PRODUS(cod_produs),
    ID_comanda INT,
    FOREIGN KEY (ID_comanda) REFERENCES COMANDA(ID_comanda),
    PRIMARY KEY (cod_produs, ID_comanda)
)


INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES(43901, '133263')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES(43901, '128901')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES(61843, '101332')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES(61843, '132173')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES(61843, '100107')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES(23315, '128901')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES(23315, '133263')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES(22478, '101332')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES(49012, '133263')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES(35871, '100107')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES('24671', '101332')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES('24671', '132173')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES('24671', '128901')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES('71392', '128901')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES('78120', '133263')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES('78120', '100107')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES('78120', '101332')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES('89436', '133263')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES('89436', '132173')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES('90548', '100107')

INSERT INTO PRODUS_COMANDA(ID_comanda, cod_produs)
VALUES('90548', '133263')



--------------------------------------------------------------------------------------------------------

CREATE TABLE COMANDA_REDUCERE
(
    ID_comanda INT,
    FOREIGN KEY (ID_comanda) REFERENCES COMANDA(ID_comanda),
    ID_reducere INT,
    FOREIGN KEY (ID_reducere) REFERENCES REDUCERE(ID_reducere),
    PRIMARY KEY (ID_comanda, ID_reducere)
)


INSERT INTO COMANDA_REDUCERE(ID_comanda, ID_reducere)
VALUES(23315, 52891)

INSERT INTO COMANDA_REDUCERE(ID_comanda, ID_reducere)
VALUES(23315, 83672)

INSERT INTO COMANDA_REDUCERE(ID_comanda, ID_reducere)
VALUES(24671, 52891)

INSERT INTO COMANDA_REDUCERE(ID_comanda, ID_reducere)
VALUES(35871, 47189)

INSERT INTO COMANDA_REDUCERE(ID_comanda, ID_reducere)
VALUES(61843, 52891)

INSERT INTO COMANDA_REDUCERE(ID_comanda, ID_reducere)
VALUES(61843, 47189)

INSERT INTO COMANDA_REDUCERE(ID_comanda, ID_reducere)
VALUES(78120, 83672)

INSERT INTO COMANDA_REDUCERE(ID_comanda, ID_reducere)
VALUES(78120, 52891)

INSERT INTO COMANDA_REDUCERE(ID_comanda, ID_reducere)
VALUES(89436, 52891)

INSERT INTO COMANDA_REDUCERE(ID_comanda, ID_reducere)
VALUES(90548, 47189)

-----------------------------------------------------------------------------------------------------------------



--------------------

--EXERCITIUL 12

-- ADRESELE CLIENTILOR CARE AU PLASAT COMENZI CU CEL PUTIN 2 PRODUSE, CARE CONTIN CEL PUTIN O LITERA L

--ELEMENTE UTILIZATE: grupări de date cu subcereri nesincronizate in care intervin 3 tabele, funcții grup,
-- filtrare la nivel de grupuri, clauza WITH, o functie pe siruri de caractere

WITH VALORI AS (
    SELECT CNP
    FROM CLIENT C
        JOIN COMANDA CO ON CO.CNP_client = C.CNP
        JOIN PRODUS_COMANDA PC on CO.ID_comanda = PC.ID_comanda
        GROUP BY C.CNP, CO.ID_comanda
        HAVING  COUNT(cod_produs) >= 3
)
SELECT *
FROM ADRESA A
WHERE A.CNP_client IN
(SELECT DISTINCT CNP FROM VALORI) AND UPPER(A.STRADA) LIKE '%L%'

--------------------

-- PRODUSELE CARE AU FOST IN COMENZI IN VALOARE DE PESTE 40 LEI SI CARE CONTIN FAN

--ELEMENTE UTILIZATE: subcereri sincronizate în care intervin 3 tabele, 2 functii pe siruri de caractere,

SELECT DENUMIRE
FROM PRODUS P
WHERE (
    SELECT MAX(F.SUMA)
    FROM PRODUS_COMANDA PR
    JOIN COMANDA C ON C.ID_COMANDA = PR.ID_COMANDA
    JOIN FACTURA F ON F.ID_COMANDA = C.ID_COMANDA
    WHERE PR.COD_PRODUS = P.COD_PRODUS
          ) >= 50 AND INSTR(UPPER(DENUMIRE), 'FAN') != 0

--------------------------------

--CLINETII CARE AU PLASAT COMENZI LA MAI PUTIN DE 6 LUNI DE LA TERMINAREA ANULUI 2023, IN ULTIMA ZI A LUNII

--ELEMENTE UTILIZATE: subcereri nesincronizate in clauza FROM, doua functii pe date calendaristice

SELECT C.nume, C.prenume
FROM (SELECT ID_comanda, CNP_client
    FROM COMANDA
    WHERE LAST_DAY(DATA) = DATA AND MONTHS_BETWEEN(data, '31-DEC-23') <= 6
    ) S
JOIN CLIENT C ON C.CNP = S.CNP_client

-------------------------------------------------

--COMENZILE SI MODALITATEA DE PLATA CU CARE AU FOST ACHITATE, ORDONATE DUPA DATA PLASARII(NLD, DECODE, ORDONARE)

--ELEMENTE UTILIZATE: NVL, DECODE, ordonare

SELECT ID_comanda, DECODE(0, NVL(numar_card, 0), 'PLATA CASH', 'PLATA CU CARDUL') AS PLATA
FROM COMANDA
ORDER BY COMANDA.data

-------------------------------------------------------

--FIECARE ANGAJAT AL MAGAZINULUI SI NIVELUL DE EXPERIENTA
-- ( SE RAPORTEAZA LA SALARIU -> JUNIOR = SALARIU < 2500, MID = 2500 <= SALARIU < 3000 , SENIOR = 3000 <= SALARIU)

--ELEMENTE UTILIZATE: CASE

SELECT NUME, PRENUME, (CASE
                       WHEN SALARIU < 2500
                       THEN 'JUNIOR'
                       WHEN 2500 <= SALARIU AND SALARIU < 3000
                       THEN 'MIDDLE'
                       WHEN SALARIU >= 3000
                       THEN 'SENIOR'
                       END) EXPERIENTA, SALARIU
FROM ANGAJAT


-------------------------------------------------------------------------------

--EXERCITIUL 13

--Sa se mareasca cu 5 pretul celor mai ieftine produse din magazin

UPDATE PRODUS
SET PRET = PRET + 5
WHERE PRET = (SELECT MIN(PRET) FROM PRODUS)

-------------------------------------------------------------------------------------

--Sa se adauge tariful pe transport comenzilor care nu depasesc ca suma media valorilor comenzilor

UPDATE FACTURA F
SET F.SUMA = F.SUMA + (SELECT TARIF FROM FIRMA_CURIERAT WHERE CUI = (SELECT CUI_curierat
                                                                     FROM FACTURA F2
                                                                     JOIN COMANDA C2 on F2.ID_comanda = C2.ID_comanda
                                                                     WHERE F2.ID_comanda = F.ID_comanda))
WHERE F.SUMA <= (SELECT AVG(SUMA) FROM FACTURA)

--------------------------------------------------------------------------------------------------

--Sa se mareasca salariul angajatului cu cel mai mic salariu cu 200 de lei

UPDATE ANGAJAT
SET SALARIU = SALARIU + 200
WHERE SALARIU = (SELECT MIN(SALARIU) FROM ANGAJAT)

---------------------------------------------------------------------------------------------------

--Sa se stearga cardurile care nu au fost folosite in nicio comanda

DELETE FROM CARD
WHERE NUMAR_CARD NOT IN (SELECT DISTINCT NUMAR_CARD FROM COMANDA)

-----------------------------------------------------------------------------------------------------

--Sa se stearga reducerile care expira pana in iulie si care nu au fost folosite

DELETE FROM REDUCERE
WHERE valabilitate < '1-JUL-23' AND ID_reducere NOT IN (SELECT DISTINCT ID_REDUCERE
                                                        FROM COMANDA_REDUCERE)

--------------------------------------------------------------------------------

--Sa se stearga cele mai vechi recenzii

DELETE FROM RECENZIE R
WHERE (SELECT DATA FROM COMANDA C WHERE C.ID_comanda = R.ID_comanda) = (SELECT MIN(DATA) FROM RECENZIE R2 JOIN COMANDA C2 on R2.ID_comanda = C2.ID_comanda)

---------------------------------------------------------------------------------