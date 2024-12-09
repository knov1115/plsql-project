CREATE SEQUENCE kereskedes_seq
START WITH 15400;

CREATE SEQUENCE jarmu_seq
START WITH 5000;

CREATE SEQUENCE kereskedes_jarmu_seq
START WITH 100000;

--szekvenci�k ellen�rz�se
SELECT * FROM USER_SEQUENCES;

-- CREATE TABLES

CREATE TABLE kereskedes (
       id NUMBER PRIMARY KEY,
       nev VARCHAR(250) NOT NULL,
       cim VARCHAR(500) NOT NULL
)tablespace users;

CREATE TABLE jarmu (
       id NUMBER PRIMARY KEY,
       marka VARCHAR(250) NOT NULL,
       tipus VARCHAR(250) NOT NULL,
       leiras VARCHAR(4000)
)tablespace users;

CREATE TABLE kereskedes_jarmu (
       id NUMBER PRIMARY KEY,
       kereskedes_id NUMBER NOT NULL,
       jarmu_id NUMBER NOT NULL,
       ar NUMBER NOT NULL,
       darabszam NUMBER NOT NULL
)tablespace users;

-- T�BLA TESZTEL�S
SELECT * FROM user_tables;

--FOREIGN KEY be�ll�t�s

ALTER TABLE kereskedes_jarmu
ADD CONSTRAINTS fk_kereskedes
FOREIGN KEY (kereskedes_id)
REFERENCES kereskedes (id);

ALTER TABLE kereskedes_jarmu
ADD CONSTRAINTS fk_jarmu
FOREIGN KEY (kereskedes_id)
REFERENCES jarmu (id);

ALTER TABLE kereskedes_jarmu
ADD CONSTRAINTS egyedi_kereskedes_jarmu UNIQUE (kereskedes_id, jarmu_id);

--ELLEN�RZ�S

select * from kereskedes;
select * from jarmu;
select * from kereskedes_jarmu;
