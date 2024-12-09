CREATE OR REPLACE FUNCTION get_kereskedes_statisztika
RETURN ty_kereskedes_statisztika_l
IS
  -- Változó az eredmény tárolására
  eredmeny ty_kereskedes_statisztika_l := ty_kereskedes_statisztika_l();
BEGIN
  -- Töltse fel az eredménytáblát a szükséges adatokkal
  SELECT ty_kereskedes_statisztika(
           k.nev,
           COUNT(DISTINCT j.id), -- Hány különbözõ jármû
           j.marka,
           j.tipus,
           SUM(kj.darabszam) -- Teljes darabszám érték
         )
  BULK COLLECT INTO eredmeny
  FROM kereskedes k
  JOIN kereskedes_jarmu kj ON k.id = kj.kereskedes_id
  JOIN jarmu j ON j.id = kj.jarmu_id
  GROUP BY k.nev, j.marka, j.tipus;

  -- Eredmény visszaadása
  RETURN eredmeny;
END get_kereskedes_statisztika;
/



