use <../../braille.scad>

$fn = 20;

fileName = "NationOfGondwana2025.svg";

mappyMap();

if (0)
intersection () {
	mappyMap();
	translate([155, 140, -1])
	cube(100);
}

module mappyMap () {
	union() {
		
		difference() {
			linear_extrude(1) import(fileName, layer="Outline");
			
			translate([   5,   5, -1])		cylinder(3,2,2, $fn=25);
			translate([ 345,   5, -1])		cylinder(3,2,2, $fn=25);
			translate([   5, 345, -1])		cylinder(3,2,2, $fn=25);
			translate([ 345, 345, -1])		cylinder(3,2,2, $fn=25);
			
			translate([ 175, 345, -1])		cylinder(3,2,2, $fn=25);
			translate([ 175,   5, -1])		cylinder(3,2,2, $fn=25);
			translate([   5, 175, -1])		cylinder(3,2,2, $fn=25);
			translate([ 345, 175, -1])		cylinder(3,2,2, $fn=25);

		}

		color("green")
		linear_extrude(3.2)
		import(fileName, layer="ParkFence");
		
		color("blue")
		linear_extrude(1.2)
		import(fileName, layer="Waves");

		
		difference() {
			color("green")
			linear_extrude(2)
			import(fileName, layer="ParkOutline");
			
			color("red")
			linear_extrude(3)
			import(fileName, layer="Roads");
			
			color("blue")
			linear_extrude(3)
			import(fileName, layer="Water");
		}
		
		
		color("purple")
		linear_extrude(3)
		import(fileName, layer="Level2");	
		color("purple")
		linear_extrude(2.5)
		import(fileName, layer="Level1");
		

	//	container
		
		translate([215, 170, 2]) container();
		

		difference() {

			color("yellow")
			linear_extrude(6)
			import(fileName, layer="Location");
		
			color("yellow")
			linear_extrude(7)
			import(fileName, layer="LocationNonBarrierFree");
		}
		
		// text
		translate([72,128,2]) braille("A#1", $fn=20);
		translate([85,164,2]) braille("A#2", $fn=20);
		translate([102,212,2]) braille("A#3", $fn=20);
		translate([120,250,2]) braille("A#4", $fn=20);
		
		translate([150,102,2]) braille("B#1", $fn=20);
		translate([160,137,2]) braille("B#2", $fn=20);
		translate([172,180,2]) braille("B#3", $fn=20);
		translate([180,220,2]) braille("B#4", $fn=20);

		translate([210,80,2]) braille("C#1", $fn=20);
		translate([220,120,2]) braille("C#2", $fn=20);
		
		
		translate([217,157,3]) braille("C#3", $fn=20);
		
		translate([38, 340, 1]) braille("N", $fn=20);
		translate([65, 310, 1]) braille("O", $fn=20);
		translate([11, 310, 1]) braille("W", $fn=20);
		translate([38, 280, 1]) braille("S", $fn=20);
		
		translate([20, 40, 1]) braille("Willkommen ʊf der");
		translate([20, 20, 1]) braille("Nation of Gondwana");
		
		color("blue") {
			// a 1
			translate([104, 112, 2]) droplet();
			// a 2
			translate([ 57, 160, 2]) droplet();
			translate([115, 141, 2]) droplet();
			// a 3
			translate([ 76, 205, 2]) droplet();
			translate([131, 184, 2]) droplet();
			// a 4
			translate([ 97, 254, 2]) droplet();
			translate([149, 229, 2]) droplet();
			translate([106, 278, 2]) droplet();
			translate([157, 250, 2]) droplet();
			// b 2
			translate([191, 114, 2]) droplet();
			// b 3
			translate([198, 156, 2]) droplet();
			// b 4
			translate([206, 201, 2]) droplet();
			// c 2
			translate([248,  95, 2]) droplet();
			// c 3
			translate([237, 144, 2]) droplet();
			
			// barrier free
			translate([212, 230, 2]) bigDroplet();

		}
	}
}


module droplet() {
	cylinder(1, 2, 1.5, $fn=20);
	translate([0,0,1])
	cylinder(3, 1.5, .75, $fn=20);
}

module bigDroplet() {
	cylinder(1, 2, 2.5, $fn=20);
	translate([0,0,1])
	cylinder(2.5, 2.5, .5, $fn=20);
	translate([0,0,2.75]) sphere(1.25, $fn=20);
}


module container() {
	container_w = 10;
	container_r = 3;
	
	translate([container_w/2+5,container_r+1, container_r/2  ])
	rotate([0,-90,0])
	cylinder(container_w, container_r, container_r, $fn=3);
}