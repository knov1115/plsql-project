CREATE VIEW adatok AS
SELECT jarmu.marka AS jarmu_marka,
       jarmu.tipus AS jarmu_tipus,
       kereskedes.nev AS kereskedes_nev,
       kereskedes_jarmu.ar AS ar,
       MIN(kereskedes_jarmu.ar) OVER (PARTITION BY jarmu.marka, jarmu.tipus) AS legkisebb_ar
FROM 
    jarmu
JOIN 
    kereskedes_jarmu ON jarmu.id = kereskedes_jarmu.jarmu_id
JOIN
    kereskedes ON kereskedes.id = kereskedes_jarmu.kereskedes_id;
    
    SELECT * FROM kereskedes;
    SELECT * FROM jarmu;
    SELECT * FROM kereskedes_jarmu;
    
    DROP VIEW adatok;
    
    DELETE FROM kereskedes;
    DELETE FROM jarmu;
    DELETE FROM kereskedes_jarmu;
    
 --TESZTELÉS
 SELECT k.id FROM kereskedes k WHERE k.nev = 'Kis kereskedés';
 SELECT t.id FROM jarmu t WHERE t.marka = 'Opel';

 
 SELECT * FROM adatok;
