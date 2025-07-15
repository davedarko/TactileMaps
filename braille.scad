alphabet = [
	["A", [1, 0, 0, 0, 0, 0]],
	["B", [1, 1, 0, 0, 0, 0]],
	["C", [1, 0, 0, 1, 0, 0]],
	["D", [1, 0, 0, 1, 1, 0]],
	["E", [1, 0, 0, 0, 1, 0]],
	["F", [1, 1, 0, 1, 0, 0]],
	["G", [1, 1, 0, 1, 1, 0]],
	["H", [1, 1, 0, 0, 1, 0]],
	["I", [0, 1, 0, 1, 0, 0]],
	["J", [0, 1, 0, 1, 1, 0]],
	["K", [1, 0, 1, 0, 0, 0]],
	["L", [1, 1, 1, 0, 0, 0]],
	["M", [1, 0, 1, 1, 0, 0]],
	["N", [1, 0, 1, 1, 1, 0]],
	["O", [1, 0, 1, 0, 1, 0]],
	["P", [1, 1, 1, 1, 0, 0]],
	["Q", [1, 1, 1, 1, 1, 0]],
	["R", [1, 1, 1, 0, 1, 0]],
	["S", [0, 1, 1, 1, 0, 0]],
	["T", [0, 1, 1, 1, 1, 0]],
	["U", [1, 0, 1, 0, 0, 1]],
	["V", [1, 1, 1, 0, 0, 1]],
	["W", [0, 1, 0, 1, 1, 1]],
	["X", [1, 0, 1, 1, 0, 1]],
	["Y", [1, 0, 1, 1, 1, 1]],
	["Z", [1, 0, 1, 0, 1, 1]],
	
	[" ", [0, 0, 0, 0, 0, 0]],
	
	["0", [0, 1, 0, 1, 1, 0]],
	["#", [0, 0, 1, 1, 1, 1]],

	["ä", [0, 0, 1, 1, 1, 0]],
	["ö", [0, 1, 0, 1, 0, 1]],
	["ü", [1, 1, 0, 0, 1, 1]],

	["Ä", [0, 0, 1, 1, 1, 0]],
	["Ö", [0, 1, 0, 1, 0, 1]],
	["Ü", [1, 1, 0, 0, 1, 1]], // ÄÖÜ

	["ß", [0, 1, 1, 1, 0, 1]],

	["&", [1, 1, 1, 1, 0, 1]],	//
	
	["ɪ", [1, 0, 0, 1, 0, 1]],	// ei 	11001001 10101010
	["ʊ", [1, 0, 0, 0, 0, 1]],	// au   11001010 10001010
	["ʃ", [1, 0, 0, 0, 1, 1]], // sch   11001010 10000011
	
	["ç", [1, 0, 0, 1, 1, 1]], // ch
	
	
	/* es fehlen: ie, eu, äu, st */
	
];


// https://www.schwerhoerigen-netz.de/fileadmin/user_upload/dsb/Dokumente/Information/Politik_Recht/Barrierefrei/Zielvereinbarung/Anlage_4_Richtlinie_zu_taktilen....pdf
b_a =  2.7; // distance between dots horizontally and vertically
b_c =  6.6; // distance between letters
b_d = 20; // 10.8; // distance between rows
b_r =  0.75; // radius of dot



$fn = 32;
braille("A#1 çɪʊʃ");
module braille(brailleText, scaleS=1) {
	for (s = [0:len(brailleText)-1]) {
		
		for (a = [0 : len(alphabet)-1]) {
			if (
				alphabet[a][0] == brailleText[s]
				||
				(ord(brailleText[s]) > 96 && ord(brailleText[s]) < 123 && ord(alphabet[a][0])+32 == ord(brailleText[s]))
				||
				(ord(brailleText[s]) > 48 && ord(brailleText[s]) < 58 && ord(alphabet[a][0])-16 == ord(brailleText[s]))
			){
				translate([s*b_c * scaleS, 0, 0])
				brailleFont(alphabet[a][1], scaleS);
			}
		}
	}
}

module brailleFont(f, scaleS = 1) {
	for (d = [0:len(f)-1])
	{
		y = d%3;
		x = floor(d/3);
		
		if (f[d]) {			
			translate([x*b_a * scaleS, -y*b_a * scaleS, -b_r * scaleS])
			{
				// cylinder(b_r, b_r, b_r);
				translate([0,0,b_r*scaleS]) scale([1,1,2/3]) sphere(b_r*scaleS);
			}
		}
	}
}