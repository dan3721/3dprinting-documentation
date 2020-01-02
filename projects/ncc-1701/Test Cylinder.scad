

$fn=100;

module cylindar(size) {
  difference() {
    cylinder(h=size, d=size);
    translate([0,0,-1]) cylinder(h=size+2, d=size-(2*1.2));
  }
}

cylindar(10);