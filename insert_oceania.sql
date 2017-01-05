CREATE OR REPLACE FUNCTION insert_Oceania() RETURNS INTEGER AS $$

DECLARE
	year integer := 1950;
	k integer := 1;
	i integer := 0;
	j integer;


	Australiaarray integer[] := ARRAY[180,209,209,585,461,536,697,1431,2083,2993,4311,4799,6587,6152,7507,7550,7927,9528,11281,13001,21265,14406,15236,17805,20162,24449,31676,31054,28877,22579,23985,29276,37785,38720,47803,53553,40534,39169,40568,49778,53252,52058,57171,59906,63323,61373,66697,79548,93196,137558,150046,152480,167868,175315,197940,210043];
	Australia integer;

	Fijiarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,80,100,115,144,134,129,122,148,148,243,245,326,494,442,399,263,486,664,548,608,624,666,734,716,783,789,764,762,734,730,906,884,778,1031];
	Fiji integer;

	Kiribatiarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,15,9,23,13,31,29,20,36,72,76,92,60,67,77,90,96,77,100,83,80,113,86,81,122,99,114];
	Kiribati integer;

	Marshallarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,66,81,120,108,122,82,94,86,110,76,89,96,88,79,89,102,188];
	Marshall integer;

	Micronesiaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,377,300,305,286,257,229,275,282,311,253,246,270,342,319,295,321,422];
	Micronesia integer;

	NewZealandarray integer[] := ARRAY[8,7,8,91,19,43,47,150,247,442,766,984,1301,1237,1985,1341,1367,1529,1573,2039,5070,2572,2696,2996,3377,3699,3698,3707,3761,4092,5340,8669,13047,14751,16297,17353,15096,17702,14674,15418,16396,18384,21093,21337,25513,27894,25751,28597,28412,29759,32142,34091,33748,32636,35892,36280];
	NewZealand integer;

	Nauruarray integer[] := ARAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,35,39,44,86,46,45,30,41,44,40,32,47,42,44,36,31,26,70,23,35,36,21,33,29,30,43,38,30,42,37,24,29,21,25];
	Nauru integer;

	PapuaNewGuineaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11,88,285,221,157,172,216,152,141,189,208,239,228,324,419,319,286,338,309,307,333,384,466,402,401,431,386,435,427,384,521];
	PapuaNewGuinea integer;

	Palauarray integer[] := ARRAY[0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23,258,257,388,269,393,395,391,363,346,388,504];
	Palau integer;

	Solomonarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,59,84,137,126,89,123,110,158,64,77,95,106,121,133,94,98,126,107,98,103,152,80,83,60,124,98,186];
	Solomon integer;

	Tongaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,11,73,37,50,57,45,65,59,76,117,113,110,116,98,190,145,133,214,206,255,178,177,192,288,231,318,285,327,338,308,360,365,305,292];
	Tonga integer;

	Tuvaluarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,44,15,2,8,4,16,11,18,20,29,35,23,42,39,37,43,47,38,32,59,48,50,39,42,57];
	Tuvalu integer;

	Vanuatuarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,13,21,19,22,16,37,49,58,34,45,39,29,47,65,38,68,51,53,70,59,59,63,65,78];
	Vanuatu integer;

	Samoaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,2,3,7,30,20,57,61,70,74,86,89,72,74,69,57,89,70,71,64,76,78,80,91,115,135,161,108,90,115,219,139,141,153,131,133,158,207,190,172,200,204];
	Samoa integer;


BEGIN

FOREACH Australia IN ARRAY Australiaarray LOOP 
	for j IN 1..Australia LOOP
	   INSERT INTO foreigner_europe values (k,'Australia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Fiji IN ARRAY Fijiarray LOOP 
	for j IN 1..Fiji LOOP
	   INSERT INTO foreigner_europe values (k,'Fiji',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Kiribati IN ARRAY Kiribatiarray LOOP 
	for j IN 1..Kiribati LOOP
	   INSERT INTO foreigner_europe values (k,'Kiribati',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Marshall IN ARRAY Marshallarray LOOP 
	for j IN 1..Marshall LOOP
	   INSERT INTO foreigner_europe values (k,'Marshall Islands',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Micronesia IN ARRAY Micronesiaarray LOOP 
	for j IN 1..Micronesia LOOP
	   INSERT INTO foreigner_europe values (k,'Micronesia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH NewZealand IN ARRAY NewZealandarray LOOP 
	for j IN 1..NewZealand LOOP
	   INSERT INTO foreigner_europe values (k,'New Zealand',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Nauru IN ARRAY Nauruarray LOOP 
	for j IN 1..Nauru LOOP
	   INSERT INTO foreigner_europe values (k,'Nauru',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH PapuaNewGuinea IN ARRAY PapuaNewGuineaarray LOOP 
	for j IN 1..PapuaNewGuinea LOOP
	   INSERT INTO foreigner_europe values (k,'Papua New Guinea',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Palau IN ARRAY Palauarray LOOP 
	for j IN 1..Palau LOOP
	   INSERT INTO foreigner_europe values (k,'Palau',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Solomon IN ARRAY Solomonarray LOOP 
	for j IN 1..Solomon LOOP
	   INSERT INTO foreigner_europe values (k,'Solomon Islands',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Tonga IN ARRAY Tongaarray LOOP 
	for j IN 1..Tonga LOOP
	   INSERT INTO foreigner_europe values (k,'Tonga',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Tuvalu IN ARRAY Tuvaluarray LOOP 
	for j IN 1..Tuvalu LOOP
	   INSERT INTO foreigner_europe values (k,'Tuvalu',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Vanuatu IN ARRAY Vanuatuarray LOOP 
	for j IN 1..Vanuatu LOOP
	   INSERT INTO foreigner_europe values (k,'Vanuatu',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Samoa IN ARRAY Samoaarray LOOP 
	for j IN 1..Samoa LOOP
	   INSERT INTO foreigner_europe values (k,'Samoa',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;



RETURN 0;

END;
$$ LANGUAGE plpgsql;

