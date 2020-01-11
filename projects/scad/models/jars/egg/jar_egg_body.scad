/*
* Egg Jar Body (v1). 
*
* 1/5/2020
* dan.bush@techentourage.com
*/
include <BSCADLIB/conf/pla_standard.scad>;

use <BSCADLIB/bullet.scad>;
use <BSCADLIB/ring.scad>;

$fn=60;
text_font = "Helvetica:style=Bold";

module stem (stem_height, stem_width, radis) {
  cut_offset=stem_width/2+radis;
  difference() {
    cylinder(d=cut_offset*2, h=stem_height/2, center=true);
    scale([1,1,3]) {
      rotate_extrude(convexity = 10) {
        translate([cut_offset, 0, 0]) circle(r = radis);
      }
    }
  }
  translate([0,0,8]) ring(14,5);
  translate([0,0,-12]) { 
    difference() {
      ring(14,5);
      translate([0,0,-20]) cube(40, true);
    }
  }
  // signature
  translate([0,0,-12.6-_layer*3]) {
    rotate([0,0,0]) {
      linear_extrude(2) text("BUSH", size=7, valign="center", halign="center", font = text_font);
    }
  }
}

module body(width, shell_layers) {
  // bottom
  height=100;
  difference() {
    bullet(width, height);
    wall_width=getWidth(2*shell_layers);
    translate([0,0,-.001]) bullet(width-wall_width, height-wall_width/2);
    //translate([0,-100,0]) cube([100,100,100]); // check
  }
  // stem
  translate([0,0,105]) stem(50,30,5);
  // foot
  translate([0,0,122]) rotate([180,0,0]) bullet(80,12);
}

translate([0,0,122]) rotate([180,0,0]) body(120, 4);