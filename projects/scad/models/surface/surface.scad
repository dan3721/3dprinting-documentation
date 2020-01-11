
$fn=60;

//surface.scad
surface(file = "surface.dat", center = true, convexity = 5);
%translate([0,0,5])cube([11,11,10], center =true);

