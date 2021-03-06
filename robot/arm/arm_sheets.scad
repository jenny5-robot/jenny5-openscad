// Author: Mihai Oltean, https://mihaioltean.github.io, mihai.oltean@gmail.com
// More details: https://jenny5.org, https://jenny5-robot.github.io/
// Source code: github.com/jenny5-robot
// License: MIT
//--------------------------------------------------------------

include <arm_params.scad>

include <../../basic_scad/params_motor_housing.scad>
use <../../basic_scad/point_transformations_3d.scad>

include <../../basic_scad/tolerance.scad>

include <../../basic_scad/params_tube_bracket.scad>
include <../../basic_scad/params_screws_nuts_washers.scad>

//---------------------------------------------------------------
module shoulder_sheet()
{
    difference(){
        echo("shoulder sheet");
        echo(shoulder_plate_size = shoulder_plate_size);

        color (aluminium_color) cube(shoulder_plate_size);

        echo("bearing housing holes:");
        for (i = [0 : 1]){
            echo(rbearing_6907_enclosed_housing_holes_position[i] + [shoulder_plate_size[0] / 2 - (rbearing_6907_enclosed_housing_holes_position[0][0] + rbearing_6907_enclosed_housing_holes_position[1][0]) / 2, first_bearing_shoulder_offset + rbearing_6907_enclosed_housing_size[1] / 2, 0]);
            translate (rbearing_6907_enclosed_housing_holes_position[i] + [shoulder_plate_size[0] / 2 - (rbearing_6907_enclosed_housing_holes_position[0][0] + rbearing_6907_enclosed_housing_holes_position[1][0]) / 2, first_bearing_shoulder_offset+ rbearing_6907_enclosed_housing_size[1] / 2, 0] - display_tolerance_z) cylinder (h = shoulder_plate_size[2] + 2 * display_tolerance, r = m4_screw_radius);
        }
        // other side holes for bearing
        
        for (i = [0 : 1]){
            echo(rbearing_6907_enclosed_housing_holes_position[i] + [shoulder_plate_size[0] / 2 - (rbearing_6907_enclosed_housing_holes_position[0][0] + rbearing_6907_enclosed_housing_holes_position[1][0]) / 2, shoulder_plate_size[1] - rbearing_6907_enclosed_housing_size[1] / 2, 0]);

            translate (rbearing_6907_enclosed_housing_holes_position[i] + [shoulder_plate_size[0] / 2 - (rbearing_6907_enclosed_housing_holes_position[0][0] +rbearing_6907_enclosed_housing_holes_position[1][0]) / 2, shoulder_plate_size[1] - rbearing_6907_enclosed_housing_size[1] / 2, 0] - display_tolerance_z) cylinder (h = shoulder_plate_size[2] + 2 * display_tolerance, r = m4_screw_radius);
        }
        // holes for brackets
        echo("shoulder holes for brackets");
        
        shoulder_bracket_holes_position = f_tube_bracket_holes(shoulder_bracket_length, arm_shaft_radius);
        for (i = [0 : 3]){
            echo(shoulder_bracket_holes_position[i] + [0, offset_shoulder_plate_bracket, 0]);
            translate(shoulder_bracket_holes_position[i] + [0, offset_shoulder_plate_bracket, 0] - display_tolerance_z)
        cylinder (h = shoulder_plate_size[2] + 2 * display_tolerance, r = m4_screw_radius);
        }
        // other side
        for (i = [0 : 3]){
            echo(shoulder_bracket_holes_position[i] + [shoulder_plate_size[0] - shoulder_bracket_length, offset_shoulder_plate_bracket, 0]);
            translate(shoulder_bracket_holes_position[i] + [shoulder_plate_size[0] - shoulder_bracket_length, offset_shoulder_plate_bracket, 0] - display_tolerance_z)
        cylinder (h = shoulder_plate_size[2] + 2 * display_tolerance, r = m4_screw_radius);  
        }
    }
}
//---------------------------------------------------------------------------
module upper_arm_motor_base_sheet()
{
    difference(){
        color(aluminium_color) cube(sheet_upper_arm_motor_base_size);
        echo(sheet_upper_arm_motor_base_size=sheet_upper_arm_motor_base_size);
        // motor holes
        echo("motor holes");
        for (i = [1 : 4]){
            translate([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2 +  distance_upper_arm_motor_shaft, 0] + nema_17_holes[i] - display_tolerance_z) cylinder (h = sheet_upper_arm_motor_base_size[2] + 2 * display_tolerance, r = 1.5, $fn = 10);
            echo([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2 +  distance_upper_arm_motor_shaft, 0] + nema_17_holes[i], "radius = 1.5");
        }
        // rb608 bearing housing holes
        echo("rb608 bearing housing holes");
        for (i = [1 : 4]){
            translate([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2, 0] + rbearing_608_housing_holes_position_m3[i] - display_tolerance_z) cylinder (h = sheet_upper_arm_motor_base_size[2] + 2 * display_tolerance, r = 1.5, $fn = 10);
            echo([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2, 0] + rbearing_608_housing_holes_position_m3[i], "radius = 2");
        }
// middle hole
        echo("bearing housing middle hole", [sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2, 0], "radius = 10");
        translate([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2, 0] - display_tolerance_z) cylinder (h = sheet_upper_arm_motor_base_size[2] + 2 * display_tolerance, r = 10, $fn = 30);
        
    }
}
//---------------------------------------------------------------------------
module upper_arm_motor_top_sheet()
{
    difference(){
        color(aluminium_color) cube(sheet_upper_arm_motor_top_size);
        echo(sheet_upper_arm_motor_top_size = sheet_upper_arm_motor_top_size);
        echo("motor gearbox holes");
        for (i = [1 : 4]){
            translate([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2 + distance_upper_arm_motor_shaft, 0] + gearbox_nema_17_holes_position[i] - display_tolerance_z) cylinder (h = sheet_upper_arm_motor_base_size[2] + 2 * display_tolerance, r = 1.5, $fn = 10);
            translate([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2 + distance_upper_arm_motor_shaft, 0] + gearbox_nema_17_holes_position[i] + [0, 0, 1.5]) cylinder (h = 1.5, r1 = 1.5, r2 = 3, $fn = 20);
            echo([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2 + distance_upper_arm_motor_shaft, 0] + gearbox_nema_17_holes_position[i], "radius = 1.5");
        }
// gearbox middle hole
            translate([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2 + distance_upper_arm_motor_shaft, 0] - display_tolerance_z) cylinder (h = sheet_upper_arm_motor_base_size[2] + 2 * display_tolerance, r = 11, $fn = 30);
            echo([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2 + distance_upper_arm_motor_shaft, 0], "radius = 11");
        // rb608 bearing housing holes
        echo("rb608 bearing housing holes");
        for (i = [1 : 4]){
            translate([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2, 0] + rbearing_608_housing_holes_position_m3[i] - display_tolerance_z) cylinder (h = sheet_upper_arm_motor_base_size[2] + 2 * display_tolerance, r = 1.5, $fn = 10);
            translate([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2, 0] + rbearing_608_housing_holes_position_m3[i] + [0, 0, 1]) cylinder (h = 2, r1 = 1.5, r2 = 3, $fn = 20);

            echo([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2, 0] + rbearing_608_housing_holes_position_m3[i], "radius = 1.5");
        }
// middle hole
        translate([sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2, 0] - display_tolerance_z) cylinder (h = sheet_upper_arm_motor_base_size[2] + 2 * display_tolerance, r = 9.5, $fn = 30);
        echo("bearing housing middle hole", [sheet_upper_arm_motor_base_size[0] / 2, rbearing_608_thicker_housing_size[0] / 2, 0]);
        
        // belt tensioner holes
       translate ([sheet_upper_arm_motor_top_size[0] / 2 - arm_up_down_motor_top_sheet_distance_between_belt_tensioners / 2, sheet_upper_arm_motor_top_size[1] / 2 - 3, 0]) cylinder (h = sheet_upper_arm_motor_base_size[2] + 2 * display_tolerance, r = 2, $fn = 10); 
       translate ([sheet_upper_arm_motor_top_size[0] / 2 + arm_up_down_motor_top_sheet_distance_between_belt_tensioners / 2, sheet_upper_arm_motor_top_size[1] / 2 - 3, 0]) cylinder (h = sheet_upper_arm_motor_base_size[2] + 2 * display_tolerance, r = 2, $fn = 10); 
        
        echo("belt tensioner holes");
        echo([sheet_upper_arm_motor_top_size[0] / 2 - arm_up_down_motor_top_sheet_distance_between_belt_tensioners / 2, sheet_upper_arm_motor_top_size[1] / 2 - 3, 0]);
        echo([sheet_upper_arm_motor_top_size[0] / 2 + arm_up_down_motor_top_sheet_distance_between_belt_tensioners / 2, sheet_upper_arm_motor_top_size[1] / 2 - 3, 0]);
    }
}
//---------------------------------------------------------------------------
module arm_up_down_motor_top_sheet()
{
    difference(){
        color(aluminium_color) cube(arm_up_down_motor_sheet_size);
        echo(arm_up_down_motor_sheet_size = arm_up_down_motor_sheet_size);
        echo("motor gearbox holes");
        for (i = [1 : 4]){
            translate([arm_up_down_motor_sheet_size[0] / 2, distance_arm_up_down_motor_to_shaft, 0] + gearbox_nema_17_holes_position[i] - display_tolerance_z) cylinder (h = arm_up_down_motor_sheet_size[2] + 2 * display_tolerance, r = 1.5, $fn = 10);
            translate([arm_up_down_motor_sheet_size[0] / 2, distance_arm_up_down_motor_to_shaft, 0] + gearbox_nema_17_holes_position[i] + [0, 0, 1.5]) cylinder (h = 1.5, r1 = 1.5, r2 = 3, $fn = 20);
            echo([arm_up_down_motor_sheet_size[0] / 2, distance_arm_up_down_motor_to_shaft, 0] + gearbox_nema_17_holes_position[i], "radius = 1.5");
        }
// motor gearbox middle hole
            translate([arm_up_down_motor_sheet_size[0] / 2, distance_arm_up_down_motor_to_shaft, 0] - display_tolerance_z) cylinder (h = arm_up_down_motor_sheet_size[2] + 2 * display_tolerance, r = 11, $fn = 30);
            echo([arm_up_down_motor_sheet_size[0] / 2, distance_arm_up_down_motor_to_shaft, 0], "radius = 11");
        // rb6907 bearing housing holes
        echo("rb6907 bearing housing holes");
        for (i = [1 : 4]){
            translate([arm_up_down_motor_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] - display_tolerance_z) cylinder (h = arm_up_down_motor_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10);
            translate([arm_up_down_motor_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] + [0, 0, 1]) cylinder (h = 2, r1 = 2, r2 = 3.8, $fn = 20);

            echo([arm_up_down_motor_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i], "radius = 2");
        }
// middle hole
        translate([arm_up_down_motor_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] - display_tolerance_z) cylinder (h = arm_up_down_motor_sheet_size[2] + 2 * display_tolerance, r = 22, $fn = 30);
        echo("bearing housing middle hole", [arm_up_down_motor_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0], "radius = 21");
        
        // belt tensioner holes
        echo("belt tensioner holes");
        echo([arm_up_down_motor_sheet_size[0] / 2 - arm_up_down_motor_top_sheet_distance_between_belt_tensioners / 2, distance_arm_up_down_motor_to_shaft - nema_17_motor_gearbox_radius - 2, 0]);
       translate ([arm_up_down_motor_sheet_size[0] / 2 - arm_up_down_motor_top_sheet_distance_between_belt_tensioners / 2, distance_arm_up_down_motor_to_shaft - nema_17_motor_gearbox_radius - 2, 0] -display_tolerance_z) cylinder (h = arm_up_down_motor_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10); 
        echo([arm_up_down_motor_sheet_size[0] / 2 + arm_up_down_motor_top_sheet_distance_between_belt_tensioners / 2, distance_arm_up_down_motor_to_shaft -  nema_17_motor_gearbox_radius - 2, 0]);
       translate ([arm_up_down_motor_sheet_size[0] / 2 + arm_up_down_motor_top_sheet_distance_between_belt_tensioners / 2, distance_arm_up_down_motor_to_shaft -  nema_17_motor_gearbox_radius - 2, 0]-display_tolerance_z) cylinder (h = arm_up_down_motor_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10); 
    }
}

//---------------------------------------------------------------------------
module arm_up_down_motor_bottom_sheet()
{
    difference(){
        color(aluminium_color) cube(arm_up_down_motor_sheet_size);
        echo(arm_up_down_motor_sheet_size = arm_up_down_motor_sheet_size);
        
        echo("motor holes");
        for (i = [1 : 4]){
            translate([arm_up_down_motor_sheet_size[0] / 2, distance_arm_up_down_motor_to_shaft, 0] + nema_17_holes[i] - display_tolerance_z) cylinder (h = sheet_upper_arm_motor_base_size[2] + 2 * display_tolerance, r = 1.5, $fn = 10);
            echo([arm_up_down_motor_sheet_size[0] / 2, distance_arm_up_down_motor_to_shaft, 0] + nema_17_holes[i], "radius = 1.5");
        }
        // rb6907 bearing housing holes
        echo("rb6907 bearing housing holes");
        for (i = [1 : 4]){
            translate([arm_up_down_motor_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] - display_tolerance_z) cylinder (h = arm_up_down_motor_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10);
            translate([arm_up_down_motor_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] + [0, 0, 1]) cylinder (h = 2, r1 = 2, r2 = 3.8, $fn = 20);

            echo([arm_up_down_motor_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i], "radius = 2");
        }
// middle hole
        translate([arm_up_down_motor_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] - display_tolerance_z) cylinder (h = arm_up_down_motor_sheet_size[2] + 2 * display_tolerance, r = 21, $fn = 30);
        echo("bearing housing middle hole", [arm_up_down_motor_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0], "radius = 21");
            }
}
//---------------------------------------------------------------------------
module fore_arm_rotation_motor_support_sheet_top()
{
    difference(){
        color(aluminium_color)cube(fore_arm_rotation_motor_support_sheet_size);
       
        echo(fore_arm_rotation_motor_support_sheet_size = fore_arm_rotation_motor_support_sheet_size);
        echo("motor gearbox holes");
        for (i = [1 : 4]){
            translate([fore_arm_rotation_motor_support_sheet_size[0] / 2, distance_fore_arm_rotation_motor_to_shaft, 0] + gearbox_nema_17_holes_position[i] - display_tolerance_z) cylinder (h = fore_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 1.5, $fn = 10);
            translate([fore_arm_rotation_motor_support_sheet_size[0] / 2, distance_fore_arm_rotation_motor_to_shaft, 0] + gearbox_nema_17_holes_position[i] + [0, 0, 1.5]) cylinder (h = 1.5, r1 = 1.5, r2 = 3, $fn = 20);
            echo([fore_arm_rotation_motor_support_sheet_size[0] / 2, distance_fore_arm_rotation_motor_to_shaft, 0] + gearbox_nema_17_holes_position[i], "radius = 1.5");
        }
// motor gearbox middle hole
            translate([fore_arm_rotation_motor_support_sheet_size[0] / 2, distance_fore_arm_rotation_motor_to_shaft, 0] - display_tolerance_z) cylinder (h = fore_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 11, $fn = 30);
            echo([fore_arm_rotation_motor_support_sheet_size[0] / 2, distance_fore_arm_rotation_motor_to_shaft, 0], "radius = 11");
        // rb6907 bearing housing holes
        echo("rb6907 bearing housing holes");
        for (i = [1 : 4]){
            translate([fore_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] - display_tolerance_z) cylinder (h = fore_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10);
            translate([fore_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] + [0, 0, 1]) cylinder (h = 2, r1 = 2, r2 = 3.8, $fn = 20);

            echo([fore_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i], "radius = 2");
        }
// middle hole
        translate([fore_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] - display_tolerance_z) cylinder (h = fore_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 20, $fn = 30);
        echo("bearing housing middle hole", [fore_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0], "radius = 20");
        
        // belt tensioner holes
        echo("belt tensioner holes");
        echo([fore_arm_rotation_motor_support_sheet_size[0] / 2 - fore_arm_rotation_motor_support_sheet_distance_between_belt_tensioners / 2, distance_fore_arm_rotation_motor_to_shaft - nema_17_motor_gearbox_radius - 2, 0]);
       translate ([fore_arm_rotation_motor_support_sheet_size[0] / 2 - fore_arm_rotation_motor_support_sheet_distance_between_belt_tensioners / 2, distance_fore_arm_rotation_motor_to_shaft - nema_17_motor_gearbox_radius - 2, 0] -display_tolerance_z) cylinder (h = fore_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10); 
        echo([fore_arm_rotation_motor_support_sheet_size[0] / 2 + fore_arm_rotation_motor_support_sheet_distance_between_belt_tensioners / 2, distance_fore_arm_rotation_motor_to_shaft -  nema_17_motor_gearbox_radius - 2, 0]);
       translate ([fore_arm_rotation_motor_support_sheet_size[0] / 2 + fore_arm_rotation_motor_support_sheet_distance_between_belt_tensioners / 2, distance_fore_arm_rotation_motor_to_shaft -  nema_17_motor_gearbox_radius - 2, 0]-display_tolerance_z) cylinder (h = fore_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10); 
    }
}
//---------------------------------------------------------------------------
module fore_arm_rotation_motor_support_sheet_bottom()
{
    difference(){
        color(aluminium_color) cube(fore_arm_rotation_motor_support_sheet_size);
       
        echo(fore_arm_rotation_motor_support_sheet_size = fore_arm_rotation_motor_support_sheet_size);
        echo("motor back holes");
        
        for (i = [1 : 4]){
            translate([fore_arm_rotation_motor_support_sheet_size[0] / 2, distance_fore_arm_rotation_motor_to_shaft, 0] + nema_17_holes[i] - display_tolerance_z) cylinder (h = upper_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 1.5, $fn = 10);
            echo([fore_arm_rotation_motor_support_sheet_size[0] / 2, distance_fore_arm_rotation_motor_to_shaft, 0] + nema_17_holes[i], "radius = 1.5");
        }
        // rb6907 bearing housing holes
        echo("rb6907 bearing housing holes");
        for (i = [1 : 4]){
            translate([fore_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] - display_tolerance_z) cylinder (h = fore_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10);
            translate([fore_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] + [0, 0, 1]) cylinder (h = 2, r1 = 2, r2 = 3.8, $fn = 20);

            echo([fore_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i], "radius = 2");
        }
// middle hole
        translate([fore_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] - display_tolerance_z) cylinder (h = fore_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 20, $fn = 30);
        echo("bearing housing middle hole", [fore_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0], "radius = 20");
    }
}

//---------------------------------------------------------------------------
module upper_arm_rotation_motor_support_sheet_top()
{
    difference(){
        color(aluminium_color)cube(upper_arm_rotation_motor_support_sheet_size);
       
        echo(upper_arm_rotation_motor_support_sheet_size = upper_arm_rotation_motor_support_sheet_size);
        echo("motor gearbox holes");
        for (i = [1 : 4]){
            translate([upper_arm_rotation_motor_support_sheet_size[0] / 2, distance_upper_arm_rotation_motor_to_shaft, 0] + gearbox_nema_17_holes_position[i] - display_tolerance_z) cylinder (h = upper_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 1.5, $fn = 10);
            translate([upper_arm_rotation_motor_support_sheet_size[0] / 2, distance_upper_arm_rotation_motor_to_shaft, 0] + gearbox_nema_17_holes_position[i] + [0, 0, 1.5]) cylinder (h = 1.5, r1 = 1.5, r2 = 3, $fn = 20);
            echo([upper_arm_rotation_motor_support_sheet_size[0] / 2, distance_upper_arm_rotation_motor_to_shaft, 0] + gearbox_nema_17_holes_position[i], "radius = 1.5");
        }
// motor gearbox middle hole
            translate([upper_arm_rotation_motor_support_sheet_size[0] / 2, distance_upper_arm_rotation_motor_to_shaft, 0] - display_tolerance_z) cylinder (h = upper_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 11, $fn = 30);
            echo([upper_arm_rotation_motor_support_sheet_size[0] / 2, distance_upper_arm_rotation_motor_to_shaft, 0], "radius = 11");
        // rb6907 bearing housing holes
        echo("rb6907 bearing housing holes");
        for (i = [1 : 4]){
            translate([upper_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] - display_tolerance_z) cylinder (h = upper_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10);
            translate([upper_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] + [0, 0, 1]) cylinder (h = 2, r1 = 2, r2 = 3.8, $fn = 20);

            echo([upper_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i], "radius = 2");
        }
// middle hole
        translate([upper_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] - display_tolerance_z) cylinder (h = upper_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 20, $fn = 30);
        echo("bearing housing middle hole", [upper_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0], "radius = 20");
        
        // belt tensioner holes
        echo("belt tensioner holes");
        echo([upper_arm_rotation_motor_support_sheet_size[0] / 2 - fore_arm_rotation_motor_support_sheet_distance_between_belt_tensioners / 2, distance_upper_arm_rotation_motor_to_shaft - nema_17_motor_gearbox_radius - 2, 0]);
       translate ([upper_arm_rotation_motor_support_sheet_size[0] / 2 - fore_arm_rotation_motor_support_sheet_distance_between_belt_tensioners / 2, distance_upper_arm_rotation_motor_to_shaft - nema_17_motor_gearbox_radius - 2, 0] -display_tolerance_z) cylinder (h = upper_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10); 
        echo([upper_arm_rotation_motor_support_sheet_size[0] / 2 + fore_arm_rotation_motor_support_sheet_distance_between_belt_tensioners / 2, distance_upper_arm_rotation_motor_to_shaft -  nema_17_motor_gearbox_radius - 2, 0]);
       translate ([upper_arm_rotation_motor_support_sheet_size[0] / 2 + fore_arm_rotation_motor_support_sheet_distance_between_belt_tensioners / 2, distance_upper_arm_rotation_motor_to_shaft -  nema_17_motor_gearbox_radius - 2, 0]-display_tolerance_z) cylinder (h = upper_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10); 
    }
}
//---------------------------------------------------------------------------
module upper_arm_rotation_motor_support_sheet_bottom()
{
    difference(){
        color(aluminium_color)cube(upper_arm_rotation_motor_support_sheet_size);
       
        echo(upper_arm_rotation_motor_support_sheet_size = upper_arm_rotation_motor_support_sheet_size);

        
                echo("motor holes");
        for (i = [1 : 4]){
            translate([upper_arm_rotation_motor_support_sheet_size[0] / 2, distance_upper_arm_rotation_motor_to_shaft, 0] + nema_17_holes[i] - display_tolerance_z) cylinder (h = upper_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 1.5, $fn = 10);
            echo([upper_arm_rotation_motor_support_sheet_size[0] / 2, distance_upper_arm_rotation_motor_to_shaft, 0] + nema_17_holes[i], "radius = 1.5");
        }

        // rb6907 bearing housing holes
        echo("rb6907 bearing housing holes");
        for (i = [1 : 4]){
            translate([upper_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] - display_tolerance_z) cylinder (h = upper_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 2, $fn = 10);
            translate([upper_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i] + [0, 0, 1]) cylinder (h = 2, r1 = 2, r2 = 3.8, $fn = 20);

            echo([upper_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] + rbearing_6907_housing_holes_position[i], "radius = 2");
        }
// middle hole
        translate([upper_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0] - display_tolerance_z) cylinder (h = upper_arm_rotation_motor_support_sheet_size[2] + 2 * display_tolerance, r = 20, $fn = 30);
        echo("bearing housing middle hole", [upper_arm_rotation_motor_support_sheet_size[0] / 2, rbearing_6907_housing_size[0] / 2, 0], "radius = 20");
        

    }
}
//---------------------------------------------------------------------------
module body_articulation_sheet()
{
  difference(){
      echo("Body-arm plate size: ", plate_body_size);
      color (aluminium_color) cube(plate_body_size);
        // screws holes for body bone connection
        // rest of arms screws
        // first bearing housing support holes
      echo("first bearing housing support holes:");
      for (i = [0 : 1]){
            echo([plate_body_size[0] / 2, f_rbearing_6907_vertical_housing_size_bounded_half_small(0)[1] / 2, 0] + rbearing_6907_enclosed_housing_holes_position[i]);
            translate ([plate_body_size[0] / 2, f_rbearing_6907_vertical_housing_size_bounded_half_small(0)[1] / 2, 0] - display_tolerance_z) translate(rbearing_6907_enclosed_housing_holes_position[i])  cylinder ( h = plate_body_size[2] + 2 * display_tolerance, r = m4_screw_radius, $fn = 20);
      }
        // motor housing base screw holes
//      echo("motor holes position:");
//      for (i = [[-1, -1], [-1, 1], [1, -1], [1, 1]]){
//            echo([plate_body_size[0] / 2, plate_body_size[1] - nema_17_motor_gearbox_radius - 3, 0] + rotate_z(90, [i[0] * 28 / 2, i[1] * 33 / 2, 0]));
//            translate ([plate_body_size[0] / 2, plate_body_size[1] - nema_17_motor_gearbox_radius - 3, 0] - display_tolerance_z) rotate ([0, 0, 90]) translate([i[0] * 28 / 2, i[1] * 33 / 2, 0])  cylinder ( h = plate_body_size[2] + 2 * display_tolerance, r = 1.5, $fn = 20);
//      }
        // holes for the other bearing housing
      echo("second bearing housing support holes:");     
      for (i = [0 : 1]){
            echo([plate_body_size[0] / 2, plate_body_size[1] - f_rbearing_6907_vertical_housing_size_bounded_half_small(0)[1] / 2, 0] + rbearing_6907_enclosed_housing_holes_position[i]);
            translate ([plate_body_size[0] / 2, plate_body_size[1] - f_rbearing_6907_vertical_housing_size_bounded_half_small(0)[1] / 2, 0] - display_tolerance_z) translate(rbearing_6907_enclosed_housing_holes_position[i]) cylinder (h = plate_body_size[2] + 2 * display_tolerance, r = m4_screw_radius, $fn = 20);
      }
      //holes for body shaft
      echo("shaft support holes = ");
      holes = f_tube_bracket_holes(body_arm_bracket_thick, body_arm_shaft_radius);
      
      bracket_width = f_bracket_width(body_arm_shaft_radius);
      for (i = [0 : 3]){
          echo([0, -bracket_width / 2 + body_arm_offset, 0] + holes[i]);
          translate ([0, -bracket_width / 2 + body_arm_offset, 0] + holes[i] - display_tolerance_z) cylinder(h = plate_body_size[2] + 2 * display_tolerance, r = m4_screw_radius);
          echo([plate_body_size[0] - body_arm_bracket_thick, -bracket_width / 2 + body_arm_offset, 0] + holes[i]);
          translate ([plate_body_size[0] - body_arm_bracket_thick, -bracket_width / 2 + body_arm_offset, 0] + holes[i] - display_tolerance_z) cylinder(h = plate_body_size[2] + 2 * display_tolerance, r = m4_screw_radius);
      }
    }
}
//---------------------------------------------------------------------------

//upper_arm_rotation_motor_support_sheet_top();

//upper_arm_rotation_motor_support_sheet_bottom();

//fore_arm_rotation_motor_support_sheet_top();
//fore_arm_rotation_motor_support_sheet_bottom();

//arm_up_down_motor_top_sheet();

//arm_up_down_motor_bottom_sheet();

//body_articulation_sheet();
//shoulder_sheet();

//upper_arm_motor_top_sheet();
//upper_arm_motor_base_sheet();
