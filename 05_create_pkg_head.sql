CREATE OR REPLACE PACKAGE pkg_jarmu AS

  /* KIVÉTELEK DEKLARÁLÁSA */
  jarmu_nem_forgalmazott_exc EXCEPTION;
  PRAGMA EXCEPTION_INIT(jarmu_nem_forgalmazott_exc, -20100);

  kereskedes_nem_talalhato_exc EXCEPTION;
  PRAGMA EXCEPTION_INIT(kereskedes_nem_talalhato_exc, -20101);

  hibas_adat_exc EXCEPTION;
  PRAGMA EXCEPTION_INIT(hibas_adat_exc, -20102);

  /* FÜGGVÉNYEK ÉS PROCEDÚRÁK DEKLARÁLÁSA */
  FUNCTION get_darabszam(jarmu_id IN NUMBER, kereskedes_id IN NUMBER) RETURN NUMBER;

  PROCEDURE legolcsobb_kereskedes(
    marka IN VARCHAR2,
    tipus IN VARCHAR2,
    kereskedes_nev OUT VARCHAR2,
    kereskedes_cim OUT VARCHAR2
  );

  PROCEDURE keszlet_feltoltes(
    kereskedes_id IN NUMBER,
    jarmu_id IN NUMBER,
    uj_keszlet IN NUMBER
  );

END pkg_jarmu;
/
