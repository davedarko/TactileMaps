use <../../braille.scad>
use <NationOfGondwana2025.scad>
// NationOfGondwana2025.scad

//  https://www.schwerhoerigen-netz.de/fileadmin/user_upload/dsb/Dokumente/Information/Politik_Recht/Barrierefrei/Zielvereinbarung/Anlage_4_Richtlinie_zu_taktilen....pdf
b_a =  2.7; // distance between dots horizontally and vertically
b_c =  6.6; // distance between letters
b_d = 10.8+2*b_a; // 10.8; // distance between rows
b_r =  0.75; // radius of dot
t = 2;
$fn=25;

listOfThings = [
	"Camping Fläçe",
	"Geländegrenze & Notʊsgang",	
	"See",
	"Bäume",
	"Bühne",
	"Container Team barrierefrɪ",
	"WC",
	"WC barrierefrɪ",
	"Duʃe barrierefrɪ",
	"Trinkwasser",
	"Trinkwasser barrierefrɪ",
	"Erste Hilfe",
	"Plateau",
//	"Schraube",
	"befestigtes Wegesystem"
];

color("red")
for (i = [0:len(listOfThings)-1]) {
	translate([30, (len(listOfThings)-i) * b_d, 0]) {
		braille(listOfThings[i]);
		
		translate([-20, -b_d/2, 0]) {
			if (listOfThings[i] == "Camping Fläç​e") {
				cube([10, 10, 1]);
			}
			
			if (listOfThings[i] == "Geländegrenze & Notʊsgang") {
				cube([10, 10, 1]);
				cube([10, 1, 2]);
				translate([9,0,0]) cube([1, 10, 2]);				
				translate([0,9,0])cube([10, 1, 2]);
			}
			
			if (listOfThings[i] == "See") {
				cube([10, 10, .2]);
				cube([10, 1, .4]);
				translate([0,4,0]) cube([10, 1, .4]);
				translate([0,8,0]) cube([10, 1, .4]);
			}
			
			if (listOfThings[i] == "Bäume") {
				cube([10, 10, 1]);
				
				intersection() {
					cube([10, 10, 2]);
				
					union() {
						translate([0,0,0]) cylinder(1.5, 2, 2);
						translate([6,0,0]) cylinder(1.5, 2, 2);
						
						translate([3,4,0]) cylinder(1.5, 2, 2);
						translate([9,4,0]) cylinder(1.5, 2, 2);
						
						translate([0,8,0]) cylinder(1.5, 2, 2);
						translate([6,8,0]) cylinder(1.5, 2, 2);
					}
				}
			}
			
			if (listOfThings[i] == "Bühne") {
				translate([0, 1.5, 0]) {
				
					hull() {
						translate([0,5,0])
						cube([10, 1, 4]);
						
						translate([-2,8,0])
						cube([14,.1,4]);	
					
					}
					cube([10, 6, 4]);
				}
			}
			
			if (listOfThings[i] == "WC") {
				translate([5,5,0]) {
					difference(){
						cylinder(4,4,4);
						cylinder(7,3,3);
					}
				}
				cube([10, 10, 1]);
			}
			
			if (listOfThings[i] == "WC barrierefrɪ") {
				translate([5,5,0]) cylinder(4,4,4);
				cube([10, 10, 1]);
			}

			if (listOfThings[i] == "Duʃe barrierefrɪ") {			
				translate([1,1,0]) {
					cube([8,8,4]);
					// difference() {
					// 	cube([8,8,6]);
					// 	translate([1,1,0])cube([6,6,7]);
					// }
				}
				
				cube([10, 10, 1]);
			}
			
			if (listOfThings[i] == "Trinkwasser") {
				translate([5,5,1]) droplet();
				cube([10, 10, 1]);
			}
			
			if (listOfThings[i] == "Trinkwasser barrierefrɪ") {
				translate([5,5,1]) bigDroplet();			
				cube([10, 10, 1]);
			}
			
			if (listOfThings[i] == "Erste Hilfe") {
				cube([10, 10, 1]);
				translate([4,0,0]) cube([2, 10, 4]);
				translate([0,4,0]) cube([10, 2, 4]);
			}
			
			if (listOfThings[i] == "Plateau") {
				cube([10, 10, 1]);
				
				translate([5,4,0])
				for (j=[0:2]) {
					rotate([0,0,120*j]) 
					translate ([0,1,0]) 
					scale([1,2,1]) 
					rotate([0,0,90])
						cylinder(4,2,2,$fn=3);
				}
			}
			
			if (listOfThings[i] == "Container Team barrierefrɪ") {
				cube([10, 10, 1]);
				
				container();
			}
			
			if (listOfThings[i] == "befestigtes Wegesystem") {
				cube([10, 10, 1]);
				
				translate([0, 4, 0]) 
				{ 
					cube ([10, 1.75, 2.5]);
				
					translate([1.75,1.75/2,0]) {
						hull() {
							cylinder(3, 1.75/2, 1.75/2, $fn=25);
							translate([1.75,0,0])
							cylinder(3, 1.75/2, 1.75/2, $fn=25);
						}
					}
					
					translate([6.5,1.75/2,0]) {
						hull() {
							cylinder(3, 1.75/2, 1.75/2, $fn=25);
							translate([1.75,0,0])
							cylinder(3, 1.75/2, 1.75/2, $fn=25);
						}
					}
				}
			}
		}
	}
}

heightOfMap = (len(listOfThings)+1) * b_d - b_a*2;
difference () {

	translate([0, 0,-t]) cube([208, heightOfMap, t]);
	
	translate([5,5,-t-1]) cylinder(t+2, 2, 2);
	
	translate([208-5, 5, -t-1]) cylinder(t+2, 2, 2);
	translate([208-5, heightOfMap-5, -t-1]) cylinder(t+2, 2, 2);
	translate([5,heightOfMap-5,-t-1]) cylinder(t+2, 2, 2);
}
echo ("heightOfMap" , heightOfMap);

