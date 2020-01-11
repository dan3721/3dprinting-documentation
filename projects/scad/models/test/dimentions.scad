

include <BSCADLIB/conf/pla_standard.scad>

module brick(x,y,z, offset) {
  echo(z=z);
  translate([offset,0,0]) cube([x,y,z]);
}

for (i =[1:10]) {
  width = i==1 ? _line*i+.01 : _line*i; // adding .01 as a hack to get cura to render a singel wide line
  brick(width, 10, _layer*i, (i-1)*10);
}
