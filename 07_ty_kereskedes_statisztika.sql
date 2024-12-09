CREATE OR REPLACE TYPE ty_kereskedes_statisztika AS OBJECT
(
  kereskedes_nev                 VARCHAR2(250),
  forgalmazott_jarmu_szam        NUMBER,
  jarmu_marka                    VARCHAR2(250),
  jarmu_tipus                    VARCHAR2(250),
  darabszam_ertek                NUMBER      
)
;
