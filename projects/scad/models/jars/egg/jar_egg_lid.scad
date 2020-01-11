/*
* Egg Jar Lid (v1). 
*
* 1/5/2020
* dan.bush@techentourage.com
*/
include <BSCADLIB/conf/pla_standard.scad>;

use <BSCADLIB/bullet.scad>;
use <BSCADLIB/ring.scad>;

$fn=60;

module topper() {
  translate([0,0,12]) {
    bullet(18,32);
    translate([0,0,5]) ring(6, 5);
      rotate(a=[180,0,0]) {
        difference() {
          bullet(18,17);
          translate([0,0,10]) cylinder(h=8,d=20);
      }
    }
  }
}

module lid(width, shell_layers) {
  wall_width=getWidth(2*shell_layers);
  // topper
  translate([0,0,85]) topper();
  // top bullet
  difference() {
    translate([0,0,10]) bullet(width, 80);
    translate([0,0,9.009]) bullet(width-wall_width, 80-wall_width/8);
    //translate([0,-100,0]) cube([100,100,100]); check
  }
  // flange
  flange_inset_od=width-wall_width*2+_tollerance; // 2 wall widths + tollerance
  flange_width=6;
  difference() {
    cylinder(h=12,d1=flange_inset_od-5,d2=flange_inset_od);
    cylinder(h=12,d1=flange_inset_od-5-flange_width,d2=flange_inset_od-flange_width);
    translate([0,0,-1]) cylinder(h=20-flange_width,d=flange_inset_od-5-flange_width); // break stitching
  }
  translate([0,0,15.5]) ring(width/2-2, 6);
}

lid(120, 4);