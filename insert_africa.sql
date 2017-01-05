CREATE OR REPLACE FUNCTION insert_Africa() RETURNS INTEGER AS $$

DECLARE
	year integer := 1950;
	k integer := 1;
	i integer := 0;
	j integer;


	Algeriaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,1,9,62,31,26,35,38,90,238,39,67,179,103,299,329,366,572,398,402,403,401,358,367,430,245,289,363,434,464,436,334,355,381,403,297,346,393,433,539,390,449,457,664,518];
	Algeria integer;

	Burundiarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,2,0,5,4,1,4,3,2,5,8,3,5,14,14,17,18,40,33,37,12,10,7,29,64,12,65,58,39,45,43,23,16,22,23,15,27,18,27,31,47];
	Burundi integer;

	Botswanaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,4,2,0,4,12,3,4,2,4,9,10,28,18,11,10,22,14,38,41,51,58,53,43,42,63,73,72,52,71,100,120,77,121];
	Botswana integer;

	Cameroonarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,1,7,9,14,5,2,5,8,10,12,23,8,38,25,15,24,16,38,18,26,49,36,48,102,59,81,63,75,105,136,107,92,131,155,207,199,242,220,276,260,364,669,580,504,524];
	Cameroon integer;

	CentralAfricaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,2,7,0,1,1,32,6,48,8,20,15,25,22,33,28,12,7,7,30,36,23,47,15,14,27,33,18,48,27,16,25,27,22,18,32,35,22,29,34,36,15,29,34];
	CentralAfrica integer;

	Chadarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,4,2,0,3,1,8,3,1,8,5,10,18,11,5,7,8,2,5,298,10,14,5,5,4,12,18,8,13,7,12,9,11,15,22,11,15,45,41,27,42];
	Chad integer;

	RepublicofCongoarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,6,10,6,14,4,14,17,17,20,23,20,3,13,4,8,9,0,9,5,28,15,27,21,44,41,11,29,17,33,38,26,38,26,39,40,39,39,79,19,12,18,1,34,14,63];
	RepublicofCongo integer;

	DemocraticRepublicoftheCongoarray integer[] := ARRAY[0,0,0,0,0,3,0,0,0,0,0,0,5,1,18,12,13,5,10,40,54,178,53,109,88,54,83,102,66,74,164,130,65,66,163,122,131,105,187,330,204,200,153,108,144,286,147,149,110,209,211,245,263,279,316,400];
	DemocraticRepublicoftheCongo integer;

	CaboVerdearray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,6,0,3,4,7,19,10,28,13,9,6,16,9,13,23,10,8,12,10,14,19,14,24,19,18,21,38,48,18,9];
	CaboVerde integer;

	Comorosarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,1,12,18,9,28,17,7,22,10,11,13,5,6,6,12,5,6,9,6,4,0,8,9,11,6,5];
	Comoros integer;

	Beninarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,2,3,15,8,1,1,4,10,10,18,7,4,3,5,9,10,6,22,21,28,26,31,18,55,45,45,36,36,42,59,52,32,53,79,47,43,60,99,77,73,61,83,132,143,162];
	Benin integer;

	Djiboutiarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,13,5,30,67,55,37,43,52,50,32,34,47,55,40,33,42,68,45,45];
	Djibouti integer;

	Ethiopiaarray integer[] := ARRAY[0,3,0,4,1,3,28,26,6,28,17,17,23,6,43,33,28,48,61,81,253,80,83,85,50,52,102,90,71,70,101,101,125,118,183,193,198,210,190,200,203,190,204,196,215,204,345,423,480,342,277,322,363,479,401,502];
	Ethiopia integer;

	EquatorialGuineaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,26,11,19,2,17,34,29,46,29,19,51,83,17,6,2,14,20,17,17,41,34,14,18,23,32,26,16,18,14,20,8,5];
	EquatorialGuinea integer;

	Eritreaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,12,25,29,22,23,23,30,27,36,40,44,64];
	Eritrea integer;

	Gabonarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,1,5,0,0,2,8,31,37,56,39,37,45,103,58,27,101,74,98,138,120,139,298,149,65,46,39,40,35,48,41,86,74,58,149,49,55,55,59,97,160,200,109,190];
	Gabon integer;

	Ghanaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,5,10,43,26,26,59,128,64,37,62,51,70,95,71,45,90,98,91,131,192,188,137,113,163,128,168,160,260,505,503,761,971,727,701,791,1270,719,804,991,1150,1367,1707,1934,2174,2294,2369,2125,2056];
	Ghana integer;

	Guineaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,4,1,2,5,4,44,8,2,3,8,12,44,6,14,7,4,25,28,28,49,36,50,20,31,31,30,37,62,42,89,88,126,145,121,118,138,105,166,188,281,303,333,372,356,276,358];
	Guinea integer;

	Gambiaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,5,0,8,2,8,24,13,18,5,2,3,4,6,4,12,6,41,13,15,15,29,32,72,31,20,27,26,11,19,18,26,21,27,31,25,58,31,55];
	Gambia integer;

	GuineaBissauarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21,0,0,2,3,11,6,8,7,8,7,1,1,2,12,21,10,2,7,4,3,5,15,18,2,11,7,14,12,13,10];
	GuineaBissau integer;

--Cote d'Ivoire
       IvoryCoastarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,9,1,17,0,5,10,12,20,86,36,30,56,44,31,82,88,127,90,108,74,132,133,143,135,141,152,124,109,127,142,161,167,150,216,216,227,247,265,182,195,198,205,231,279];
       IvoryCoast integer;

       Kenyaarray integer[] := ARRAY[0,0,0,0,0,3,0,0,0,0,0,0,0,0,76,51,37,50,71,112,204,153,195,230,177,176,221,274,352,291,327,331,470,386,425,442,431,435,518,649,810,744,686,681,798,787,756,817,886,806,901,892,823,825,992,1182];
       Kenya integer;

       Liberiaarray integer[] := ARRAY[0,0,0,0,2,8,6,0,3,1,4,3,4,5,22,9,13,8,4,16,58,26,30,36,32,37,56,70,63,91,62,97,91,109,94,67,58,70,65,61,47,24,22,41,32,42,21,24,19,31,70,30,35,13,29,44];
       Liberia integer;

       Libyaarray integer[] := ARRAY[0,0,0,0,0,0,1,0,0,2,3,8,11,3,21,12,23,46,36,35,42,27,64,82,170,143,177,189,267,220,259,277,275,290,307,427,214,229,165,105,138,173,118,87,65,121,89,74,90,57,112,162,201,182,246,287];
       Libya integer;

       Lesothoarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,0,1,1,3,3,2,2,3,5,5,9,10,11,14,13,46,165,169,33,34,39,39,28,35,54,30,32,62,45,47,43,52];
       Lesotho integer;

       Madagascararray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,2,4,5,14,30,9,14,22,32,39,12,18,24,49,26,19,40,53,73,59,44,87,163,127,48,54,51,69,103,142,83,93,89,87,113,113,114,157,133,155,120,129,164,176,247];
       Madagascar integer;

       Maliarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,3,14,7,3,3,0,7,7,1,4,8,12,12,35,24,20,20,35,54,42,44,49,50,34,31,39,62,123,75,61,51,50,67,106,129,160,155,148,149,181,206,169,242];
       Mali integer;

       Mauritaniaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,7,7,1,6,6,10,13,10,21,24,27,40,56,66,32,48,51,49,84,40,72,76,50,36,19,39,40,63,73,77,48,60,54,71,52,67,61,59,93,61,73,103];
       Mauritania integer;

       Moroccoarray integer[] := ARRAY[0,0,0,0,0,0,0,0,2,5,9,13,24,18,104,47,54,38,71,80,120,82,124,122,131,198,365,241,223,167,345,358,446,304,298,321,272,351,460,349,421,459,427,437,462,467,479,505,542,643,650,622,754,702,773,1437];
       Morocco integer;

       Malawiarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,5,1,4,3,3,2,0,1,1,0,9,19,18,14,15,18,10,17,14,22,19,20,25,31,50,43,54,59,65,64,89,67,66,95,105,135,162,149];
       Malawi integer;

       Mauritiusarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,45,44,63,54,42,97,40,67,62,89,110,113,172,263,320,396,369,425,445,405,385,396,381,358,418,342,516,449,518,507,574,511,562,572];
       Mauritius integer;

       Mozambiquearray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,13,21,7,10,8,17,11,25,32,80,22,124,31,23,14,18,33,43,23,58,77,116,70,70,84,59,115,73,95];
       Mozambique integer;

       Nigerarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,2,10,4,2,8,12,9,10,12,3,7,9,42,21,8,58,46,43,80,58,52,56,31,3,10,8,16,24,32,18,8,30,27,20,32,41,24,15,20,35,50,39,38];
       Niger integer;

       Nigeriaarray integer[] := ARRAY[0,0,0,0,0,3,3,3,1,1,6,31,31,27,106,54,54,77,56,55,228,194,179,212,299,410,454,705,808,824,1328,1573,1212,1217,1078,1598,1463,760,824,1432,1235,2290,1366,1052,555,659,764,977,1516,2313,2901,3522,4055,3702,3480,3777];
       Nigeria integer;

       Namibiaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,2,1,1,18,36,33,38,41,71,70,45,37,40,63,61,71,58,65,66];
       Namibia integer;

       Rwandaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,1,0,3,1,1,3,7,2,0,3,5,2,6,22,43,68,16,19,30,20,30,38,32,70,43,36,40,19,14,17,20,48,47,37,32,30,31,35,47,53,127];
       Rwanda integer;

       Senegalarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,2,0,1,2,41,8,9,9,8,10,8,18,15,9,18,18,41,58,53,105,67,90,84,123,128,143,145,165,190,162,254,210,179,176,227,187,208,216,243,275,302,322,772,519,426,635];
       Senegal integer;

       SierraLeonearray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,1,5,12,0,7,0,2,23,16,12,5,12,6,8,15,39,53,61,48,51,34,88,46,47,50,41,39,48,43,47,34,38,38,64,55,49,39,55,43,59,52,76,54,76];
       SierraLeone integer;

       Somaliaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,1,2,2,13,1,3,1,7,3,13,16,10,5,8,10,8,28,16,35,17,32,36,43,27,51,51,50,55,49,39,15,19,12,18,14,8,10,11,16,11,6,24,37,15,10];
       Somalia integer;

       SomaliSudanarray integer[] := ARRAY[0,0,2,1,8,0,1,21,4,9,9,27,26,41,31,44,67,34,73,54,55,52,79,98,109,135,161,201,178,197,257,239,249,299,328,250,233,253,200,265,249,272,256,243,145,161,155,135,185,196,219,247,288,347,300,448];
       SomaliSudan integer;

       Swazilandarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,9,24,29,44,94,109,68,79,87,213,177,146,35,17,14,7,10,15,19,31,32,33,37,27,36,77,25,27,38,42,110,44,38];
       Swaziland integer;

       SwazilasantomePrincipendoarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,2,2,0,4,1,2,0,0,2,1,3,7,4,4,4,3,4,3,7,6,6,7,2,5,7,12,13,23];
       SwazilasantomePrincipendo integer;

       Seychellesarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,9,7,9,11,22,26,45,37,33,27,31,28,34,46,24,25,47,50,52,54,35,56,41,23,43,31,46,61,35];
       Seychelles integer;

       Tanzaniaarray integer[] := ARRAY[0,0,0,0,0,0,0,1,2,2,0,1,13,20,39,41,42,47,69,80,244,85,93,117,153,134,120,142,228,167,201,214,200,232,249,237,260,241,252,339,328,324,326,390,416,445,465,438,634,596,600,587,533,668,662,801];
       Tanzania integer;

       Togoarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,4,5,2,4,2,10,5,4,5,4,6,4,9,3,6,16,9,17,24,16,21,20,43,21,25,24,113,87,29,23,22,32,27,32,51,57,46,36,76,49,70,44,54];
       Togo integer;

       Tunisiaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,1,5,6,7,11,23,40,19,25,27,61,54,52,46,108,76,61,103,125,195,150,217,248,262,349,286,517,387,260,233,296,309,370,339,408,525,478,520,632,635,534,722,778,723,1081,748,959,1082];
       Tunisia integer;

       Ugandaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,1,1,1,0,0,9,35,63,31,22,46,44,186,66,73,77,106,81,101,106,123,76,96,103,130,164,133,130,87,113,172,138,192,193,314,375,508,1076,483,624,509,638,778,316,379,451,725,934];
       Uganda integer;

       SouthAfricaRepublicarray integer[] := ARRAY[22,172,113,199,106,163,217,313,325,425,493,581,952,1149,1584,1642,1804,2035,2611,2873,3796,2936,3130,4177,4342,4365,3203,3157,3512,3037,4386,6717,8188,9258,8352,3895,2729,2083,1823,1723,2011,2461,3035,2997,3117,3171,3189,3649,3507,3337,4357,4365,4639,4529,5072,5941];
       SouthAfricaRepublic integer;

       Egyptarray integer[] := ARRAY[13,31,6,25,29,37,25,85,108,121,257,263,289,252,379,220,270,187,218,415,603,479,423,442,595,939,1331,1477,1582,1483,1855,2188,2070,3128,2891,2912,1957,2010,1769,1884,1827,1503,1972,2170,2452,2325,2324,2467,2779,2922,2854,2721,2855,2775,2815,3321];
       Egypt integer;

       BurkinaFasoarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,1,13,6,17,12,1,1,9,3,3,5,5,8,4,4,5,48,22,15,13,23,14,25,94,102,19,9,35,72,33,42,51,57,51,55,47,53,80,51,60,51,88,141,43,89];
       BurkinaFaso integer;

       Zambiaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,31,14,23,157,39,41,62,74,69,65,70,63,69,153,87,113,132,137,160,130,133,188,246,270,188,205,220,310,313,199,220,271,238,300,283,283,346,329,402];
       Zambia integer;

       Zimbabwearray integer[] := ARRAY[0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,51,164,130,152,148,201,166,182,193,276,214,211,201,227,263,258,317,378,279,325,290,282,246,274,288,372];
       Zimbabwe integer;

       Angolaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,9,21,35,11,17,14,13,23,20,13,21,31,14,41,22,44,21,66,25,32,45,42,72,258,208,164,232,614];
       Angola integer;


BEGIN

FOREACH Algeria IN ARRAY Algeriaarray LOOP 
	for j IN 1..Algeria LOOP
	   INSERT INTO foreigner_europe values (k,'Algeria',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Burundi IN ARRAY Burundiarray LOOP 
	for j IN 1..Burundi LOOP
	   INSERT INTO foreigner_europe values (k,'Burundi',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Botswana IN ARRAY Botswanaarray LOOP 
	for j IN 1..Botswana LOOP
	   INSERT INTO foreigner_europe values (k,'Botswana',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Cameroon IN ARRAY Cameroonarray LOOP 
	for j IN 1..Cameroon LOOP
	   INSERT INTO foreigner_europe values (k,'Cameroon',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH CentralAfrica IN ARRAY CentralAfricaarray LOOP 
	for j IN 1..CentralAfrica LOOP
	   INSERT INTO foreigner_europe values (k,'CentralAfrica',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Chad IN ARRAY Chadarray LOOP 
	for j IN 1..Chad LOOP
	   INSERT INTO foreigner_europe values (k,'Chad',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH RepublicofCongo IN ARRAY RepublicofCongoarray LOOP 
	for j IN 1..RepublicofCongo LOOP
	   INSERT INTO foreigner_europe values (k,'RepublicofCongo',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH DemocraticRepublicoftheCongo IN ARRAY DemocraticRepublicoftheCongoarray LOOP 
	for j IN 1..DemocraticRepublicoftheCongo LOOP
	   INSERT INTO foreigner_europe values (k,'DemocraticRepublicoftheCongo',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH CaboVerde IN ARRAY CaboVerdearray LOOP 
	for j IN 1..CaboVerde LOOP
	   INSERT INTO foreigner_europe values (k,'CaboVerde',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Comoros IN ARRAY Comorosarray LOOP 
	for j IN 1..Comoros LOOP
	   INSERT INTO foreigner_europe values (k,'Comoros',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Benin IN ARRAY Beninarray LOOP 
	for j IN 1..Benin LOOP
	   INSERT INTO foreigner_europe values (k,'Benin',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Djibouti IN ARRAY Djiboutiarray LOOP 
	for j IN 1..Djibouti LOOP
	   INSERT INTO foreigner_europe values (k,'Djibouti',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Ethiopia IN ARRAY Ethiopiaarray LOOP 
	for j IN 1..Ethiopia LOOP
	   INSERT INTO foreigner_europe values (k,'Ethiopia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH EquatorialGuinea IN ARRAY EquatorialGuineaarray LOOP 
	for j IN 1..EquatorialGuinea LOOP
	   INSERT INTO foreigner_europe values (k,'EquatorialGuinea',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Eritrea IN ARRAY Eritreaarray LOOP 
	for j IN 1..Eritrea LOOP
	   INSERT INTO foreigner_europe values (k,'Eritrea',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Gabon IN ARRAY Gabonarray LOOP 
	for j IN 1..Gabon LOOP
	   INSERT INTO foreigner_europe values (k,'Gabon',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Ghana IN ARRAY Ghanaarray LOOP 
	for j IN 1..Ghana LOOP
	   INSERT INTO foreigner_europe values (k,'Ghana',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Guinea IN ARRAY Guineaarray LOOP 
	for j IN 1..Guinea LOOP
	   INSERT INTO foreigner_europe values (k,'Guinea',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Gambia IN ARRAY Gambiaarray LOOP 
	for j IN 1..Gambia LOOP
	   INSERT INTO foreigner_europe values (k,'Gambia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH GuineaBissau IN ARRAY GuineaBissauarray LOOP 
	for j IN 1..GuineaBissau LOOP
	   INSERT INTO foreigner_europe values (k,'GuineaBissau',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH IvoryCoast IN ARRAY IvoryCoastarray LOOP 
	for j IN 1..IvoryCoast LOOP
	   INSERT INTO foreigner_europe values (k,'IvoryCoast',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Kenya IN ARRAY Kenyaarray LOOP 
	for j IN 1..Kenya LOOP
	   INSERT INTO foreigner_europe values (k,'Kenya',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Liberia IN ARRAY Liberiaarray LOOP 
	for j IN 1..Liberia LOOP
	   INSERT INTO foreigner_europe values (k,'Liberia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Libya IN ARRAY Libyaarray LOOP 
	for j IN 1..Libya LOOP
	   INSERT INTO foreigner_europe values (k,'Libya',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Lesotho IN ARRAY Lesothoarray LOOP 
	for j IN 1..Lesotho LOOP
	   INSERT INTO foreigner_europe values (k,'Lesotho',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Madagascar IN ARRAY Madagascararray LOOP 
	for j IN 1..Madagascar LOOP
	   INSERT INTO foreigner_europe values (k,'Madagascar',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Mali IN ARRAY Maliarray LOOP 
	for j IN 1..Mali LOOP
	   INSERT INTO foreigner_europe values (k,'Mali',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Mauritania IN ARRAY Mauritaniaarray LOOP 
	for j IN 1..Mauritania LOOP
	   INSERT INTO foreigner_europe values (k,'Mauritania',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Morocco IN ARRAY Moroccoarray LOOP 
	for j IN 1..Morocco LOOP
	   INSERT INTO foreigner_europe values (k,'Morocco',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Malawi IN ARRAY Malawiarray LOOP 
	for j IN 1..Malawi LOOP
	   INSERT INTO foreigner_europe values (k,'Malawi',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Mauritius IN ARRAY Mauritiusarray LOOP 
	for j IN 1..Mauritius LOOP
	   INSERT INTO foreigner_europe values (k,'Mauritius',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Mozambique IN ARRAY Mozambiquearray LOOP 
	for j IN 1..Mozambique LOOP
	   INSERT INTO foreigner_europe values (k,'Mozambique',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Niger IN ARRAY Nigerarray LOOP 
	for j IN 1..Niger LOOP
	   INSERT INTO foreigner_europe values (k,'Niger',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Nigeria IN ARRAY Nigeriaarray LOOP 
	for j IN 1..Nigeria LOOP
	   INSERT INTO foreigner_europe values (k,'Nigeria',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Namibia IN ARRAY Namibiaarray LOOP 
	for j IN 1..Namibia LOOP
	   INSERT INTO foreigner_europe values (k,'Namibia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Rwanda IN ARRAY Rwandaarray LOOP 
	for j IN 1..Rwanda LOOP
	   INSERT INTO foreigner_europe values (k,'Rwanda',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Senegal IN ARRAY Senegalarray LOOP 
	for j IN 1..Senegal LOOP
	   INSERT INTO foreigner_europe values (k,'Senegal',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH SierraLeone IN ARRAY SierraLeonearray LOOP 
	for j IN 1..SierraLeone LOOP
	   INSERT INTO foreigner_europe values (k,'SierraLeone',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Somalia IN ARRAY Somaliaarray LOOP 
	for j IN 1..Somalia LOOP
	   INSERT INTO foreigner_europe values (k,'Somalia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH SomaliSudan IN ARRAY SomaliSudanarray LOOP 
	for j IN 1..SomaliSudan LOOP
	   INSERT INTO foreigner_europe values (k,'SomaliSudan',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Swaziland IN ARRAY Swazilandarray LOOP 
	for j IN 1..Swaziland LOOP
	   INSERT INTO foreigner_europe values (k,'Swaziland',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH SwazilasantomePrincipendo IN ARRAY SwazilasantomePrincipendoarray LOOP 
	for j IN 1..SwazilasantomePrincipendo LOOP
	   INSERT INTO foreigner_europe values (k,'SwazilasantomePrincipendo',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Seychelles IN ARRAY Seychellesarray LOOP 
	for j IN 1..Seychelles LOOP
	   INSERT INTO foreigner_europe values (k,'Seychelles',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Tanzania IN ARRAY Tanzaniaarray LOOP 
	for j IN 1..Tanzania LOOP
	   INSERT INTO foreigner_europe values (k,'Tanzania',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Togo IN ARRAY Togoarray LOOP 
	for j IN 1..Togo LOOP
	   INSERT INTO foreigner_europe values (k,'Togo',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Uganda IN ARRAY Ugandaarray LOOP 
	for j IN 1..Uganda LOOP
	   INSERT INTO foreigner_europe values (k,'Uganda',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH SouthAfricaRepublic IN ARRAY SouthAfricaRepublicarray LOOP 
	for j IN 1..SouthAfricaRepublic LOOP
	   INSERT INTO foreigner_europe values (k,'SouthAfricaRepublic',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Egypt IN ARRAY Egyptarray LOOP 
	for j IN 1..Egypt LOOP
	   INSERT INTO foreigner_europe values (k,'Egypt',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH BurkinaFaso IN ARRAY BurkinaFasoarray LOOP 
	for j IN 1..BurkinaFaso LOOP
	   INSERT INTO foreigner_europe values (k,'BurkinaFaso',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Zambia IN ARRAY Zambiaarray LOOP 
	for j IN 1..Zambia LOOP
	   INSERT INTO foreigner_europe values (k,'Zambia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Zimbabwe IN ARRAY Zimbabwearray LOOP 
	for j IN 1..Zimbabwe LOOP
	   INSERT INTO foreigner_europe values (k,'Zimbabwe',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Angola IN ARRAY Angolaarray LOOP 
	for j IN 1..Angola LOOP
	   INSERT INTO foreigner_europe values (k,'Angola',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

RETURN 0;

END;
$$ LANGUAGE plpgsql;
