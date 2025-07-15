	
fileName = "NationOfGondwana_2024.svg";

union() {
	
	linear_extrude(1) import(fileName, layer="outline");

	color("green")
	linear_extrude(3.2)
	import(fileName, layer="parkFence");
	
	difference() {
		color("green")
		linear_extrude(2)
		import(fileName, layer="parkOutline");
		
		color("red")
		linear_extrude(3)
		import(fileName, layer="roads");
		
		color("blue")
		linear_extrude(3)
		import(fileName, layer="Water");
	}
	

	color("purple")
	linear_extrude(2.5)
	import(fileName, layer="Dots");
	color("purple")
	linear_extrude(2.8)
	import(fileName, layer="DotsTip");
	color("purple")
	linear_extrude(4)
	import(fileName, layer="raisedDots");	
	color("purple")
	linear_extrude(3)
	import(fileName, layer="pointsOfInterest");

	

	difference() {

		color("yellow")
		linear_extrude(6)
		import(fileName, layer="nonBarrierFree");
	
		color("yellow")
		linear_extrude(7)
		import(fileName, layer="barrierFree");
		
	}

	translate([-224, 59, 0]) {
		color("red")
		translate([330,158,0])
		cylinder(6,3,1,$fn=15);
		
		color("red")
		translate([349,191,0])
		cylinder(6,3,1,$fn=15);

		color("red")
		translate([362,221,0])
		cylinder(6,3,1,$fn=15);
		
		color("red")
		translate([403,233,0])
		cylinder(6,3,1,$fn=15);

		color("red")
		translate([438,158,0])
		cylinder(6,3,1,$fn=15);
	}
}
