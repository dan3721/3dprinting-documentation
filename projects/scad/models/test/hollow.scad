
include <BSCADLIB/conf/pla_standard.scad>;

use <BSCADLIB/bullet.scad>;

num_walls=2*3;
wall_thickness=getWidth(num_walls);
echo(wall_thickness=wall_thickness);

// case 1: wall 3 thick (top of cone is too thick)
difference() {
  bullet(10,20);
  bullet(10-wall_thickness,20-wall_thickness);
  translate([-5,-5,0]) cube([10,5,20]); // slice open to see result
}

// case 2: fudge height to get a uniform wall thickness
// little better than case 1; is there a better way to hollow uniformly?
translate([15,0,0]) {
  difference() {
    bullet(10,20);
    bullet(10-wall_thickness,20-(wall_thickness*1.1)); // fudge
    translate([-5,-5,0]) cube([10,5,20]); // slice open to see result
  }
}
