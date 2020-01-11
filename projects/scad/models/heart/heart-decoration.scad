/*
* Heart Decoration (v1).
*
* 1/10/2020
* dan.bush@techentourage.com
*/

include <SCADLIBB/conf/pla_standard.scad>


include <BOSL/constants.scad>
include <dotSCAD-2.1/src/dotSCAD.scad>

use <BOSL/shapes.scad>
use <BOSL/beziers.scad>
use <BOSL/transforms.scad>

$fn=200;

module heart() {
  bez = [ [0,20], [11,28], [19,15], [10,5], [0,0], [-10,5], [-19,15], [-11,28], [0,20]];
  bezier_polygon(bez, splinesteps=128, N=4);
}

module heart2d(height) {
  difference() {
    scale(6) {
      linear_extrude(height = height/4) heart();
    }
  }
}
//heart2d(10);

module backer(height) {
  translate([0,106,0]) {
    difference() {
      rotate(180) {
        translate([0,0,1.1]) cylinder(h=height, d=12+6*_wall);
        width=30;
        translate([0,-5,1.1]) rotate([0,0,45]) cube([width, width, height-.1]);
      }
      translate([0,0,-.001]) cylinder(h=height, d=12);
    }
  }
}
//backer();

module decoration(height) {
  intersection() {
    difference() {
      heart2d(height);
      // hollow
      translate([0,6,-3.001]) intersection() {
         scale(.9) heart2d(height);
           translate([-100,90,-321]) rotate([0,90,0]) cylinder(d=700, h=200, $fn=300);
        }
    }
    translate([-100,90,-321]) rotate([0,90,0]) cylinder(d=700, h=200, $fn=300);
  }
  backer(height+7);
}
decoration(20);

  






  
  


