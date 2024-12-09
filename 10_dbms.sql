BEGIN
  -- Az eredmény tárolására szolgáló változó
  DECLARE
    eredmeny ty_kereskedes_statisztika_l;
  BEGIN
    -- Függvény meghívása és az eredmény tárolása
    eredmeny := get_kereskedes_statisztika;

    -- Eredmények kiíratása a DBMS_OUTPUT használatával
    FOR i IN 1 .. eredmeny.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE('Kereskedés neve: ' || eredmeny(i).kereskedes_nev ||
                           ', Forgalmazott jármûvek száma: ' || eredmeny(i).forgalmazott_jarmu_szam ||
                           ', Jármû márka: ' || eredmeny(i).jarmu_marka ||
                           ', Jármû típus: ' || eredmeny(i).jarmu_tipus ||
                           ', Teljes darabszám érték: ' || eredmeny(i).darabszam_ertek);
    END LOOP;
  END;
END;
/

SET SERVEROUTPUT ON;

