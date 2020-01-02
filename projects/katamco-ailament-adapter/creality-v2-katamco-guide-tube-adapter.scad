/*
* KATAMCO Filament Guide Tube Adapter for Creality V2
*
* Snaps atop the filament sensor and supports the filament tube tube so that it does not
* tension, bend, or or put excessive on the filament.
*
* 12/31/2019
* dan.bush@gmail.com
*
* KATAMCO:  https://katamco.com/products/3d-printer-filament-box-new-dispenser-and-storage-container?_pos=7&_sid=ee7e381e9&_ss=r
* Amazon:   https://www.amazon.com/gp/product/B07HHJCF7B/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1
*/

// filament sensor dimensions from back (including tolerances)
sensor_width=38.2;
sensor_depth=43.2;
sensor_height=13.5;

v="V2"; // model version

$fn=120;

// animation
//$vpt= [0, 0, 0];
//$vpr = [70, -10, 360 * $t];
//$vpd = 210;

BREAK=5; // use to break stitching
text_font = "Helvetica:style=Bold";

module sleeve() {
  cylinder(h=11, d=12); // sleeve
  translate ([0,3.8,-1]) cylinder(h=12, d=6.2);
}
    
module adapter() {

  // housing
  translate([0,0,0]) {

    // port
    translate([38,-1,8.5]) {
     rotate([90,0,0]) {
        difference() {
          sleeve();
          translate ([0,0,-1]) cylinder(h=12+BREAK, d=6.2); // cut
        }
      }
    }

    difference() {

      // shell
      translate([0,0,-2]) {
        minkowski() {
          cube([sensor_depth, sensor_width, sensor_height+3]);
          cylinder(r=2,h=1);
        }
      }

      // cut sensor box
      cube([sensor_depth, sensor_width, sensor_height]);

      // cut filament tunnel
      translate([38,sensor_width+5,8.5]) {
        rotate([90,0,0]) {
          cylinder(h=sensor_width+20, d=4);
        }
      }

      // cut top window
      translate([sensor_depth/2,sensor_width/2,sensor_height+1]) {
        minkowski() {
          cube([sensor_depth*.8, sensor_width*.8, 2+BREAK], center=true);
          cylinder(r=2,h=1);
        }
      }

      // cut width windows
      translate([sensor_depth/2-1,sensor_width/2,sensor_height-15]) {
        rotate([90,0,0]) {
          minkowski() {
            cube([sensor_width-35, sensor_height+2,sensor_depth+BREAK*6], center=true);
            cylinder(r=6,h=1);
          }
        }
      }

      // cut depth windows
      translate([sensor_depth/2-20,sensor_width/2,sensor_height/2-5]) {
        rotate([90,0,90]) {
          minkowski() {
            cube([sensor_width*.6, sensor_height+4,sensor_depth/2+BREAK], center=true);
            cylinder(r=2,h=1);
          }
        }
      }
      translate([sensor_depth/2+20,sensor_width/2,sensor_height/2-12]) {
        rotate([90,0,90]) {
          minkowski() {
            cube([sensor_width*.1, sensor_height+4,sensor_depth/2+BREAK], center=true);
            cylinder(r=9,h=1);
          }
        }
      }

       // cut bottom window
      translate([sensor_depth/2,sensor_width/2,0]) {
        cube([sensor_depth-2, sensor_width-2, BREAK], center=true);
      }

      // cut screws & z-access flange
      translate([5.3,0,-3]) cylinder(d=6.5,h=3);
      translate([sensor_depth-7,sensor_width-2.6,-3])  {
        cube([10,8,3]);
      }
      
      // signature & version
     translate([0,-1,11]) {
        rotate([90,0,0]) {
          linear_extrude(2) text("BUSH", size=3, font = text_font);
        }
      }
      translate([3,-1,4]) {
        rotate([90,0,0]) {
        linear_extrude(2) text(v, size=3, font = text_font);
        }
      }

    }

  }

}

    
// orientate for printing
 translate([sensor_width/2+1.5,-1*sensor_depth/2+1.5,15.5]) rotate([0,180,0])

// translate([-20,-1*sensor_depth/2+1.5,0])  // for animation

adapter();

