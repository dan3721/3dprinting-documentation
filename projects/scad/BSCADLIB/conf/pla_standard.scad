
// values in mm unless specified otherwise

_filament_diameter=1.75;
_nozzel_size=.4;
_layer_height=.2;
_layer=_layer_height; // alias to ease usage
_line_width=_nozzel_size;
_line=_line_width; // alias to ease usage
_wall_line_count=3;
_wall_thickness=_line_width*_wall_line_count;
_wall=_wall_thickness; // alias to ease usage
_tollerance=.02;

echo("---------------------------------------");
echo(filament_diameter=_filament_diameter);
echo(_layer_height=_layer_height);
echo(_layer=_layer);
echo(_nozzel_size=_nozzel_size);
echo(_line_width=_line_width);
echo(_line=_line);
echo(_wall_line_count=_wall_line_count);
echo(_wall_thickness=_wall_thickness);
echo(_wall=_wall);
echo(_tollerance=_tollerance);
echo("---------------------------------------");

function getWidth(num_lines) = num_lines*_line_width;
function getHeight(num_layers) = num_layers*_layer_height;

