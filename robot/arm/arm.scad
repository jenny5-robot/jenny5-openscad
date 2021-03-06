// Author: Mihai Oltean, https://mihaioltean.github.io, mihai.oltean@gmail.com
// More details: https://jenny5.org, https://jenny5-robot.github.io/
// Source code: github.com/jenny5-robot
// MIT License
//--------------------------------------------------------------

use <../../basic_scad/stepper_motors.scad>
include <../../basic_scad/params_screws_nuts_washers.scad>
use <../../basic_scad/screws_nuts_washers.scad>
use <../../basic_scad/radial_bearing_housing.scad>
use <../../basic_scad/radial_bearing_u_housing.scad>
include <../../basic_scad/material_colors.scad>

include <../../basic_scad/params_pulleys.scad>
use <../../basic_scad/pulleys.scad>
use <../../basic_scad/radial_bearings.scad>

use <../../basic_scad/belt.scad>

include <../../basic_scad/params_webcam.scad>

use <../../basic_scad/motor_pulley.scad>

use <../../basic_scad/as5147.scad>
include <../../basic_scad/as5147_params.scad>
use <../../basic_scad/rings.scad>

include <../../basic_scad/tolerance.scad>
use <../../basic_scad/webcam.scad>

include <arm_params.scad>

use <arm_sheets.scad>
use <arm_sheets_with_belt_tensioner.scad>
use <arm_pulleys.scad>

use <arm_sensor_support.scad>
include <arm_sensor_support_params.scad>

use <fore_arm_bearing_support.scad>

use <arm_bones.scad>
include <gripper_params.scad>
use <gripper.scad>

//---------------------------------------------------------------------------
module elbow_rotation_motor_with_components()
{
    nema_17_with_50_1_gearbox();
    
    // screw for rotation
    translate([0, - distance_upper_arm_motor_shaft, nema_17_with_50_1_gearbox_height + 11 + 3 + 2]) mirror ([0, 0, 1]) M8_hexa (nema_17_with_50_1_gearbox_height + 20); 
    
    // base sheet
    translate ([-sheet_upper_arm_motor_base_size[0] / 2, -sheet_upper_arm_motor_base_size[1] + nema_17_width / 2, -sheet_upper_arm_motor_base_size[2]]) upper_arm_motor_base_sheet();
    
    // top sheet
    translate ([-sheet_upper_arm_motor_top_size[0] / 2, -sheet_upper_arm_motor_top_size[1] + nema_17_width / 2, nema_17_with_50_1_gearbox_height]) upper_arm_motor_top_sheet();
    
    //screw pulley
    translate ([0, -distance_upper_arm_motor_shaft, nema_17_with_50_1_gearbox_height + 5 + 11]) mirror([0, 0, 1])
    upper_arm_screw_rotation_pulley();
  
  // shaft pulley at motor 
    translate ([0, 0, nema_17_with_50_1_gearbox_height + 5]) upper_arm_motor_pulley();
    
// belt
    rotate ([0, 0, -90])
    translate ([0, 0, nema_17_with_50_1_gearbox_height + 6]) belt_on_2_pulleys(11.5, 11.5, distance_upper_arm_motor_shaft, 9);
    echo(distance_upper_arm_motor_shaft = distance_upper_arm_motor_shaft);
// belt length    
    //echo (length_belt_on_2_pulleys(r1 = 14, r2 = 14, distance_between_pulleys = distance_upper_arm_motor_shaft));

// belt tensioner
    // first tower of bearings
    translate ([-10, -sheet_upper_arm_motor_top_size[1] + nema_17_width / 2 + sheet_upper_arm_motor_top_size[1] / 2 - 4, nema_17_with_50_1_gearbox_height]) {
        M4_sunken(30);
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2]) 624rs();
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2 + 5]) 624rs();
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2 + 10]) 624rs();
    }

    translate ([10, -sheet_upper_arm_motor_top_size[1] + nema_17_width / 2 + sheet_upper_arm_motor_top_size[1] / 2 - 4, nema_17_with_50_1_gearbox_height]) {
        M4_sunken(30);
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2]) 624rs();
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2 + 5]) 624rs();
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2 + 10]) 624rs();
    }
    
// traction pulley for elbow
    translate ([0, -distance_upper_arm_motor_shaft, nema_17_with_50_1_gearbox_height / 2 - 7])
    pulley(profile = "T5mm_pulley", num_teeth = 14, pulley_b_ht = 0, pulley_b_dia = 17, pulley_t_ht = 10);
    
    // bearing housing
// base
    bearing_extra_thick = 10;
    translate ([0, -distance_upper_arm_motor_shaft, rbearing_608_housing_size[2] + bearing_extra_thick]) mirror([0, 0, 1]) rbearing_608_housing_thicker(bearing_extra_thick);
    // top
    translate ([0, -distance_upper_arm_motor_shaft, nema_17_with_50_1_gearbox_height - rbearing_608_housing_size[2] - bearing_extra_thick]) rbearing_608_housing_thicker(bearing_extra_thick);
}
//---------------------------------------------------------------------------
module wrist_rotation_motor_with_components()
{
    nema_17_33_with_27_1_gearbox();
    
    // screw for rotation
    translate([0, - distance_upper_arm_motor_shaft, nema_17_L33_with_27_1_gearbox_height + 11 + 3 + 2]) mirror ([0, 0, 1]) M8_hexa (nema_17_L33_with_27_1_gearbox_height + 20); 
    
    // base sheet
    translate ([-sheet_upper_arm_motor_base_size[0] / 2, -sheet_upper_arm_motor_base_size[1] + nema_17_width / 2, -sheet_upper_arm_motor_base_size[2]]) upper_arm_motor_base_sheet();
    
    // top sheet
    translate ([-sheet_upper_arm_motor_top_size[0] / 2, -sheet_upper_arm_motor_top_size[1] + nema_17_width / 2, nema_17_L33_with_27_1_gearbox_height]) upper_arm_motor_top_sheet();
    
    //screw pulley
    translate ([0, -distance_upper_arm_motor_shaft, nema_17_L33_with_27_1_gearbox_height + 5 + 11]) mirror([0, 0, 1])
    upper_arm_screw_rotation_pulley();
  
  // shaft pulley at motor 
    translate ([0, 0, nema_17_L33_with_27_1_gearbox_height + 5]) upper_arm_motor_pulley();
    
// belt
    rotate ([0, 0, -90])
    translate ([0, 0, nema_17_L33_with_27_1_gearbox_height + 6]) belt_on_2_pulleys(11.5, 11.5, distance_upper_arm_motor_shaft, 9);
    echo(distance_upper_arm_motor_shaft = distance_upper_arm_motor_shaft);
// belt length    
    //echo (length_belt_on_2_pulleys(r1 = 14, r2 = 14, distance_between_pulleys = distance_upper_arm_motor_shaft));

// belt tensioner
    // first tower of bearings
    translate ([-10, -sheet_upper_arm_motor_top_size[1] + nema_17_width / 2 + sheet_upper_arm_motor_top_size[1] / 2 - 4, nema_17_L33_with_27_1_gearbox_height]) {
        M4_sunken(30);
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2]) 624rs();
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2 + 5]) 624rs();
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2 + 10]) 624rs();
    }

    translate ([10, -sheet_upper_arm_motor_top_size[1] + nema_17_width / 2 + sheet_upper_arm_motor_top_size[1] / 2 - 4, nema_17_L33_with_27_1_gearbox_height]) {
        M4_sunken(30);
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2]) 624rs();
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2 + 5]) 624rs();
        translate ([0, 0, sheet_upper_arm_motor_top_size[2] + 2 + 10]) 624rs();
    }
    
// traction pulley for elbow
    translate ([0, -distance_upper_arm_motor_shaft, nema_17_L33_with_27_1_gearbox_height / 2 - 7])
    pulley(profile = "T5mm_pulley", num_teeth = 14, pulley_b_ht = 0, pulley_b_dia = 17, pulley_t_ht = 10);
    
    // bearing housing
// base
    bearing_extra_thick = 1;
    translate ([0, -distance_upper_arm_motor_shaft, rbearing_608_housing_size[2] + bearing_extra_thick]) mirror([0, 0, 1]) rbearing_608_housing_thicker(bearing_extra_thick);
    // top
    translate ([0, -distance_upper_arm_motor_shaft, nema_17_L33_with_27_1_gearbox_height - rbearing_608_housing_size[2] - bearing_extra_thick]) rbearing_608_housing_thicker(bearing_extra_thick);
}
//---------------------------------------------------------------------------
module fore_arm_rotation_motor()
{
    nema_17_48_with_27_1_gearbox();
}
//---------------------------------------------------------------------------
module elbow_pulley_with_components()
{
    // pulley 
    rotate ([0, 0, 90]) elbow_pulley();
    
    // M6 screw
    translate([0, 0, printed_pulley_thick / 2.0 + 34]) mirror([0, 0, 1]) M6_hexa_screw(70);
    // bearing
    translate ([0, 0, elbow_pulley_thick / 2 - rb_626_thick - 1]) 626rs();
    //bearing
    translate([0, 0, elbow_pulley_thick / 2 + 1]) 626rs();
    // nut
    translate([0, 0, - arm_shaft_size / 2]) M6_autolock_nut();
    for (i = [0 : 1]){ // 2 washers on both sizes
      translate([0, 0, 2 * rb_626_thick + i * washer_6_thick]) washer_6_12();
      translate([0, 0, -(i + 1) * washer_6_thick]) washer_6_12();
    }
}
//---------------------------------------------------------------------------
module fore_arm()
{
        // bone
  translate([0, 0, -(elbow_rotation_motor_offset + rbearing_608_housing_size[0])]) fore_arm_bone();
     
    // support for elbow pulley bearings
//    translate ([0, - upper_arm_bone_length + upper_arm_bone_top_shift + 2 * rb_626_external_radius , 0]) rotate ([90, 0, 0]) tube_interior_cover(2 * rb_626_external_radius);
         
    // pulley for left-right rotation
    rotate ([0, 0, 90]) translate ([0, 0, upper_arm_pulley_thick]) mirror([0, 0, 1]) fore_arm_rotation_pulley(); 
    
    // stepper motor 
    translate ([0, -nema_17_L33_with_27_1_gearbox_height / 2, -(rbearing_608_housing_size[0] + elbow_rotation_motor_offset + nema_17_width / 2)]) 
    rotate([-90, 0, 0])
    //translate ([0, 0, -distance_upper_arm_motor_shaft])
    wrist_rotation_motor_with_components();
    
    // 6907 bearing for support
    translate ([0, 0, fore_arm_pulley_thick + 6]) 6907rs();    
    
    translate ([0, 0, fore_arm_pulley_thick + 2 * elbow_pulley_holes_dist_y + 6]) 6907rs();
    
    // gripper
    
// camera support
    translate ([-c920_length / 2, c920_depth / 2 + c920_dist_between_holder_holes / 2, fore_arm_length -(elbow_rotation_motor_offset + rbearing_608_housing_size[0])])   
    c920();
    
    translate ([0, fore_arm_pulley_thick / 2, fore_arm_length -8-(elbow_rotation_motor_offset + rbearing_608_housing_size[0])]) rotate ([90, angle_wrist, 0]) wrist_pulley_with_gripper();
    
    // belt
    translate ([0, 5, -(rbearing_608_housing_size[0] / 2 + pulley_spacer_length + 3)]) rotate([0, -90, 90]) belt_on_2_pulleys(10, 35, fore_arm_length, 9);
}
//---------------------------------------------------------------------------
module fore_arm_with_elbow_pulley()
{
  translate ([-61, elbow_pulley_radius + rb_6907_external_radius + 1.5, fore_arm_pulley_thick / 2])
   rotate([angle_fore_arm, 0, 0]) 
    rotate ([0, 90, 0]) 
        rotate([0, 0, 90]) 
            fore_arm()
    ;
    
    // top sheet for motor support
    translate ([-elbow_pulley_holes_dist_y - fore_arm_bearing_support_size[2] / 2, elbow_pulley_radius + rb_6907_external_radius + 1.5 - rbearing_6907_housing_size[0] / 2, fore_arm_rotation_motor_support_sheet_size[0] / 2 + 7])
    rotate([0, 90, 0])
    mirror([0, 0, 1])
    fore_arm_rotation_motor_support_sheet_top_with_belt_tensioner()
    ;
    
    // bottom sheet
    translate ([elbow_pulley_holes_dist_y + fore_arm_bearing_support_size[2] / 2 + 3, elbow_pulley_radius + rb_6907_external_radius + 1.5 - rbearing_6907_housing_size[0] / 2, fore_arm_rotation_motor_support_sheet_size[0] / 2 + 7])
    rotate([0, 90, 0])
    mirror([0, 0, 1])
    fore_arm_rotation_motor_support_sheet_bottom()
    ;
        
    // plastic support for forearm
  translate ([-elbow_pulley_holes_dist_y - fore_arm_bearing_support_size[2] / 2, fore_arm_bearing_support_size[0] + 10, fore_arm_pulley_thick / 2 + fore_arm_bearing_support_size[1]])
    rotate ([0, 90, 0]) 
        rotate([0, 0, -90]) {
            translate ([0, 0, 2 * elbow_pulley_holes_dist_y])
          //  [-21 - (2 * m4_screw_radius + 2 * wall_thick_2), -25, -2]
            fore_arm_bearing_support_with_bearing_holes();
            //translate ([0, 0, fore_arm_pulley_thick + 2 + 40 + 2 + 5]) 
            fore_arm_bearing_support_with_bearing_holes();
        }
// plastic support for forearm - the other side
  translate ([-elbow_pulley_holes_dist_y - fore_arm_bearing_support_size[2] / 2, fore_arm_bearing_support_size[0] + 10, fore_arm_pulley_thick / 2 - fore_arm_bearing_support_size[1]])
        mirror([0, 0, 1])
    rotate ([0, 90, 0]) 
        rotate([0, 0, -90]) 
        {
            translate ([0, 0, 2 * elbow_pulley_holes_dist_y])
          //  [-21 - (2 * m4_screw_radius + 2 * wall_thick_2), -25, -2]
            fore_arm_bearing_support_with_bearing_holes();
            //translate ([0, 0, fore_arm_pulley_thick + 2 + 40 + 2 + 5]) 
            fore_arm_bearing_support_with_bearing_holes();
        }
        
    // stepper motor
  translate ([ nema_17_with_19_1_gearbox_height - elbow_pulley_holes_dist_y- fore_arm_bearing_support_size[2] / 2,  elbow_pulley_radius + distance_fore_arm_rotation_motor_to_shaft - 1.5, 13 / 2]) 
    rotate ([0, -90, 0])
        fore_arm_rotation_motor()
        ;
    
    // motor pulley
    translate ([- elbow_pulley_holes_dist_y- fore_arm_bearing_support_size[2] / 2 - 20, elbow_pulley_radius + distance_fore_arm_rotation_motor_to_shaft - 1.5, 13 / 2]) rotate ([0, 90, 0]) 
    motor_pulley_8mm_shaft();
    
    // belt
    translate ([- elbow_pulley_holes_dist_y- fore_arm_bearing_support_size[2] / 2 - 8, elbow_pulley_radius + distance_fore_arm_rotation_motor_to_shaft, 13 / 2]) 
        rotate ([90, 0, 0]) rotate ([0, -90, 0]) 
    belt_on_2_pulleys(9, 35, 63, 10);
        
    
    // elbow pulley
    elbow_pulley_with_components();
}
//---------------------------------------------------------------------------
module upper_arm_bone_with_components()
{
    // bone
    upper_arm_bone();
        // sensor support
    translate ([as5147_elbow_support_size[1] / 2, -10, upper_arm_bone_length + as5147_space_between_holes_length / 2 + as5147_distance_hole_from_margin + 1 -8 ]) rotate ([0, 90, 90]) sensor_support_elbow();
}
//---------------------------------------------------------------------------

module upper_arm()
{
    // bone
   translate([0, upper_arm_bone_top_shift + rbearing_608_housing_size[0], 0]) rotate ([90, 0, 0]) upper_arm_bone_with_components();
         
    // pulley for left-right rotation
    translate ([0, 0, 0]) rotate([0, 90, 0]) rotate ([-90, 0, 0]) upper_arm_rotation_pulley(); 
    
    // stepper motor 
    translate ([0, rbearing_608_housing_size[0] / 2 +  14 + 5, -nema_17_with_50_1_gearbox_height / 2]) 
    rotate([0, 0, 0])
    translate ([0, distance_upper_arm_motor_shaft, 0])
    elbow_rotation_motor_with_components()
    ;
    
    // belt
    translate ([0, rbearing_608_housing_size[0] / 2 + upper_arm_bone_top_shift, upper_arm_motor_housing_shift + elbow_pulley_thick / 2 + 3]) rotate([0, 0, -90]) belt_on_2_pulleys(10, 30, upper_arm_bone_length -rbearing_608_housing_size[0] / 2 - 8, 6);
        // fore_arm
    translate ([0, - upper_arm_bone_length + (upper_arm_bone_top_shift + rbearing_608_housing_size[0] + 8), -elbow_pulley_thick / 2])  
        rotate([0, 0, angle_elbow]) 
               fore_arm_with_elbow_pulley()
    ;
}
//---------------------------------------------------------------------------

module shoulder(side)
{
    //plate
    translate ([-shoulder_plate_size[0] / 2, 0, 0]) shoulder_sheet();
    
    // motor
    translate ([-side * (- rbearing_6907_housing_size[0] / 2 + distance_upper_arm_rotation_motor_to_shaft), shoulder_plate_size[1] - nema_17_with_19_1_gearbox_height, rb_6907_external_radius + 3 + shoulder_plate_size[2]]) 
        rotate ([-90, 0, 0]) 
            body_arm_motor_with_sheet()
    ;
    
// motor gear for fore_arm  rotation
    translate ([-side * (- rbearing_6907_housing_size[0] / 2 + distance_upper_arm_rotation_motor_to_shaft), shoulder_plate_size[1] + 3 + 14, rb_6907_external_radius + 3 + shoulder_plate_size[2]]) 
    rotate ([90, 0, 0]) 
    motor_pulley_8mm_shaft()
    ;
    
    // screws for fixing motor housing to alu sheet
    /*
      for (i = [[-1, -1], [-1, 1], [1, -1], [1, 1]]){
            translate ([shoulder_plate_size[0] / 2, shoulder_plate_size[1] - nema_17_motor_gearbox_radius - 3, -wall_thick_base_motor_housing]) translate([i[0] * 35 / 2, i[1] * 28 / 2, 0])  M4_sunken(8);
            translate ([shoulder_plate_size[0] / 2, shoulder_plate_size[1] - nema_17_motor_gearbox_radius - 3, shoulder_plate_size[2]]) translate([i[0] * 35 / 2, i[1] * 28 / 2, 0])  rotate ([0, 0, 30]) M4_autolock_nut();
          
      }
  */    
    // bone support 1 top
    translate ([0, first_bearing_shoulder_offset + rbearing_6907_enclosed_housing_size[1] / 2, shoulder_plate_size[2] + rbearing_6907_enclosed_housing_size[2] + radial_bearing_vertical_housing_base_wall_thick])
      mirror([0, 0, 1])
        rbearing_6907_vertical_housing_bounded_half_with_horizontal_holes()
        ;   
   
       // bone support 1 bottom
    translate ([0, first_bearing_shoulder_offset + rbearing_6907_enclosed_housing_size[1] / 2, shoulder_plate_size[2]])
        rbearing_6907_vertical_housing_bounded_half_with_horizontal_holes()
        ;     
        
// bearing 1        
    translate ([0, rbearing_6907_enclosed_housing_size[1] / 2 + rb_6907_thick / 2 + first_bearing_shoulder_offset, shoulder_plate_size[2] + rb_6907_external_radius + radial_bearing_vertical_housing_base_wall_thick])
rotate([90, 0, 0])
        6907rs();
    
    // bone support 2
    translate ([0, shoulder_plate_size[1] - rbearing_6907_enclosed_housing_size[1] / 2, shoulder_plate_size[2] + rbearing_6907_enclosed_housing_size[2] + radial_bearing_vertical_housing_base_wall_thick])
      mirror([0, 0, 1])
        rbearing_6907_vertical_housing_bounded_half_with_horizontal_holes();
      
          // bone support 2
    translate ([0, shoulder_plate_size[1] - rbearing_6907_enclosed_housing_size[1] / 2, shoulder_plate_size[2]])
        rbearing_6907_vertical_housing_bounded_half_with_horizontal_holes();
        
        // bearing 2
    translate ([0, -rbearing_6907_enclosed_housing_size[1] / 2 + rb_6907_thick / 2 + shoulder_plate_size[1], shoulder_plate_size[2] + rb_6907_external_radius + radial_bearing_vertical_housing_base_wall_thick])
rotate([90, 0, 0])
        6907rs();
        
        // sheet for supporting the upper arm rotation motor
        translate ([rbearing_6907_housing_size[0] / 2 * side, shoulder_plate_size[1] + 3, rb_6907_external_radius + shoulder_plate_size[2] + 3 - upper_arm_rotation_motor_support_sheet_size[0] / 2]) rotate ([90 * side, 0, 0]) rotate([0, 0, 90 * side]) upper_arm_rotation_motor_support_sheet_top();

 
 // sensor support
 // first bearing
 translate ([0, 5, shoulder_plate_size[2] + rbearing_6907_enclosed_housing_size[2] + radial_bearing_vertical_housing_base_wall_thick + rbearing_688_housing_size[0] / 2 + 3]) rotate([-90, 0, 0]) 688rs();
 // housing
     translate ([0, rbearing_6907_enclosed_housing_size[1] , shoulder_plate_size[2] + rbearing_6907_enclosed_housing_size[2] + radial_bearing_vertical_housing_base_wall_thick + rbearing_688_housing_size[0] / 2 + 3])
     rotate([90, 0, 0])
     sensor_bearing_housing_bottom_upper_arm()
     ;
    
 // second bearing
 translate ([0, shoulder_plate_size[1] - 20, shoulder_plate_size[2] + rbearing_6907_enclosed_housing_size[2] + radial_bearing_vertical_housing_base_wall_thick + rbearing_688_housing_size[0] / 2 + 3]) rotate([-90, 0, 0]) 688rs(); 
 
  // housing
     translate ([0, shoulder_plate_size[1], shoulder_plate_size[2] + rbearing_6907_enclosed_housing_size[2] + radial_bearing_vertical_housing_base_wall_thick + rbearing_688_housing_size[0] / 2 + 3])//mirror([0, 0, 1])
    rotate([90, 0, 0]) 
     sensor_bearing_housing_top_upper_arm();
     
 // shaft
 
  translate ([0, 0, shoulder_plate_size[2] + rbearing_6907_enclosed_housing_size[2] + radial_bearing_vertical_housing_base_wall_thick + rbearing_688_housing_size[0] / 2 + 3]) rotate([-90, 0, 0]) cylinder(h = shoulder_plate_size[1], r = 4);
  
  // pulley for sensor shaft rotation
   translate ([0, shoulder_plate_size[1] / 2, shoulder_plate_size[2] + rbearing_6907_enclosed_housing_size[2] + radial_bearing_vertical_housing_base_wall_thick + rbearing_688_housing_size[0] / 2 + 3]) rotate([-90, 0, 0]) pulley_upper_arm_sensor_shaft(); 
 
     // sensor pulley for arm shaft - (for sensor)
    translate ([0, shoulder_plate_size[1] / 2, shoulder_plate_size[2] + rbearing_6907_enclosed_housing_size[2] - rb_6907_external_radius]) rotate([-90, 0, 0]) pulley_upper_arm_bone_for_sensor();
    
    // belt
    translate ([0, shoulder_plate_size[1] / 2 +3, shoulder_plate_size[2] + rbearing_6907_enclosed_housing_size[2] - rb_6907_external_radius]) rotate ([0, -90, 0]) rotate ([-90, 0, 0]) belt_on_2_pulleys(18, 13, 42, 6);
    
        // continuation with upper arm
    translate ([0, shoulder_plate_size[1] + 3, rb_6907_external_radius + shoulder_plate_size[2] + 3]) rotate ([0, angle_upper_arm, 0]) 
    upper_arm()
    ; 
}
//---------------------------------------------------------------------------
module body_arm_motor_with_sheet()
{
    nema_17_48_with_27_1_gearbox();  
}
//---------------------------------------------------------------------------
module body_articulation(side)
{
        // plate
    
    translate([-plate_body_size[0] / 2, 0, 0]) body_articulation_sheet();

    // motor    
    translate ([rbearing_6907_housing_size[0] / 2 - distance_arm_up_down_motor_to_shaft, -nema_17_with_50_1_gearbox_height + plate_body_size[1], rb_6907_external_radius + plate_body_size[2] + 4])
    rotate ([-90, 0, 0]) nema_17_with_50_1_gearbox();
    
    // motor sheet
    translate ([rbearing_6907_housing_size[0] / 2, plate_body_size[1], - arm_up_down_motor_sheet_size[0] / 2 + rb_6907_external_radius + plate_body_size[2] + 4]) mirror ([0, 1, 0]) rotate ([0, -90, 0]) rotate ([90, 0, 0]) arm_up_down_motor_top_sheet_with_belt_tensioner();

// motor sheet bottom    
    translate ([rbearing_6907_housing_size[0] / 2, 0, - arm_up_down_motor_sheet_size[0] / 2 + rb_6907_external_radius + plate_body_size[2] + 4]) rotate ([0, -90, 0]) rotate ([90, 0, 0]) arm_up_down_motor_bottom_sheet();

    // motor gear
    translate ([- distance_arm_up_down_motor_to_shaft + rbearing_6907_housing_size[0] / 2, plate_body_size[1] + 20, rb_6907_external_radius + plate_body_size[2] + 4])
rotate ([90, 0, 0])  motor_pulley_8mm_shaft();
        
    //support upper arm
    // first bearing housing
    
   translate ([0, rbearing_6907_vertical_housing_size_bounded_half_small_bottom[1] / 2, rbearing_6907_enclosed_housing_size[2] + plate_body_size[2] + 4])  
   mirror ([0, 0, 1]) 
    rbearing_6907_vertical_housing_bounded_half_with_horizontal_holes();
    ;
   translate ([0, rbearing_6907_vertical_housing_size_bounded_half_small_bottom[1] / 2, plate_body_size[2]])  
    rbearing_6907_vertical_housing_bounded_half_with_horizontal_holes();
    ;
    
    // bearing
    translate ([0, +rbearing_6907_vertical_housing_size_bounded_half_small_bottom[1] / 2 + rb_6907_thick / 2, plate_body_size[2] + rb_6907_external_radius + 4])
        rotate([90, 0, 0]) 6907rs();
    
// second bearing housing
    
   translate ([0, plate_body_size[1] - rbearing_6907_vertical_housing_size_bounded_half_small_bottom[1] / 2, rbearing_6907_enclosed_housing_size[2] + plate_body_size[2] + 4])  
   mirror ([0, 0, 1]) 
    rbearing_6907_vertical_housing_bounded_half_with_horizontal_holes();

   translate ([0, plate_body_size[1] - rbearing_6907_vertical_housing_size_bounded_half_small_bottom[1] / 2, plate_body_size[2]])  
    rbearing_6907_vertical_housing_bounded_half_with_horizontal_holes();

    // bearing
    translate ([0, plate_body_size[1]  - rbearing_6907_vertical_housing_size_bounded_half_small_bottom[1] / 2 + rb_6907_thick / 2, plate_body_size[2] + rb_6907_external_radius + 4])
        rotate([90, 0, 0]) 6907rs();
    
    // shaft
    translate ([0, plate_body_size[1] + pulley_T5_6mm_thick + 2, rb_6907_external_radius + plate_body_size[2] + 4]) 
      rotate ([0, angle_shoulder, 0]) 
        rotate ([90, 0, 0]) 
            color (aluminium_color)
                shoulder_up_down_bone()
              ;
    // magnet holder
     translate ([0, plate_body_size[1] + pulley_HTD_5m_thick + 2 - 10, rb_6907_external_radius + plate_body_size[2] + 4]) 
      rotate ([0, angle_shoulder, 0]) 
        rotate ([-90, 0, 0]) 
            magnet_holder2_with_magnet(holder_height = 10, magnet_radius = 4, magnet_thick = 2.5, tube_internal_radius = 11,  tower_height = 10, tower_external_radius = 6)
            ;
            
    // sensor support
    translate ([-(distance_arm_up_down_motor_to_shaft - nema_17_motor_gearbox_radius - 2 - rbearing_6907_housing_size[0] / 2), plate_body_size[1] + 25, plate_body_size[2] + 4 + rb_6907_external_radius]) mirror ([0, 1, 0]) rotate ([0, -90, 0]) rotate ([-90, 0, 0])
            arm_up_down_sensor_support()
            ;    
    
    // pulley 
    translate ([0, plate_body_size[1] + pulley_T5_6mm_thick + 5, rb_6907_external_radius + plate_body_size[2] + 4])
      rotate ([90, 0, 0])
        rotate ([0, 0, -angle_shoulder])
          shoulder_traction_pulley()
          ;

    // continue with upper arm
    translate ([0, -upper_arm_shaft_support_length + plate_body_size[1] + pulley_T5_6mm_thick + 5 + shoulder_plate_size[0] / 2 , rb_6907_external_radius + 4])
      rotate ([0, angle_shoulder, 0])
        translate([offset_shoulder_plate_bracket, 0, arm_shaft_size / 2 + plate_body_size[2]])
          rotate ([0, 0, 90])
          shoulder(side) 
            ;
}
//---------------------------------------------------------------------------
module arm(side)
{    
    body_articulation(side);
}
//---------------------------------------------------------------------------
arm(1);

//body_articulation(1);

//shoulder(-1);

//upper_arm();

//upper_arm_bone_with_components();

//fore_arm_bearing_support_with_bearing_holes();

//fore_arm_with_elbow_pulley();

//fore_arm();

//upper_arm_bone();

//motor_pulley_8mm_shaft(); //6x

//elbow_rotation_motor_with_components();

//wrist_rotation_motor_with_components();

//fore_arm_pulley();

//fore_arm_with_elbow_pulley();

//elbow_pulley();

//elbow_pulley_with_components();

//upper_arm_rotation_pulley();

//body_articulation_sheet();

//body_arm_motor_with_sheet();


//shoulder_traction_pulley(); // 1x

//upper_arm_screw_rotation_pulley();

//upper_arm_motor_pulley();

//rbearing_608_housing_thicker(10); // 4x

//rbearing_6907_vertical_housing_bounded_half_with_horizontal_holes();

//fore_arm_bone();