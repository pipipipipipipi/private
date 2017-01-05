CREATE OR REPLACE FUNCTION insert_America() RETURNS INTEGER AS $$

DECLARE
	year integer := 1950;
	k integer := 1;
	i integer := 0;
	j integer;

	Barbadosarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24,15,8,15,15,19,25,18,25,29,51,57,51,65,52,65,51,75,240,98,39,51,54,59,69,83,72,72,61,64,110,71,95,95];
	Barbados integer;
	
	Colombiaarray integer[] := ARRAY[20,4,2,24,26,28,55,31,75,108,135,172,140,174,323,231,240,249,354,561,935,800,638,944,711,956,1226,1643,1992,1993,2111,2526,2692,2391,2295,2399,2183,2400,2569,2838,2464,2922,3023,3524,3632,3529,3132,3202,2921,2941,3451,3660,4090,3331,3402,3673];
	Colombia integer;
	
	Chilearray integer[] := ARRAY[8,4,10,18,21,20,39,57,65,74,173,229,140,128,199,346,339,298,348,527,1018,546,501,478,578,550,861,1524,1505,1624,1625,1854,1226,1181,1293,1287,1222,1464,1477,1661,1489,2036,2025,2059,2072,2319,2299,2607,2017,2235,2374,2134,2504,1998,2289,2541];
	Chile integer;
	
	Canadaarray integer[] := ARRAY[314,330,538,793,1078,1244,1380,1558,2135,2822,3234,4560,4871,4792,6625,8320,9932,9349,11848,15523,42589,15612,18134,20147,19765,23565,29331,34898,34172,34215,40821,44718,48166,53613,53095,61270,55374,58536,58583,60215,64791,63120,70689,73738,75560,77125,87246,96516,109432,109651,122260,128707,134845,129460,146109,154571];
	Canada integer;
	
	CostaRicaarray integer[] := ARRAY[4,2,3,4,7,0,4,5,10,15,19,16,44,31,90,41,77,48,49,95,192,159,157,182,206,300,293,410,693,773,768,733,521,448,508,572,486,394,355,414,499,507,439,492,431,499,447,474,479,593,596,655,1072,547,596,1006];
	CostaRica integer;
	
	Cubaarray integer[] := ARRAY[4,8,14,26,25,38,46,64,64,132,70,90,103,141,228,143,143,147,111,299,468,358,451,623,748,816,750,582,603,479,461,492,401,411,604,698,573,384,493,393,399,496,469,421,390,689,482,606,433,534,911,686,514,851,540,603];
	Cuba integer;
	
	DominicanRepublicarray integer[] := ARRAY[0,0,6,5,12,5,4,17,7,11,14,22,21,22,76,15,26,37,74,51,146,135,106,93,131,139,188,133,193,294,568,1002,976,1079,1050,1193,1168,1269,963,1203,1271,1232,1161,1083,992,930,1030,1179,1303,1280,1381,1161,1223,1071,986,1360];
	DominicanRepublic integer;
	
	Ecuadorarray integer[] := ARRAY[1,7,3,4,3,5,7,12,13,13,46,54,40,52,74,68,101,97,128,174,271,171,175,201,229,372,442,479,631,533,627,730,466,361,379,612,489,648,429,525,564,657,565,635,735,728,470,433,451,409,525,618,2319,466,620,908];
	Ecuador integer;
	
	ElSalvadorarray integer[] := ARRAY[2,4,4,1,6,6,5,16,17,21,27,37,38,179,111,148,227,54,65,113,193,189,132,232,176,308,245,281,360,275,166,205,183,202,189,236,247,281,261,275,276,259,263,283,292,348,288,319,265,363,352,383,513,336,386,435];
	ElSalvador integer;
	
	Guatemalaarray integer[] := ARRAY[0,3,0,2,2,0,10,10,35,34,51,64,39,65,147,145,110,78,148,217,269,253,260,274,188,226,367,440,521,337,334,346,384,388,633,346,428,412,408,391,329,377,391,311,343,478,366,397,346,497,517,666,873,407,451,683];
	Guatemala integer;

	Haitiarray integer[] := ARRAY[0,0,0,2,1,0,0,4,5,2,5,2,2,8,22,1,5,5,15,13,53,21,29,19,17,27,31,43,44,19,101,65,58,79,69,104,49,117,61,86,97,62,42,55,39,89,89,95,100,114,134,96,122,124,76,140];
	Haiti integer;

	Mexicoarray integer[] := ARRAY[13,55,24,59,93,142,223,244,325,566,1078,1251,1873,1453,2133,2107,2098,2023,3148,4513,7776,3847,6426,6051,5551,7070,9242,6715,9300,8066,12073,15836,8393,5278,9431,10380,7527,9020,10668,9142,9950,9417,10371,10219,9226,7947,8811,10585,11137,11582,13049,12612,24300,11686,17128,19286];
	Mexico integer;

	Brazilarray integer[] := ARRAY[39,300,575,581,372,208,316,379,396,402,478,507,585,656,823,782,1154,1516,2196,2983,5866,3270,4772,6734,5765,6522,7804,6153,7696,7488,8381,9438,10336,7992,9250,13889,13434,12126,16789,29241,67303,96337,81495,70719,72236,90322,94068,104323,77569,70794,101513,81800,71763,79692,79960,91268];
	Brazil integer;

	USAarray integer[] := ARRAY[9515,10354,15941,21886,23304,27908,34150,39878,51399,68652,81730,97294,108400,124258,129908,150253,173593,187373,199581,255663,315211,271029,281853,287988,245826,237219,274686,303755,275240,256507,277980,310726,352208,400984,437745,487713,482670,479891,457620,538117,564958,554147,574181,549090,548265,558474,606652,642933,688006,720142,749343,715036,755196,678935,785916,853845];
	USA integer;

	Peruarray integer[] := ARRAY[5,13,21,34,31,21,32,62,89,90,164,353,283,363,548,538,777,745,567,885,1013,1036,1294,1305,1240,1384,1144,1146,849,936,1362,1646,1698,1686,1585,1667,1674,1947,2045,6084,11478,23989,19405,15287,14137,11514,10549,13395,11959,12010,15852,15723,13246,14564,14575,16492];
	Peru integer;

	Bahamasarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,27,17,8,16,19,13,23,30,56,58,63,44,77,32,91,40,266,297,69,64,48,98,65,66,86,108,88,95,105,66,136,144];
	Bahamas integer;

	Belizesarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,23,17,7,15,14,38,62,118,81,66,74,74,75,48,84,73,54,66,60,74,49,68,65];
	Belizes integer;

	Dominicaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,65,104,66,129,108,110,8,24,16,13,36,43,38,81,56,48,74,83,92,53,52,60,87,54,148,228];
	Dominica integer;

	Hondurasarray integer[] := ARRAY[0,1,1,6,2,5,8,14,11,4,2,15,12,26,18,15,25,13,55,66,99,97,56,80,70,142,168,151,216,199,157,218,226,318,306,300,278,222,234,265,193,235,642,386,310,356,259,358,292,298,297,378,425,297,335,445];
	Honduras integer;

	Jamaicaarray integer[] := ARRAY[0,0,0,0,0,0,0,2,0,0,0,0,0,37,87,54,70,67,76,113,276,185,170,154,128,153,149,128,145,138,122,158,210,233,213,296,254,295,309,379,377,461,510,600,638,595,502,490,528,517,434,513,678,569,705,754];
	Jamaica integer;

	Nicaraguaarray integer[] := ARRAY[1,0,3,2,3,4,6,4,11,12,13,41,26,45,55,30,112,48,46,86,198,60,76,85,118,221,152,183,149,83,85,116,60,77,126,113,119,115,77,116,110,151,140,166,156,159,153,162,138,147,157,149,172,198,231,266];
	Nicaragua integer;

	Panamaarray integer[] := ARRAY[0,12,14,13,11,18,34,35,50,57,110,93,95,118,175,134,179,177,140,239,282,256,262,288,279,331,353,418,439,449,543,540,573,507,622,568,524,515,305,369,411,391,362,418,367,452,399,430,432,404,431,435,500,417,390,556];
	Panama integer;

	Saintluciaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,4,6,5,8,4,7,9,10,13,22,19,14,13,10,16,17,26,25,35,22,26,43,46,37,49];
	Saintlucia integer;


	Saintvincentarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,8,7,8,6,8,14,13,16,12,10,4,15,10,13,13,19,13,19,10,17,13,30,27,28];
	Saintvincent integer;


	Saintkittsandnevisarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,2,4,6,7,5,4,1,2,5,6,26,10,26,28,21,13,19,9,15,18];
	Saintkittsandnevis integer;


	Trinidadandtobagoarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,1,20,62,48,44,67,44,69,158,121,159,142,111,238,235,215,254,241,341,287,437,554,479,479,321,264,199,163,151,200,219,285,332,311,450,508,575,570,527,506,594,547,620,648];
	Trinidadandtobago integer;

	Grenadaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,6,1,9,1,3,9,2,8,7,13,11,18,5,14,6,14,7,16,12,13,18,5,14,24,38,51,53,45,47,42];
	Grenada integer;

	Antiguaandbarbudaarray integer := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,5,12,1,2,16,1,11,8,16,12,18,13,20,8,25,24,30,24,23,35,21,26,34];
	Antiguaandbarbuda integer;

	Argentinaarray integer[] := ARRAY[22,21,40,64,134,142,116,90,198,229,376,948,443,421,836,870,1039,886,1128,1989,3309,1744,1355,1657,2726,3539,2399,4254,5234,7173,9825,8978,2901,2840,3248,3335,5227,4613,4624,5452,6040,6332,5883,5430,5694,4721,5337,5484,5423,4502,6817,4880,4502,4807,4135,4575];
	Argentina integer;

	Boliviaarray integer[] := ARRAY[1,15,3,0,7,3,19,7,18,17,38,44,39,47,51,57,56,79,84,70,151,117,130,124,162,189,240,378,312,317,284,342,264,268,416,501,379,444,475,601,908,2104,1731,1829,1266,1431,1491,1796,1526,1364,1652,1758,1652,1639,1809,2688];
	Bolivia integer;

	Guyanaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,20,15,59,37,34,10,19,80,36,68,50,52,48,41,46,65,51,61,61,72,73,85,53,58,58,60,69,68,65,54,38,45,63,59,75,73,67,57];
	Guyana integer;

	Paraguayarray integer[] := ARRAY[2,2,1,0,1,0,1,6,7,9,10,35,20,20,27,35,56,56,56,75,103,67,208,130,149,182,221,188,326,473,314,365,354,390,381,326,398,418,549,566,797,1015,859,726,847,807,835,868,812,742,1035,883,1101,967,959,1146];
	Paraguay integer;

	Surinamearray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,38,34,72,34,31,68,119,102,48,35,23,15,20,20,21,78,27,34,36,39,22,45,41,39,50,44,53,67,102,54];
	Suriname integer;

	Uruguayarray integer[] := ARRAY[1,4,3,2,7,12,20,18,24,19,34,102,143,93,158,94,82,94,81,175,235,138,158,169,202,250,377,544,392,576,595,831,597,467,409,447,386,542,547,471,445,663,560,598,678,655,768,761,774,804,750,720,879,472,384,474];
	Uruguay integer;

	Venezuelaarray integer[] := ARRAY[3,1,4,18,19,26,28,87,83,244,204,135,180,173,453,287,368,245,325,513,829,635,692,614,560,1027,1237,2584,2337,2211,2091,2941,2742,1144,1051,1303,1012,1108,1672,1234,1301,1742,1485,1585,1263,1286,1221,1592,1575,1593,1688,1728,1714,1012,1348,2097];
	Venezuela integer;



BEGIN

FOREACH Barbados IN ARRAY Barbadosarray LOOP 
	for j IN 1..Barbados LOOP
	   INSERT INTO foreigner_america values (k,'Barbados',year+i);
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

FOREACH Colombia IN ARRAY Colombiaarray LOOP 
	for j IN 1..Colombia LOOP
	   INSERT INTO foreigner_america values (k,'Colombia',year+i);
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

FOREACH Chile IN ARRAY Chilearray LOOP 
	for j IN 1..Chile LOOP
	   INSERT INTO foreigner_america values (k,'Chile',year+i);
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

FOREACH Canada IN ARRAY Canadaarray LOOP 
	for j IN 1..Canada LOOP
	   INSERT INTO foreigner_america values (k,'Canada',year+i);
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

FOREACH CostaRica IN ARRAY CostaRicaarray LOOP 
	for j IN 1..CostaRica LOOP
	   INSERT INTO foreigner_america values (k,'Costa Rica',year+i);
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

FOREACH Cuba IN ARRAY Cubaarray LOOP 
	for j IN 1..Cuba LOOP
	   INSERT INTO foreigner_america values (k,'Cuba',year+i);
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

FOREACH DominicanRepublic IN ARRAY DominicanRepublicarray LOOP 
	for j IN 1..DominicanRepublic LOOP
	   INSERT INTO foreigner_america values (k,'Dominican Republic',year+i);
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

FOREACH Ecuador IN ARRAY Ecuadorarray LOOP 
	for j IN 1..Ecuador LOOP
	   INSERT INTO foreigner_america values (k,'Ecuador',year+i);
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

FOREACH ElSalvador IN ARRAY ElSalvadorarray LOOP 
	for j IN 1..ElSalvador LOOP
	   INSERT INTO foreigner_america values (k,'El Salvador',year+i);
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

FOREACH Guatemala IN ARRAY Guatemalaarray LOOP 
	for j IN 1..Guatemala LOOP
	   INSERT INTO foreigner_america values (k,'Guatemala',year+i);
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

FOREACH Haiti IN ARRAY Haitiarray LOOP 
	for j IN 1..Haiti LOOP
	   INSERT INTO foreigner_america values (k,'Haiti',year+i);
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

FOREACH Mexico IN ARRAY Mexicoarray LOOP 
	for j IN 1..Mexico LOOP
	   INSERT INTO foreigner_america values (k,'Mexico',year+i);
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

FOREACH Brazil IN ARRAY Brazilarray LOOP 
	for j IN 1..Brazil LOOP
	   INSERT INTO foreigner_america values (k,'Brazil',year+i);
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

FOREACH USA IN ARRAY USAarray LOOP 
	for j IN 1..USA LOOP
	   INSERT INTO foreigner_america values (k,'United States',year+i);
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

FOREACH Peru IN ARRAY Peruarray LOOP 
	for j IN 1..Peru LOOP
	   INSERT INTO foreigner_america values (k,'Peru',year+i);
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

FOREACH Bahamas IN ARRAY Bahamasarray LOOP 
	for j IN 1..Bahamas LOOP
	   INSERT INTO foreigner_america values (k,'Bahamas',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;


FOREACH Belizes IN ARRAY Belizesarray LOOP 
	for j IN 1..Belizes LOOP
	   INSERT INTO foreigner_america values (k,'Belize',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;


FOREACH Dominica IN ARRAY Dominicaarray LOOP 
	for j IN 1..Dominica LOOP
	   INSERT INTO foreigner_america values (k,'Dominica',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Honduras IN ARRAY Hondurasarray LOOP 
	for j IN 1..Honduras LOOP
	   INSERT INTO foreigner_america values (k,'Honduras',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;


FOREACH Jamaica IN ARRAY Jamaicaarray LOOP 
	for j IN 1..Jamaica LOOP
	   INSERT INTO foreigner_america values (k,'Jamaica',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Nicaragua IN ARRAY Nicaraguaarray LOOP 
	for j IN 1..Nicaragua LOOP
	   INSERT INTO foreigner_america values (k,'Nicaragua',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Panama IN ARRAY Panamaarray LOOP 
	for j IN 1..Panama LOOP
	   INSERT INTO foreigner_america values (k,'Panama',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Saintlucia IN ARRAY Saintluciaarray LOOP 
	for j IN 1..Saintlucia LOOP
	   INSERT INTO foreigner_america values (k,'Saint Lucia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Saintvincent IN ARRAY Saintvincentarray LOOP 
	for j IN 1..Saintvincent LOOP
	   INSERT INTO foreigner_america values (k,'Saint Vincent',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Saintkittsandnevis IN ARRAY Saintkittsandnevisarray LOOP 
	for j IN 1..Saintkittsandnevis LOOP
	   INSERT INTO foreigner_america values (k,'Saint Christopher and Nevis',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Trinidadandtobago IN ARRAY Trinidadandtobagoarray LOOP 
	for j IN 1..Trinidadandtobago LOOP
	   INSERT INTO foreigner_america values (k,'Trinidad and Tobago',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Grenada IN ARRAY Grenadaarray LOOP 
	for j IN 1..Grenada LOOP
	   INSERT INTO foreigner_america values (k,'Grenada',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Antiguaandbarbuda IN ARRAY Antiguaandbarbudaarray LOOP 
	for j IN 1..Antiguaandbarbuda LOOP
	   INSERT INTO foreigner_america values (k,'Antigua and Barbuda',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Argentina IN ARRAY Argentinaarray LOOP 
	for j IN 1..Argentina LOOP
	   INSERT INTO foreigner_america values (k,'Argentina',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Bolivia IN ARRAY Boliviaarray LOOP 
	for j IN 1..Bolivia LOOP
	   INSERT INTO foreigner_america values (k,'Bolivia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Guyana IN ARRAY Guyanaarray LOOP 
	for j IN 1..Guyana LOOP
	   INSERT INTO foreigner_america values (k,'Guyana',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Paraguay IN ARRAY Paraguayarray LOOP 
	for j IN 1..Paraguay LOOP
	   INSERT INTO foreigner_america values (k,'Paraguay',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Suriname IN ARRAY Surinamearray LOOP 
	for j IN 1..Suriname LOOP
	   INSERT INTO foreigner_america values (k,'Suriname',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Uruguay IN ARRAY Uruguayarray LOOP 
	for j IN 1..Uruguay LOOP
	   INSERT INTO foreigner_america values (k,'Uruguay',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Venezuela IN ARRAY Venezuelaarray LOOP 
	for j IN 1..Venezuela LOOP
	   INSERT INTO foreigner_america values (k,'Venezuela',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

RETURN 0;

END;
$$ LANGUAGE plpgsql;
