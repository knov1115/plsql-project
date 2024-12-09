CREATE TRIGGER kereskedes_trigger
 BEFORE INSERT ON kereskedes
 FOR EACH ROW 
BEGIN
  IF :new.id IS NULL
    THEN
      :new.id := kereskedes_seq.nextval;
  END IF;
END;

CREATE TRIGGER jarmu_trigger
 BEFORE INSERT ON jarmu
 FOR EACH ROW
BEGIN
  IF :new.id IS NULL
    THEN 
      :new.id := jarmu_seq.nextval;
  END IF;
END;

CREATE TRIGGER kereskedes_jarmu_trigger
 BEFORE INSERT ON kereskedes_jarmu
 FOR EACH ROW
BEGIN
 IF :new.id IS NULL
   THEN
     :new.id := kereskedes_jarmu_seq.nextval;
 END IF;
END; 

--ELLENÕRZÉS, HOGY MEGVAN AZ ÖSSZES TRIGGER
SELECT * FROM user_triggers;

--LEFUTTATNI AZ INSERTET (test_data.sql) + COMMIT; --> MAJD TESZTELÉS

SELECT * FROM kereskedes;
SELECT * FROM jarmu;
SELECT * FROM kereskedes_jarmu;
