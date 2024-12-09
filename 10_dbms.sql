BEGIN
  -- Az eredm�ny t�rol�s�ra szolg�l� v�ltoz�
  DECLARE
    eredmeny ty_kereskedes_statisztika_l;
  BEGIN
    -- F�ggv�ny megh�v�sa �s az eredm�ny t�rol�sa
    eredmeny := get_kereskedes_statisztika;

    -- Eredm�nyek ki�rat�sa a DBMS_OUTPUT haszn�lat�val
    FOR i IN 1 .. eredmeny.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE('Keresked�s neve: ' || eredmeny(i).kereskedes_nev ||
                           ', Forgalmazott j�rm�vek sz�ma: ' || eredmeny(i).forgalmazott_jarmu_szam ||
                           ', J�rm� m�rka: ' || eredmeny(i).jarmu_marka ||
                           ', J�rm� t�pus: ' || eredmeny(i).jarmu_tipus ||
                           ', Teljes darabsz�m �rt�k: ' || eredmeny(i).darabszam_ertek);
    END LOOP;
  END;
END;
/

SET SERVEROUTPUT ON;

