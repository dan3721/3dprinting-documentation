/*
* Bez Vase (v1).
*
* 1/7/2020
* dan.bush@techentourage.com
*
* https://www.desmos.com/calculator/xlpbe9bgll
* https://github.com/revarbat/BOSL/wiki/beziers.scad#revolve_bezier_solid_to_axis
*/

include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/beziers.scad>

$fn=120;
rotate([0,-90,0]) {
  bez = [ [50,0], [50,10], [25,1], [23,21], [19,26], [0,12], [0,0]];
  closed = bezier_close_to_axis(bez, N=4);
  //trace_bezier(closed, size=1, N=4);
  revolve_bezier_solid_to_axis(bez, splinesteps=32, $fn=60, N=4);
}
