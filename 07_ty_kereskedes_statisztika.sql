CREATE OR REPLACE TYPE ty_kereskedes_statisztika AS OBJECT
(
  kereskedes_nev                 VARCHAR2(250),
  forgalmazott_jarmu_szam        NUMBER,
  jarmu_marka                    VARCHAR2(250),
  jarmu_tipus                    VARCHAR2(250),
  darabszam_ertek                NUMBER      
)
;

--ELLENŐRZÉS
SELECT type_name, type_oid
FROM user_types
WHERE type_name = 'TY_KERESKEDES_STATISZTIKA';
