/*
* Egg Jar (v1).
*
* This is only for visualizing the entire jar.
*
* 1/5/2020
* dan.bush@techentourage.com
*/
use <jar_egg_lid.scad>;
use <jar_egg_body.scad>;

$fn=60;

module vase(width, shell_layers) {
  rotate([0,0,0]) translate([0,0,130]) lid(width, shell_layers);  // lid on
//  rotate([0,0,0]) translate([150,0,0]) lid(width, shell_layers); // lid beside
  translate([0,0,120]) rotate([180,0,0]) body(width, shell_layers);
}

vase(120, 4);





