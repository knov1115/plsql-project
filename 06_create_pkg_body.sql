CREATE OR REPLACE PACKAGE BODY pkg_jarmu AS

  /* 1. get_darabszam */
  FUNCTION get_darabszam(jarmu_id IN NUMBER, kereskedes_id IN NUMBER) RETURN NUMBER IS
    darabszam NUMBER;
  BEGIN
    SELECT darabszam
    INTO darabszam
    FROM kereskedes_jarmu
    WHERE jarmu_id = jarmu_id AND kereskedes_id = kereskedes_id;

    RETURN darabszam;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE jarmu_nem_forgalmazott_exc;
  END get_darabszam;

  /* 2. legolcsobb_kereskedes */
  PROCEDURE legolcsobb_kereskedes(
    marka IN VARCHAR2,
    tipus IN VARCHAR2,
    kereskedes_nev OUT VARCHAR2,
    kereskedes_cim OUT VARCHAR2
  ) IS
  BEGIN
    SELECT kereskedes_nev, kereskedes_cim
    INTO kereskedes_nev, kereskedes_cim
    FROM (
      SELECT k.nev AS kereskedes_nev, k.cim AS kereskedes_cim
      FROM kereskedes k
      JOIN kereskedes_jarmu kj ON k.id = kj.kereskedes_id
      JOIN jarmu j ON j.id = kj.jarmu_id
      WHERE LOWER(j.marka) LIKE '%' || LOWER(marka) || '%'
        AND LOWER(j.tipus) LIKE '%' || LOWER(tipus) || '%'
      ORDER BY kj.ar ASC
    )
    WHERE ROWNUM = 1;


    
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE kereskedes_nem_talalhato_exc;
  END legolcsobb_kereskedes;

  /* 3. keszlet_feltoltes */
  PROCEDURE keszlet_feltoltes(kereskedes_id IN NUMBER, jarmu_id IN NUMBER, uj_keszlet IN NUMBER) IS
    letezik NUMBER;
  BEGIN
    -- Ellen�rizz�k, hogy a megadott k�szlet pozit�v-e
    IF uj_keszlet <= 0 THEN
      RAISE hibas_adat_exc;
    END IF;

    -- Ellen�rizz�k, hogy a j�rm�-keresked�s p�ros l�tezik-e
    SELECT COUNT(*)
    INTO letezik
    FROM kereskedes_jarmu
    WHERE kereskedes_id = kereskedes_id AND jarmu_id = jarmu_id;

    IF letezik > 0 THEN
      -- Ha l�tezik, n�velj�k a k�szletet
      UPDATE kereskedes_jarmu
      SET darabszam = darabszam + uj_keszlet
      WHERE kereskedes_id = kereskedes_id AND jarmu_id = jarmu_id;
    ELSE
      -- Ha nem l�tezik, �j rekordot hozunk l�tre
      INSERT INTO kereskedes_jarmu (id, kereskedes_id, jarmu_id, darabszam, ar)
      VALUES (kereskedes_jarmu_seq.NEXTVAL, kereskedes_id, jarmu_id, uj_keszlet, 0);
    END IF;
  END keszlet_feltoltes;

END pkg_jarmu;
/
