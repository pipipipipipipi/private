CREATE OR REPLACE FUNCTION insert_Europe() RETURNS INTEGER AS $$

DECLARE
	year integer := 1950;
	k integer := 1;
	i integer := 0;
	j integer;

	Austriaarray integer[] := ARRAY[2,0,25,32,22,108,144,133,192,376,334,485,538,524,709,623,852,847,1125,1427,2436,1509,2079,2855,1869,2493,2894,4093,3421,4044,4530,4698,4907,5874,5462,6476,6274,5859,6717,8754,8261,8070,8168,8224,8438,8564,9636,10393,10215,9506,10322,9991,10513,10341,11937,12677];
	Austria integer;

	Belgiumarray integer[] := ARRAY[51,68,184,520,85,134,120,179,175,224,244,415,557,573,850,666,858,911,899,1596,4117,1877,1898,2236,2225,2756,3750,4235,5074,4683,5530,6169,4867,4994,5241,6226,5396,6193,6544,7668,8901,8108,7918,7912,8184,8183,8912,9725,10132,11099,11373,11249,11873,11232,12414,14595];
	Belgium integer;

	Bulgariaarray integer[] := ARRAY[0,0,0,0,0,0,0,2,4,2,28,15,25,43,157,86,108,148,124,189,541,164,335,385,367,472,370,521,402,496,624,643,703,784,596,903,827,1043,969,942,1172,646,579,708,929,1056,1111,1117,1149,1362,1498,1517,1629,1561,1947,2398];
	Bulgaria integer;

	Croatiaarray integer[] := ARRAY[0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,207,196,470,561,598,810,805,867,873,980,1681,1157,1090,1616];
	Croatia integer;

	Denmarkarray integer[] := ARRAY[231,204,141,260,234,353,376,650,674,547,739,873,1088,1085,1441,1353,1443,1847,2208,2475,2998,2708,3125,3353,3500,3362,3966,4403,5276,4955,5971,6405,6263,6338,7062,7586,7184,7371,7708,7933,7928,7953,9443,8690,9085,8950,9592,9997,9758,9838,10347,10026,11169,10817,11350,12751];
	Denmark integer;

	Finlandarray integer[] := ARRAY[7,12,14,11,33,55,31,46,56,64,112,127,226,284,562,308,366,383,427,692,1125,735,978,988,1286,1235,1448,2030,2323,1898,2608,2812,3240,5716,6586,8020,8221,8842,9019,9333,9024,9294,7982,7844,7678,7783,7982,9403,10606,10921,11289,9996,9575,10620,12011,13153];
	Finland integer;

	Francearray integer[] := ARRAY[501,558,590,1049,763,1318,1209,1343,1709,2070,2528,3208,4156,4527,7462,6082,7109,6795,7560,9435,21168,10422,14563,18628,15397,15983,18714,20960,22999,22217,25855,27616,29717,29133,34624,40194,35890,37663,41214,48171,51995,51143,49768,50463,53883,55689,59120,63814,69026,72356,81528,85234,89546,87722,98826,114397];
	France integer;
	
	Germanyarray integer[] := ARRAY[103,205,320,487,806,942,1554,1711,2049,2218,3184,4140,5178,5813,8283,7599,8528,9023,11639,14763,23734,18686,21632,26215,25843,26101,27856,33938,35743,38458,40532,41723,42066,44532,49773,49604,50480,55271,58273,63185,66827,62337,65101,64102,65755,69939,77717,84456,88089,89355,90605,89895,96070,95691,108773,121261];
	Germany integer;

	Italyarray integer[] := ARRAY[100,204,174,261,190,279,401,377,544,793,1142,1622,1797,2266,3735,2442,2594,3273,3272,5251,11265,6378,7324,9871,8271,8203,8531,9530,11780,10643,12405,14639,13725,14304,15812,21622,18953,21004,23644,27892,29969,30452,27179,25647,25217,25429,29048,31370,31211,30839,34262,35991,37202,36665,39870,45951];
	Italy integer;

	Norwayarray integer[] := ARRAY[148,268,306,431,146,177,210,538,504,405,561,653,842,773,999,1284,1431,1817,1972,2030,2684,2363,3017,2916,3570,4147,4073,5174,5256,4349,5235,6554,6492,6326,5982,8066,7144,5675,5139,4659,5148,5343,5404,5915,5472,6122,6713,8119,8510,7367,7326,6880,7070,7474,8290,8894];
	Norway integer;
	
	Polandarray integer[] := ARRAY[32,18,9,8,13,3,8,55,39,40,169,78,86,262,367,127,239,142,186,255,634,476,1015,855,860,1027,1200,1225,1243,1214,1253,1009,582,869,965,1344,1296,1502,2038,2795,3196,2235,2261,2177,2654,2843,3178,3476,3883,4863,4833,4752,5377,5551,6463,7249];
	Poland integer;
	
	Portugalarray integer[] := ARRAY[92,138,140,118,162,172,178,166,209,200,273,246,260,371,477,394,533,458,523,663,2243,836,1149,1732,1439,991,1128,1333,1611,1843,2278,3421,4375,4780,3918,4667,3558,4173,4260,4526,5813,5534,6204,6682,5533,4235,4993,5320,6970,7852,7936,7132,9430,9556,11730,10943];
	Portugal integer;
	
	Romaniaarray integer[] := ARRAY[0,4,1,0,0,2,10,3,5,7,43,57,69,133,354,134,261,266,194,119,202,220,287,359,428,468,424,607,598,532,363,319,190,284,240,327,305,290,314,307,640,625,719,746,1104,1657,1608,1915,2976,4067,5104,6556,7734,8039,8120,7857];
	Romania integer;
	
	Russiaarray integer[] := ARRAY[172,122,16,5,71,42,71,407,561,444,918,959,779,913,1962,1650,2723,2915,2989,3011,4639,2764,4953,3804,4722,5443,5024,4998,6220,6037,6103,6383,5491,7404,7379,9416,8687,9249,9502,18087,24135,30521,25879,31405,25125,24232,26349,30120,26896,23064,30290,33772,36693,43738,56253,62969];
	Russia integer;
	
	SanMarinoarray integer[] := ARRAY[0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,2,0,9,2,13,2,2,5,1,8,5,4,2,8,4,12,7,11,10,11,8,6,3,7,18,23,12,17,26,15,15,17,28,44,21,50,40,59,32,43];
	SanMarino integer;
	
	Spainarray integer[] := ARRAY[65,102,113,165,152,155,181,221,212,276,373,360,510,498,1034,1017,1243,1073,1112,1727,3555,2709,4473,6436,4946,5542,5904,8094,8192,6200,8930,8470,7283,7463,5780,7178,8298,10223,11298,13063,16391,16773,13854,9707,10310,11757,12623,12039,14164,13196,14654,13587,15908,15369,19341,26515];
	Spain integer;
	
	Swedenarray integer[] := ARRAY[114,276,422,624,439,479,438,541,781,891,1146,1418,1889,2014,2260,2107,2287,2736,3217,4131,5371,4100,5254,4789,5668,6115,7348,8808,9594,9469,10613,11457,11386,12789,13390,14770,14259,14763,15423,15363,15827,14940,15070,14265,15284,15942,17559,20037,20574,20720,21251,19876,21349,19076,21618,23709];
	Sweden integer;

	Switzerlandarray integer[] := ARRAY[76,127,153,372,486,491,485,741,934,981,1346,1695,2175,2212,2506,2639,2830,2990,3427,4432,11803,4786,5720,6243,7310,7498,6862,7444,8585,9025,9427,9712,10610,11147,12236,14552,14894,16063,16648,17544,16784,15748,15640,15819,16024,17678,17637,19323,17599,17319,17896,17718,18196,18009,20915,24101];
	Switzerland integer;
	
	UKarray integer[] := ARRAY[1669,2667,2920,3692,3918,4589,6098,5652,5319,6262,7820,9810,11356,12938,15041,15518,17004,18890,20388,24755,36777,29853,35384,41338,39393,45872,53860,61834,64457,71387,89368,120771,151545,174384,167521,183863,142697,144463,149954,172833,212043,105535,107425,110698,123638,131105,145584,170251,186454,188036,198675,203551,225074,206331,222284,229758];
	UK integer;
	
	Hungaryarray integer[] := ARRAY[4,6,2,4,29,4,4,4,8,4,49,49,75,105,512,136,125,119,167,275,406,286,351,380,631,470,584,808,530,851,695,925,850,1041,1496,1944,1690,2572,2008,1912,2081,2077,2456,2450,2853,3590,2968,3173,4070,3974,4433,4307,4515,4014,4565,4538];
	Hungary integer;
	
	Icelandarray integer[] := ARRAY[0,0,3,3,2,1,5,2,6,1,8,9,14,15,45,25,61,50,33,89,131,41,76,73,35,55,65,82,113,133,147,167,235,188,238,219,296,344,453,547,420,557,342,376,402,380,543,572,485,506,662,575,557,571,720,987];
	Iceland integer;
	
	Irelandarray integer[] := ARRAY[47,37,23,60,33,80,65,70,66,66,79,100,137,145,201,177,215,292,320,519,819,651,713,873,762,899,1073,1045,1161,1196,1552,1518,1714,1861,1670,2214,2267,2755,3352,4105,4755,5326,5305,5745,6366,7104,8253,10833,10987,10523,11005,11023,18196,11089,11978,14324];
 	Ireland integer;
	
	Georgiaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,45,129,181,220,160,221,179,171,237,348];
	Georgia integer;

	Albaniaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,2,3,4,0,2,0,0,0,0,1,0,0,4,5,0,13,3,11,10,14,18,14,2,0,4,3,9,15,10,16,23,36,49,68,69,67,81,138,112,136,122,162,143];
	Albania integer;

	Belarusarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,7,166,421,566,532,761,872,924,1139,1248,1205];
	Belarus integer;

	Czechoslovakiaarray integer[] := ARRAY[5,0,5,1,3,9,12,54,75,303,112,140,107,150,328,217,225,256,347,654,1104,311,582,499,576,505,773,533,697,790,865,783,1196,1287,917,1596,1431,681,1256,1084,1268,1746,1815,0,0,0,0,0,0,0,0,0,0,0,0,0];
	Czechoslovakia integer;

	Czechrepublicarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1534,1885,2355,2589,2712,3130,3540,3545,4332,4318,4781,5005,5908];
	Czechrepublic integer;

	Estoniaarray integer[] := ARRAY[2,2,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,87,77,136,176,204,379,414,409,541,530,802,682,769,924];
	Estonia integer;

	Greecearray integer[]:= ARRAY[32,193,137,138,64,365,1291,1438,454,152,174,242,208,263,484,460,555,722,891,1262,1633,1264,1406,1505,1767,1681,2153,2458,2111,2287,2429,2470,2503,2491,2709,2550,2340,2440,2534,2717,3850,4073,3707,3539,3150,2522,2651,2884,2922,3299,3071,3166,3573,3130,3461,4369];
	Greece integer;

	Kyrgyzstanarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,73,118,203,154,244,228,227,323,403,468];
	Kyrgyzstan integer;

	Kazakhstanarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,6,24,243,526,731,642,572,903,783,1153,1217,1723];
	Kazakhstan integer;

	Liechtensteinarray integer[] := ARRAY[0,1,1,1,1,1,0,1,3,1,1,1,4,2,9,3,5,2,3,3,24,12,22,9,7,21,20,24,28,43,26,29,35,33,35,58,37,51,42,54,51,57,61,82,61,100,79,80,98,84,101,92,90,92,96,119];
	Liechtenstein integer;


	Luxembourgarray integer[] := ARRAY[1,1,0,1,1,0,2,2,1,6,4,12,28,12,41,18,22,34,37,51,111,67,58,85,84,116,135,150,147,186,249,199,237,211,182,261,248,358,336,444,475,444,396,336,343,333,291,422,369,460,452,408,406,410,453,690];
	Luxembourg integer;

	Latviaarray integer[] := ARRAY[2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11,62,98,142,169,174,175,330,284,361,487,397,514,610,640];
	Latvia integer;

	Lithuaniaarray integer[] := ARRAY[2,1,1,2,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,41,82,99,107,284,269,332,455,588,489,978,1219,1126,1077,1376];
	Lithuania integer;

	Monacoarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,2,3,1,0,7,6,5,2,4,8,15,10,5,7,12,9,10,5,16,22,34,31,27,30,84,69,19,20,21,37,38,16,10,16,20,14,26,29,37,11,29,28,50,21,27,28];
	Monaco integer;

	Maltaarray integer[] := ARRAY[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,5,18,19,99,18,18,38,159,68,68,73,63,62,35,68,78,81,76,103,67,72,67,102,124,131,105,147,154,187,288,217,267,213,219,206,215,177,219,254];
	Malta integer;

	Moldovaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,13,36,58,85,63,84,135,178,260,293,350];
	Moldova integer;

	Macedoniaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,54,55,129,191,193,163,219,168,159,153,224,197];
	Macedonia integer;

	Netherlandsarray integer[] := ARRAY[144,256,348,644,478,527,504,789,923,1772,1691,1678,2423,1800,2514,2744,2903,3289,3246,4586,6859,4975,5475,6219,6333,7041,8388,9686,10508,9664,10789,12055,11452,12825,14203,15467,14536,15987,15904,16492,17715,18193,18435,18054,18487,19883,20171,22356,23800,24642,27864,24431,24504,25563,29938,31080];
	Netherlands integer;

	Turkmenistanarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,40,49,29,57,55,67,64,24,63];
	Turkmenistan integer;

	Tajikistanarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,21,51,47,79,167,166,151,200,159,293];
	Tajikistan integer;
/*
UK(HongKong),0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,112060,132513,113063,109502,72811,138254,231599,299667,208172,192946,187113,154758,97720,76773,52176
*/

	Ukrainearray integer[] := ARRAY[0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,9,29,73,345,1295,1727,1676,2690,3179,3964,4704,4717,5216];
	Ukraine integer;

	Uzbekistanarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,12,198,494,603,641,815,889,1042,1180,1223,1359];
	Uzbekistan integer;

	Vaticanarray integer[] := ARRAY[1,1,0,2,0,0,3,0,8,8,9,3,10,6,13,10,9,10,14,5,29,17,9,7,13,26,16,12,15,22,10,52,25,37,15,8,16,20,14,16,8,14,14,11,14,8,10,9,18,18,13,16,17,14,5,6];
	Vatican integer;

	Yugoslaviaarray integer[] := ARRAY[3,7,18,11,4,17,13,21,48,92,92,148,121,161,327,340,143,229,382,418,914,832,479,589,846,1221,1199,1479,1634,1338,1335,1265,1176,1029,991,1419,1047,1207,1186,1387,1578,1797,917,933,711,815,653,259,144,84,35,25,4,1,0,0];
	Yugoslavia integer;

	Armeniaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,3,16,30,60,118,100,93,167,159,161,172,271];
	Armenia integer;

	Azerbaijanarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,8,43,90,176,146,137,183,203,213,203,410];
	Azerbaijan integer;

	Andorraarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,1,12,5,18,18,18,12,20,11,20,54];
	Andorra integer;

	Sloveniaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,137,209,437,469,621,606,843,797,785,815,902,785,908,1032];
	Slovenia integer;

	Slovakiaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,600,725,715,1019,1377,1354,1314,1377,1558,1949,2028,1991,1847];
	Slovakia integer;

	--Slovakiaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,600,725,715,1019,1377,1354,1314,1377,1558,1949,2028,1991,1847];
	--Slovakia integer[];

	Bosniaherzegovinaarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23,60,138,154,126,151,168,169,247,209];
	Bosniaherzegovina integer;

	Serbiaandmontenegroarray integer[] := ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,192,554,476,620,751,706,762,802,803];
	Serbiaandmontenegro integer;



BEGIN

FOREACH Austria IN ARRAY Austriaarray LOOP 
	for j IN 1..Austria LOOP
	   INSERT INTO foreigner_europe values (k,'Austria',year+i);
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

FOREACH Belgium IN ARRAY Belgiumarray LOOP 
	for j IN 1..Belgium LOOP
	   INSERT INTO foreigner_europe values (k,'Belgium',year+i);
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

FOREACH Bulgaria IN ARRAY Bulgariaarray LOOP 
	for j IN 1..Bulgaria LOOP
	   INSERT INTO foreigner_europe values (k,'Bulgaria',year+i);
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

FOREACH Croatia IN ARRAY Croatiaarray LOOP 
	for j IN 1..Croatia LOOP
	   INSERT INTO foreigner_europe values (k,'Croatia',year+i);
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

FOREACH Denmark IN ARRAY Denmarkarray LOOP 
	for j IN 1..Denmark LOOP
	   INSERT INTO foreigner_europe values (k,'Denmark',year+i);
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

FOREACH Finland IN ARRAY Finlandarray LOOP 
	for j IN 1..Finland LOOP
	   INSERT INTO foreigner_europe values (k,'Finland',year+i);
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

FOREACH France IN ARRAY Francearray LOOP 
	for j IN 1..France LOOP
	   INSERT INTO foreigner_europe values (k,'France',year+i);
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

FOREACH Germany IN ARRAY Germanyarray LOOP 
	for j IN 1..Germany LOOP
	   INSERT INTO foreigner_europe values (k,'Germany',year+i);
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

FOREACH Italy IN ARRAY Italyarray LOOP 
	for j IN 1..Italy LOOP
	   INSERT INTO foreigner_europe values (k,'Italy',year+i);
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

FOREACH Norway IN ARRAY Norwayarray LOOP 
	for j IN 1..Norway LOOP
	   INSERT INTO foreigner_europe values (k,'Norway',year+i);
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

FOREACH Poland IN ARRAY Polandarray LOOP 
	for j IN 1..Poland LOOP
	   INSERT INTO foreigner_europe values (k,'Poland',year+i);
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

FOREACH Portugal IN ARRAY Portugalarray LOOP 
	for j IN 1..Portugal LOOP
	   INSERT INTO foreigner_europe values (k,'Portugal',year+i);
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

FOREACH Romania IN ARRAY Romaniaarray LOOP 
	for j IN 1..Romania LOOP
	   INSERT INTO foreigner_europe values (k,'Romania',year+i);
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

FOREACH Russia IN ARRAY Russiaarray LOOP 
	for j IN 1..Russia LOOP
	   INSERT INTO foreigner_europe values (k,'Russia',year+i);
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

FOREACH SanMarino IN ARRAY SanMarinoarray LOOP 
	for j IN 1..SanMarino LOOP
	   INSERT INTO foreigner_europe values (k,'San Marino',year+i);
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

FOREACH Spain IN ARRAY Spainarray LOOP 
	for j IN 1..Spain LOOP
	   INSERT INTO foreigner_europe values (k,'Spain',year+i);
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

FOREACH Sweden IN ARRAY Swedenarray LOOP 
	for j IN 1..Sweden LOOP
	   INSERT INTO foreigner_europe values (k,'Sweden',year+i);
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

FOREACH Switzerland IN ARRAY Switzerlandarray LOOP 
	for j IN 1..Switzerland LOOP
	   INSERT INTO foreigner_europe values (k,'Switzerland',year+i);
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

FOREACH UK IN ARRAY UKarray LOOP 
	for j IN 1..UK LOOP
	   INSERT INTO foreigner_europe values (k,'United Kingdom',year+i);
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

FOREACH Hungary IN ARRAY Hungaryarray LOOP 
	for j IN 1..Hungary LOOP
	   INSERT INTO foreigner_europe values (k,'Hungary',year+i);
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

FOREACH Iceland IN ARRAY Icelandarray LOOP 
	for j IN 1..Iceland LOOP
	   INSERT INTO foreigner_europe values (k,'Iceland',year+i);
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

FOREACH Ireland IN ARRAY Irelandarray LOOP 
	for j IN 1..Ireland LOOP
	   INSERT INTO foreigner_europe values (k,'Ireland',year+i);
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

FOREACH Georgia IN ARRAY Georgiaarray LOOP 
	for j IN 1..Georgia LOOP
	   INSERT INTO foreigner_europe values (k,'Georgia',year+i);
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

FOREACH Albania IN ARRAY Albaniaarray LOOP 
	for j IN 1..Albania LOOP
	   INSERT INTO foreigner_europe values (k,'Albania',year+i);
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

FOREACH Belarus IN ARRAY Belarusarray LOOP 
	for j IN 1..Belarus LOOP
	   INSERT INTO foreigner_europe values (k,'Belarus',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Czechoslovakia IN ARRAY Czechoslovakiaarray LOOP 
	for j IN 1..Czechoslovakia LOOP
	   INSERT INTO foreigner_europe values (k,'Czecho Slovakia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Czechrepublic IN ARRAY Czechrepublicarray LOOP 
	for j IN 1..Czechrepublic LOOP
	   INSERT INTO foreigner_europe values (k,'Czech Republic',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Estonia IN ARRAY Estoniaarray LOOP 
	for j IN 1..Estonia LOOP
	   INSERT INTO foreigner_europe values (k,'Estonia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Greece IN ARRAY Greecearray LOOP 
	for j IN 1..Greece LOOP
	   INSERT INTO foreigner_europe values (k,'Greece',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Kyrgyzstan IN ARRAY Kyrgyzstanarray LOOP 
	for j IN 1..Kyrgyzstan LOOP
	   INSERT INTO foreigner_europe values (k,'Kyrgyzstan',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Kazakhstan IN ARRAY Kazakhstanarray LOOP 
	for j IN 1..Kazakhstan LOOP
	   INSERT INTO foreigner_europe values (k,'Kazakhstan',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Liechtenstein IN ARRAY Liechtensteinarray LOOP 
	for j IN 1..Liechtenstein LOOP
	   INSERT INTO foreigner_europe values (k,'Liechtenstein',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Luxembourg IN ARRAY Luxembourgarray LOOP 
	for j IN 1..Luxembourg LOOP
	   INSERT INTO foreigner_europe values (k,'Luxembourg',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Latvia IN ARRAY Latviaarray LOOP 
	for j IN 1..Latvia LOOP
	   INSERT INTO foreigner_europe values (k,'Latvia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Lithuania IN ARRAY Lithuaniaarray LOOP 
	for j IN 1..Lithuania LOOP
	   INSERT INTO foreigner_europe values (k,'Lithuania',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Monaco IN ARRAY Monacoarray LOOP 
	for j IN 1..Monaco LOOP
	   INSERT INTO foreigner_europe values (k,'Monaco',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Malta IN ARRAY Maltaarray LOOP 
	for j IN 1..Malta LOOP
	   INSERT INTO foreigner_europe values (k,'Malta',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Moldova IN ARRAY Moldovaarray LOOP 
	for j IN 1..Moldova LOOP
	   INSERT INTO foreigner_europe values (k,'Moldova',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Macedonia IN ARRAY Macedoniaarray LOOP 
	for j IN 1..Macedonia LOOP
	   INSERT INTO foreigner_europe values (k,'Macedonia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Netherlands IN ARRAY Netherlandsarray LOOP 
	for j IN 1..Netherlands LOOP
	   INSERT INTO foreigner_europe values (k,'Netherlands',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Turkmenistan IN ARRAY Turkmenistanarray LOOP 
	for j IN 1..Turkmenistan LOOP
	   INSERT INTO foreigner_europe values (k,'Turkmenistan',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Tajikistan IN ARRAY Tajikistanarray LOOP 
	for j IN 1..Tajikistan LOOP
	   INSERT INTO foreigner_europe values (k,'Tajikistan',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Ukraine IN ARRAY Ukrainearray LOOP 
	for j IN 1..Ukraine LOOP
	   INSERT INTO foreigner_europe values (k,'Ukraine',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Uzbekistan IN ARRAY Uzbekistanarray LOOP 
	for j IN 1..Uzbekistan LOOP
	   INSERT INTO foreigner_europe values (k,'Uzbekistan',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Vatican IN ARRAY Vaticanarray LOOP 
	for j IN 1..Vatican LOOP
	   INSERT INTO foreigner_europe values (k,'Vatican City',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Yugoslavia IN ARRAY Yugoslaviaarray LOOP 
	for j IN 1..Yugoslavia LOOP
	   INSERT INTO foreigner_europe values (k,'Yugoslavia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Armenia IN ARRAY Armeniaarray LOOP 
	for j IN 1..Armenia LOOP
	   INSERT INTO foreigner_europe values (k,'Armenia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Azerbaijan IN ARRAY Azerbaijanarray LOOP 
	for j IN 1..Azerbaijan LOOP
	   INSERT INTO foreigner_europe values (k,'Azerbaijan',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Andorra IN ARRAY Andorraarray LOOP 
	for j IN 1..Andorra LOOP
	   INSERT INTO foreigner_europe values (k,'Andorra',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Slovenia IN ARRAY Sloveniaarray LOOP 
	for j IN 1..Slovenia LOOP
	   INSERT INTO foreigner_europe values (k,'Slovenia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

/*
i :=0;
j :=0;
year :=1950;

FOREACH Slovakia IN ARRAY Slovakiaarray LOOP
	for j IN 1..Slovakia LOOP
	   INSERT INTO foreigner_europe values (k,'Slovakia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

*/

i :=0;
j :=0;
year :=1950;

FOREACH Slovakia IN ARRAY Slovakiaarray LOOP 
	for j IN 1..Slovakia LOOP
	   INSERT INTO foreigner_europe values (k,'Slovakia',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Bosniaherzegovina IN ARRAY Bosniaherzegovinaarray LOOP 
	for j IN 1..Bosniaherzegovina LOOP
	   INSERT INTO foreigner_europe values (k,'Bosnia and Herzegovina',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;

i :=0;
j :=0;
year :=1950;

FOREACH Serbiaandmontenegro IN ARRAY Serbiaandmontenegroarray LOOP 
	for j IN 1..Serbiaandmontenegro LOOP
	   INSERT INTO foreigner_europe values (k,'Serbia and Montenegro',year+i);
	    k :=k+1;
 	END LOOP;
	i :=i+1;
END LOOP;


RETURN 0;

END;
$$ LANGUAGE plpgsql;
