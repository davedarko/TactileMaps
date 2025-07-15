use <../../braille.scad>
// https://www.schwerhoerigen-netz.de/fileadmin/user_upload/dsb/Dokumente/Information/Politik_Recht/Barrierefrei/Zielvereinbarung/Anlage_4_Richtlinie_zu_taktilen....pdf
b_a =  2.7; // distance between dots horizontally and vertically
b_c =  6.6; // distance between letters
b_d = 20; // 10.8; // distance between rows
b_r =  0.75; // radius of dot

map();

module map() {

	translate([-40,-255,-1]) cube([208, 240, 1]);

	color("red")
	if (1) {
		// check
		translate([0,- b_d *  1, 0]) {
			translate([-20, -10, 0]) cube([10, 10, 1]);
			braille("Camping Fläç​e");
		}
		// check
		translate([0,-b_d *  2, 0])
		{
			translate([-20, -10, 0]) {
				cube([10, 10, 1]);
				cube([10, 1, 2]);
				translate([9,0,0]) cube([1, 10, 2]);
				
				translate([0,9,0])cube([10, 1, 2]);
			}
			braille("Geländegrenze & Notʊsgang");
		}
		
		// todo
		translate([0,-b_d *  3, 0]) {
			translate([-35, -10, 0]) {
				cube([25, 10, 1]);
				
				translate([1,2,0]) linear_extrude(2) import("NationOfGondwana_2024_Water.svg", layer="Water");
			}
			
			braille("See");
		}
		

		// check
		translate([0,-b_d *  4, 0]) {		
			translate([-20, -10, 0]) {
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
			braille("Bäume");
		}
		
		// check
		translate([0,-b_d *  5, 0]) {
			translate([-30, -10, 0]) {
				cube([20, 15, 1]);
				translate([10, 7.5, 0]) scale([1.33,1,1])cylinder(2,7,7);
			}
			braille("Bühne");
		}

		translate([0,-b_d *  6, 0]) {
			translate([-20, -10, 0]) {
				translate([5,5,0]) {
					difference(){
						cylinder(6,4,4);
						cylinder(7,3,3);
					}
				}
				cube([10, 10, 1]);
			}
			braille("WC");
		}
		translate([0,-b_d *  7, 0]) {
			translate([-20, -10, 0]) {
				translate([5,5,0]) cylinder(6,4,4);
				cube([10, 10, 1]);
			}
			braille("WC barrierefrɪ");
		}
		translate([0,-b_d *  8, 0]) {
			translate([-20, -10, 0]) {
			
				translate([1,1,0]) {
					difference() {
						cube([8,8,6]);
						translate([1,1,0])cube([6,6,7]);
					}
				}
				
				cube([10, 10, 1]);
			}
			braille("Duʃe");
		}
		translate([0,-b_d *  9, 0]) {
			translate([-20, -10, 0]) {
				translate([1,1,0]) cube([8,8,6]);
				cube([10, 10, 1]);
			}
			braille("Duʃe barrierefrɪ");
		}
		
		translate([0,-b_d *  10, 0]) {
			translate([-20, -10, 0]) {
				translate([5,5,0]) cylinder(6,3,1,$fn=15);
				cube([10, 10, 1]);
			}
			braille("Trinkwasser");
		}

		translate([0,-b_d * 11, 0]) {
			translate([-20, -10, 0]) {	
				cube([10, 10, 1]);
				translate([4,0,0]) cube([2, 10, 2]);
				translate([0,4,0]) cube([10, 2, 2]);
			}
			braille("Sani Zelt");
		}
		
		translate([0,-b_d * 12, 0]) {
			translate([-20, -10, 0]) {	
				cube([10, 10, 1]);
				translate([4,0,0]) cube([2, 10, 2]);
				translate([0,4,0]) cube([10, 2, 2]);
			}
			braille("Awareness Team");
		}
	}
}