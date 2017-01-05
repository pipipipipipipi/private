CREATE OR REPLACE FUNCTION insert_Asia() RETURNS INTEGER AS $$

DECLARE
	year integer := 1950;
	k integer := 1;
	i integer := 0;
	j integer;

	afghanistanarray integer[] := ARRAY[0,1,2,4,5,9,16,12,33,34,16,30,23,33,50,56,81,63,78,122,145,153,144,126,166,149,213,311,240,273,176,157,193,186,235,210,191,239,225,189,217,254,196,213,306,297,434,438,756,832,732,258,381,598,1029,2142];
	afghanistan integer;

	chinaarray integer[] := ARRAY[2095,3789,3958,5214,5356,6449,5969,7072,6463,6595,7898,10262,12008,14365,562,576,503,150,11,16,139,283,994,1991,3161,4441,4018,4039,5951,11622,18336,17550,20532,26606,51010,100972,75275,73030,112389,100144,117814,142150,187681,204302,210476,229965,257393,283467,299573,327005,385296,444441,527796,537700,741659,780924];
	china integer;

	indiaarray integer[] := ARRAY[343,698,792,1078,971,1292,1705,1340,1977,2161,2680,3350,3234,2708,3334,3701,3919,4492,5277,5885,15276,7886,6652,7377,7098,7323,8078,8837,11561,11673,13997,16038,17265,18250,20333,24385,20300,20956,21736,21500,20623,20302,21353,22429,22969,25070,28346,33316,34819,36435,39845,41520,45693,45450,52379,58450];
	india integer;

	arabarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,34,31,139,109,170,205,127,187,242,272,289,357,401,291,226,242,196,335,293,378,358,433,305,336,356,416,383,421,401,532,462,816,641];
	arab integer;

	myanmararray integer[] := ARRAY[36,25,88,103,158,242,351,604,670,426,614,836,513,323,177,266,254,256,247,196,296,227,211,263,267,292,318,385,402,445,472,556,608,578,633,699,806,866,1097,1947,2366,4371,2992,2386,2304,2522,3135,2966,2814,3295,3550,3195,3585,3509,3945,4333];
	myanmar integer;

	bahrainarray integer[] := ARRAY[0,0,2,0,3,0,4,2,4,4,2,14,10,2,7,6,10,11,17,17,29,25,26,22,79,57,148,121,131,125,170,256,245,295,294,375,261,183,112,173,121,172,212,167,261,128,225,120,175,175,170,160,205,153,344,417];
	bahrain integer;

	bhutanarray integer[] := ARRAY[1,0,0,0,0,0,0,6,3,0,0,1,0,0,0,2,2,2,19,20,23,10,17,26,15,20,22,3,22,41,37,37,89,55,54,50,52,45,61,125,139,113,105,126,133,110,139,183,156,142,153,201,186,223,263,339];
	bhutan integer;
	
	bangladesharray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,147,490,490,474,710,783,1192,1304,1404,1325,1128,1304,1593,2299,4417,5854,14500,3425,3078,3366,3280,3112,3445,3669,3949,4239,4012,4570,5524,5901,6227,7229,8501,8377];
	bangladesh integer;

	bruneiarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,515,863,621,598,565,521,661,511,654,601,868,916,775,936,755,482,550,622,724,653,655,762];
	brunei integer;

	cambodiaarray integer[] := ARRAY[0,8,5,16,28,86,97,136,208,215,254,273,221,225,285,221,223,344,363,452,300,285,410,376,349,87,24,10,47,48,118,96,206,152,248,137,75,222,159,197,184,241,532,625,797,819,997,1097,1052,1379,1584,1946,2025,2187,2512,2975];
	cambodia integer;
		
	srilankaarray integer[] := ARRAY[18,9,71,39,91,86,139,144,187,252,274,311,252,338,255,245,405,457,501,565,596,415,541,786,721,873,1003,963,1197,1396,1489,1708,2000,2126,2917,3826,3184,3452,3944,6769,5005,5544,5704,4269,4394,4933,5619,7218,8284,7695,7350,8136,9566,9231,10498,11998];
	srilanka integer;

	taiwanarray integer[] := ARRAY[5,1,2,0,0,0,0,0,0,0,0,0,0,0,12357,15583,17744,20789,25115,27501,46535,38774,47536,50866,60876,77091,82898,88813,99237,165708,235549,305233,311125,331634,351294,356934,300272,360636,392723,501907,610652,686076,745835,700294,681183,614931,756785,857877,874985,963701,944019,838001,909654,816692,1117950,1315594];
	taiwan integer;

	hongkongarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,3844,4326,4229,4840,5567,6199,12506,8112,12645,16893,15463,19318,22721,25620,23273,24094,32239,46614,59898,64727,52750,49153,32271,30569,29127,32007,38622,37483,39460,33391,31535,20378,27761,30806,53278,42283,49423,74704,136482,163254,226321,250366];
	hongkong integer;

	cyprusarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,7,4,11,11,10,10,17,22,28,56,28,23,44,42,32,49,90,147,146,120,166,138,197,199,199,186,273,232,255,277,301,315,275,276,270,273,461,582,405,347,449,440,386,431,410];
	cyprus integer;

	timorarray integer[] :=ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,56,92,133,120];
	timor integer;
	
	indonesiaarray integer[] := ARRAY[18,132,231,366,409,533,676,926,1311,1267,1694,2510,2423,2626,4498,4656,3699,4814,4134,4936,8692,6268,6549,8716,9660,11377,13262,15245,14392,12978,17854,24368,27452,31690,37965,47541,31649,24254,21425,26205,32605,34360,33374,31711,31044,31265,36837,43313,25747,33094,39389,42900,44987,51160,50730,56010];
	indonesia integer;

	iranarray integer[] := ARRAY[4,6,18,49,77,72,84,135,350,221,254,329,317,380,649,471,602,644,706,966,1989,1369,1382,1856,2357,3490,4639,4916,5172,3368,4145,1367,1627,4190,10559,23949,16404,20325,14693,17050,32125,47976,15415,4389,3658,3124,3400,4288,4871,4958,5334,5301,5666,6038,6342,6534];
	iran integer;

	iraqarray integer[] := ARRAY[11,9,6,15,7,12,15,44,29,16,46,54,71,60,131,85,85,105,95,86,223,117,130,123,438,495,582,695,924,1367,1366,1543,1578,974,947,1076,746,508,560,949,688,121,124,91,70,76,90,59,93,117,124,128,159,216,595,697];
	iraq integer;

	israelarray integer[] := ARRAY[3,12,42,70,130,113,129,215,232,269,411,315,441,489,648,794,837,778,929,1155,1527,1551,1910,1771,1672,1722,1771,3024,3219,2978,3301,3852,4491,7976,5713,5523,6137,6268,6547,6818,7689,9085,8514,8310,6460,6260,7203,8536,8660,9100,12061,10787,11067,10534,11498,11980];
	israel integer;
	
	jordanarray integer[] := ARRAY[0,0,1,0,0,2,1,4,7,15,16,30,35,68,64,42,53,66,68,61,180,131,133,139,179,233,447,378,442,514,592,690,714,880,776,754,572,532,526,495,441,510,703,659,644,743,609,582,630,741,654,667,783,742,964,1312];
	jordan integer;

	koreaarray integer[] := ARRAY[825,1035,1693,3772,3073,1227,1140,2887,3735,2530,5752,7731,7808,10551,18865,17065,25791,33558,39634,44654,71790,77545,85757,110804,124263,129186,141123,156605,184101,199146,212973,250709,284598,283971,292483,296708,299602,360159,515807,806065,978984,1097601,1094724,1069450,1140372,1103566,1224441,1236597,960556,1160034,1286583,1342987,1472096,1621903,1774872,2008418];
	korea integer;

	northkoreaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,152,3,4,0,0,6,10,52,123,632,675,586,644,1132,1782,2678,4236,4660,4731,4813,5812,8222,9070,11627,11804,15035,14813,15135,15885,13397,14565,15708,16132,15061,13519,13159,13953,13246,15576,8899,9988,10686];
	northkorea integer;

	kuwaitarray integer[] := ARRAY[0,0,1,5,0,2,13,13,10,23,18,35,71,64,82,64,93,103,132,118,216,158,113,134,175,209,341,410,374,431,491,645,730,847,764,916,625,455,375,387,343,257,430,438,656,506,328,336,460,291,368,427,616,383,672,601];
	kuwait integer;

	laosarray integer[] := ARRAY[0,0,2,0,3,3,28,133,200,96,86,104,143,63,110,119,167,155,141,165,320,184,202,242,413,328,45,28,19,49,156,257,100,85,101,142,159,145,245,413,520,679,653,550,622,850,945,878,1075,1123,1357,1547,1625,2261,1967,1992];
	laos integer;

	lebanonarray integer[] := ARRAY[7,2,6,4,17,18,26,58,35,62,106,140,271,331,428,253,235,235,314,293,590,428,397,453,422,493,390,525,508,598,836,815,748,925,859,762,483,437,436,410,452,504,499,447,411,406,479,526,516,620,521,581,769,619,756,858];
	lebanon integer;

	malaysiaarray integer[] := ARRAY[1,1,7,0,7,4,7,83,334,354,740,1004,1151,1479,3081,3117,2589,2994,3852,3536,6939,3733,4300,6375,6855,8977,8786,9834,9377,10645,14688,20896,24120,52460,64768,71021,45589,40080,45887,54569,58112,78019,61655,46935,43616,48864,53069,55491,42768,53961,64157,61221,66549,67515,73125,78645];
	malaysia integer;

	mongoliaarray integer[] := ARRAY[0,0,0,0,0,0,0,5,4,4,4,9,5,11,44,8,2,16,15,13,15,19,17,27,39,55,42,80,67,101,119,85,80,88,74,140,113,99,133,194,523,828,936,1280,1557,1461,1614,2066,2371,3086,4371,6600,5607,5858,5913,7614];
	mongolia integer;
					 
	omanarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,2,2,3,3,4,2,4,5,27,20,56,60,59,65,46,127,145,179,199,191,126,130,159,127,189,140,151,158,265,147,162,196,206,162,228,212,245,361,414,457];
	oman integer;

	maldivesarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,4,8,5,0,2,1,8,2,7,6,9,23,22,27,34,57,90,56,62,77,73,80,82,96,97,154,142,139,129,136,160,143,154,150,137,170,175];
	maldives integer;

	nepalarray integer[] := ARRAY[0,0,6,0,3,7,31,15,38,38,52,29,38,65,99,70,121,146,157,153,313,182,233,231,277,326,339,387,564,468,472,606,584,770,777,1001,986,1292,1671,2964,1671,2154,1982,1837,2174,2686,3287,3384,3370,3424,3905,4342,4200,4570,5139,6172];
	nepal integer;

	pakistanarray integer[] := ARRAY[31,107,192,210,212,214,208,238,344,284,471,622,765,1037,1328,1029,1003,979,969,1144,2608,1576,1343,1852,1845,2069,2473,3088,3951,3970,4843,4892,5288,5757,7387,9320,13385,12214,20034,7060,5544,6185,6533,5615,5399,5528,6352,7676,8259,8565,9109,9254,8991,9055,10315,10641];
	pakistan integer;

	philippinesarray integer[] := ARRAY[536,868,869,1472,1584,2476,2919,3653,3875,4991,5508,7128,7225,7938,9105,8945,10824,12028,14190,13573,20477,12672,10860,7874,10411,12574,13073,16138,20375,23223,27902,37483,37878,47887,49511,65529,80508,85267,86567,88296,108292,125329,120660,109353,126739,105838,106394,124856,129053,144305,169755,186262,197136,209525,236291,221309];
	philippines integer;

	qatararray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1,1,8,10,4,8,13,22,40,70,42,59,70,79,136,145,165,199,190,69,100,81,71,77,172,161,209,335,128,175,186,149,248,168,300,231,258,471,523];
	qatar integer;

	saudiarabiaarray integer[] := ARRAY[0,3,1,1,1,4,5,9,24,20,52,54,71,87,86,83,126,132,206,196,263,206,205,258,323,540,686,993,1328,1378,1597,1934,1852,2616,2679,2270,1733,1371,1033,971,1015,1133,1217,1118,1250,993,1208,1228,1730,1486,1314,1388,1727,1163,1349,1987];
	saudiarabia integer;

	syriaarray integer[] := ARRAY[12,17,11,25,23,13,25,30,31,0,0,24,71,99,143,71,67,46,50,108,161,141,132,148,169,260,337,420,412,376,608,663,628,710,455,486,377,409,423,385,410,370,437,461,499,440,544,619,636,680,637,670,677,726,876,1026];
	syria integer;

	singaporearray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,79,1277,1804,2784,3296,5663,4124,5701,8269,7469,9582,10282,11545,11765,12927,18346,25398,31754,41338,43920,42817,33943,35973,35241,38201,43512,43375,41490,39097,41281,41513,51956,62397,59896,68676,74967,70707,78017,78215,91553,96186];
	singapore integer;

	thaiarray integer[] := ARRAY[150,213,451,782,962,1145,1038,1448,1447,1475,1815,2253,2256,2722,3218,3399,4313,5193,5872,6506,10010,6617,6912,7837,8953,11795,14015,15340,14254,14702,17884,23768,31422,43940,45978,44123,30296,33719,41994,49117,69477,105666,97568,72812,63812,57767,68987,67015,54457,64246,73472,77521,86683,95018,121963,136868];
	thai integer;

	turkeyarray integer[] := ARRAY[21,36,26,85,102,169,153,470,867,148,114,161,171,177,240,201,555,461,565,609,1040,511,749,1437,846,1248,1487,1723,841,1045,1576,1601,1721,1935,1760,2701,2279,2713,2225,2716,4141,3265,3647,3880,3536,4302,4485,5227,4936,5125,5690,5100,6566,7101,7254,7577];
	turkey integer;

	vietnamarray integer[] := ARRAY[18,75,20,33,93,351,539,703,560,629,750,867,853,508,993,776,1032,2638,2029,2715,2634,1511,1199,1411,1292,637,342,989,1034,1422,1527,1414,1403,1327,1096,1329,1153,1017,1508,3335,2149,2476,3199,4616,5789,7868,9473,10753,11663,12341,14247,16374,18144,20768,23852,26213];
	vietnam integer;
	
	yemenarray integer[] := ARRAY[0,2,0,0,2,4,2,0,1,0,0,0,2,0,4,1,1,2,4,17,40,21,37,44,67,86,116,127,169,215,243,201,264,287,250,301,207,176,178,168,176,146,160,193,120,121,135,160,164,257,172,179,166,145,203,487];
	yemen integer;


BEGIN

FOREACH afghanistan IN ARRAY afghanistanarray LOOP 
	for j IN 1..afghanistan LOOP
	   INSERT INTO foreigner_asia values (k,'Afghanistan',year+i);
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


FOREACH china IN ARRAY chinaarray LOOP 
	for j IN 1..china LOOP
	   INSERT INTO foreigner_asia values (k,'China',year+i);
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


FOREACH india IN ARRAY indiaarray LOOP 
	for j IN 1..india LOOP
	   INSERT INTO foreigner_asia values (k,'India',year+i);
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

FOREACH arab IN ARRAY arabarray LOOP 
	for j IN 1..arab LOOP
	   INSERT INTO foreigner_asia values (k,'Arab',year+i);
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

FOREACH myanmar IN ARRAY myanmararray LOOP 
	for j IN 1..myanmar LOOP
	   INSERT INTO foreigner_asia values (k,'Myanmar',year+i);
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

FOREACH bahrain IN ARRAY bahrainarray LOOP 
	for j IN 1..bahrain LOOP
	   INSERT INTO foreigner_asia values (k,'Bahrain',year+i);
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

FOREACH bhutan IN ARRAY bhutanarray LOOP 
	for j IN 1..bhutan LOOP
	   INSERT INTO foreigner_asia values (k,'Bhutan',year+i);
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

FOREACH bangladesh IN ARRAY bangladesharray LOOP 
	for j IN 1..bangladesh LOOP
	   INSERT INTO foreigner_asia values (k,'Bangladesh',year+i);
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

FOREACH brunei IN ARRAY bruneiarray LOOP 
	for j IN 1..brunei LOOP
	   INSERT INTO foreigner_asia values (k,'Brunei',year+i);
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

FOREACH cambodia IN ARRAY cambodiaarray LOOP 
	for j IN 1..cambodia LOOP
	   INSERT INTO foreigner_asia values (k,'Cambodia',year+i);
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

FOREACH srilanka IN ARRAY srilankaarray LOOP 
	for j IN 1..srilanka LOOP
	   INSERT INTO foreigner_asia values (k,'Sri Lanka',year+i);
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

FOREACH taiwan IN ARRAY taiwanarray LOOP 
	for j IN 1..taiwan LOOP
	   INSERT INTO foreigner_asia values (k,'Taiwan',year+i);
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

FOREACH hongkong IN ARRAY hongkongarray LOOP 
	for j IN 1..hongkong LOOP
	   INSERT INTO foreigner_asia values (k,'HongKong',year+i);
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

FOREACH cyprus IN ARRAY cyprusarray LOOP 
	for j IN 1..cyprus LOOP
	   INSERT INTO foreigner_asia values (k,'Cyprus',year+i);
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

FOREACH timor IN ARRAY timorarray LOOP 
	for j IN 1..timor LOOP
	   INSERT INTO foreigner_asia values (k,'East Timor',year+i);
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

FOREACH indonesia IN ARRAY indonesiaarray LOOP 
	for j IN 1..indonesia LOOP
	   INSERT INTO foreigner_asia values (k,'Indonesia',year+i);
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

FOREACH iran IN ARRAY iranarray LOOP 
	for j IN 1..iran LOOP
	   INSERT INTO foreigner_asia values (k,'Iran',year+i);
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

FOREACH iraq IN ARRAY iraqarray LOOP 
	for j IN 1..iraq LOOP
	   INSERT INTO foreigner_asia values (k,'Iraq',year+i);
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

FOREACH israel IN ARRAY israelarray LOOP 
	for j IN 1..israel LOOP
	   INSERT INTO foreigner_asia values (k,'Israel',year+i);
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

FOREACH jordan IN ARRAY jordanarray LOOP 
	for j IN 1..jordan LOOP
	   INSERT INTO foreigner_asia values (k,'Jordan',year+i);
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

FOREACH korea IN ARRAY koreaarray LOOP 
	for j IN 1..jordan LOOP
	   INSERT INTO foreigner_asia values (k,'South Korea',year+i);
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

FOREACH northkorea IN ARRAY northkoreaarray LOOP 
	for j IN 1..northkorea LOOP
	   INSERT INTO foreigner_asia values (k,'North Korea',year+i);
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

FOREACH kuwait IN ARRAY kuwaitarray LOOP 
	for j IN 1..kuwait LOOP
	   INSERT INTO foreigner_asia values (k,'Kuwait',year+i);
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

FOREACH laos IN ARRAY laosarray LOOP 
	for j IN 1..laos LOOP
	   INSERT INTO foreigner_asia values (k,'Laos',year+i);
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

FOREACH lebanon IN ARRAY lebanonarray LOOP 
	for j IN 1..lebanon LOOP
	   INSERT INTO foreigner_asia values (k,'Lebanon',year+i);
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

FOREACH malaysia IN ARRAY malaysiaarray LOOP 
	for j IN 1..malaysia LOOP
	   INSERT INTO foreigner_asia values (k,'Malaysia',year+i);
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

FOREACH mongolia IN ARRAY mongoliaarray LOOP 
	for j IN 1..mongolia LOOP
	   INSERT INTO foreigner_asia values (k,'Mongolia',year+i);
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

FOREACH oman IN ARRAY omanarray LOOP 
	for j IN 1..oman LOOP
	   INSERT INTO foreigner_asia values (k,'Oman',year+i);
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

FOREACH maldives IN ARRAY maldivesarray LOOP 
	for j IN 1..maldives LOOP
	   INSERT INTO foreigner_asia values (k,'Maldives',year+i);
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

FOREACH nepal IN ARRAY nepalarray LOOP 
	for j IN 1..nepal LOOP
	   INSERT INTO foreigner_asia values (k,'Nepal',year+i);
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

FOREACH pakistan IN ARRAY pakistanarray LOOP 
	for j IN 1..pakistan LOOP
	   INSERT INTO foreigner_asia values (k,'Pakistan',year+i);
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

FOREACH philippines IN ARRAY philippinesarray LOOP 
	for j IN 1..philippines LOOP
	   INSERT INTO foreigner_asia values (k,'Philippines',year+i);
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

FOREACH qatar IN ARRAY qatararray LOOP 
	for j IN 1..qatar LOOP
	   INSERT INTO foreigner_asia values (k,'Qatar',year+i);
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

FOREACH saudiarabia IN ARRAY saudiarabiaarray LOOP 
	for j IN 1..saudiarabia LOOP
	   INSERT INTO foreigner_asia values (k,'Saudi Arabia',year+i);
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

FOREACH syria IN ARRAY syriaarray LOOP 
	for j IN 1..syria LOOP
	   INSERT INTO foreigner_asia values (k,'Syria',year+i);
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

FOREACH singapore IN ARRAY singaporearray LOOP 
	for j IN 1..singapore LOOP
	   INSERT INTO foreigner_asia values (k,'Singapore',year+i);
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

FOREACH thai IN ARRAY thaiarray LOOP 
	for j IN 1..thai LOOP
	   INSERT INTO foreigner_asia values (k,'Thailand',year+i);
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

FOREACH turkey IN ARRAY turkeyarray LOOP 
	for j IN 1..turkey LOOP
	   INSERT INTO foreigner_asia values (k,'Turkey',year+i);
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

FOREACH vietnam IN ARRAY vietnamarray LOOP 
	for j IN 1..vietnam LOOP
	   INSERT INTO foreigner_asia values (k,'Viet Nam',year+i);
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

FOREACH yemen IN ARRAY yemenarray LOOP 
	for j IN 1..yemen LOOP
	   INSERT INTO foreigner_asia values (k,'Yemen',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
	IF year > 2006 THEN
	   EXIT;
	END IF;
END LOOP;



RETURN 0;

END;
$$ LANGUAGE plpgsql;
