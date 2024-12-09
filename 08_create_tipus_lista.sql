CREATE OR REPLACE TYPE ty_kereskedes_statisztika_l AS TABLE OF ty_kereskedes_statisztika;

SELECT type_name, type_oid
FROM user_types
WHERE type_name IN ('TY_KERESKEDES_STATISZTIKA', 'TY_KERESKEDES_STATISZTIKA_L');
