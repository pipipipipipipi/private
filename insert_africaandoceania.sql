CREATE OR REPLACE FUNCTION insert_africaandoceania() RETURNS INTEGER AS $$

DECLARE
	year integer := 1950;
	k integer := 1;
	i integer := 0;
	j integer;

	afghanistanarray integer[] := ARRAY[0,1,2,4,5,9,16,12,33,34,16,30,23,33,50,56,81,63,78,122,145,153,144,126,166,149,213,311,240,273,176,157,193,186,235,210,191,239,225,189,217,254,196,213,306,297,434,438,756,832,732,258,381,598,1029,2142];
	afghanistan integer;


BEGIN

FOREACH afghanistan IN ARRAY afghanistanarray LOOP 
	for j IN 1..afghanistan LOOP
	   INSERT INTO foreigner_afoc values (k,'Afghanistan',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
	IF year > 2006 THEN
	   EXIT;
	END IF;
END LOOP;

i :=0;
j :=0;
year :=1950;


RETURN 0;

END;
$$ LANGUAGE plpgsql;
