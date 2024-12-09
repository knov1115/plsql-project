CREATE OR REPLACE FUNCTION get_kereskedes_statisztika
RETURN ty_kereskedes_statisztika_l
IS
  -- V�ltoz� az eredm�ny t�rol�s�ra
  eredmeny ty_kereskedes_statisztika_l := ty_kereskedes_statisztika_l();
BEGIN
  -- T�ltse fel az eredm�nyt�bl�t a sz�ks�ges adatokkal
  SELECT ty_kereskedes_statisztika(
           k.nev,
           COUNT(DISTINCT j.id), -- H�ny k�l�nb�z� j�rm�
           j.marka,
           j.tipus,
           SUM(kj.darabszam) -- Teljes darabsz�m �rt�k
         )
  BULK COLLECT INTO eredmeny
  FROM kereskedes k
  JOIN kereskedes_jarmu kj ON k.id = kj.kereskedes_id
  JOIN jarmu j ON j.id = kj.jarmu_id
  GROUP BY k.nev, j.marka, j.tipus;

  -- Eredm�ny visszaad�sa
  RETURN eredmeny;
END get_kereskedes_statisztika;
/



