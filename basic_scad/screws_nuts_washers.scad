// Author: Mihai Oltean, https://mihaioltean.github.io, mihai.oltean@gmail.com
// More details: https://jenny5.org, https://jenny5-robot.github.io/
// Source code: github.com/jenny5-robot
// License: MIT
//--------------------------------------------------------------

include <params_screws_nuts_washers.scad>
include <params_basic_components.scad>
include <material_colors.scad>
include <tolerance.scad>

//--------------------------------------------------------------
module nut (internal_radius, external_radius, height)
{
	color (screw_color)
	difference() {
		cylinder ( h = height, r = external_radius, $fn = 6);
		translate ([0, 0, -tolerance]) cylinder ( h = height + 2 * tolerance, r = internal_radius, $fn = 30);
	}
}
//--------------------------------------------------------------
module nut_butterfly(internal_radius, external_radius, height)
{
	color (screw_color){
		difference() {
			cylinder ( h = height, r1 = external_radius + 1, r2 = external_radius, $fn = 30);
			translate ([0, 0, -tolerance]) cylinder ( h = height + 2 * tolerance, r = internal_radius, $fn = 30);
		}
		// aripioare
		translate ([external_radius + 1, -1, 0]) rotate ([0, -40, 0]) cube([10, 2, 4]);
		rotate ([0, 0, 180]) translate ([external_radius + 1, -1, 0]) rotate ([0, -40, 0]) cube([10, 2, 4]);
	}
	
}
//--------------------------------------------------------------
module autolock_nut (internal_radius, external_radius, height)
{
	color (screw_color)
	difference() {
		union(){
			cylinder ( h = height - 1, r = external_radius, $fn = 6);
			translate ([0, 0, height - 1]) cylinder ( h = 1, r = internal_radius + 1, $fn = 30);
		}
		translate ([0, 0, -tolerance]) cylinder ( h = height + 2 * tolerance, r = internal_radius, $fn = 30);
	}
}
//--------------------------------------------------------------
module hexa_screw (screw_radius, screw_length, head_radius, head_thick)
{
	color (screw_color)
	union(){
		cylinder (h = head_thick, r = head_radius, $fn = 6);
		translate ([0, 0, head_thick]) cylinder (h = screw_length, r = screw_radius, $fn = 30);
	}
}
//--------------------------------------------------------------
module inbus_screw (screw_radius, screw_length, head_radius, head_thick)
{
	color (screw_color)
	difference(){
		union(){
			cylinder (h = head_thick, r = head_radius, $fn = 30);
			translate ([0, 0, head_thick]) cylinder (h = screw_length, r = screw_radius, $fn = 30);
		}
		translate ( - tolerance_z) cylinder (h = head_thick, r = 4, $fn = 6);
	}
}
//--------------------------------------------------------------
module screw (screw_radius, screw_length, head_radius, head_thick)
{
	color (screw_color)
	difference(){
		union(){
			cylinder (h = head_thick, r = head_radius, $fn = 30);
			translate ([0, 0, head_thick]) cylinder (h = screw_length, r = screw_radius, $fn = 30);
		}
		translate ([-head_radius, -0.75, 0] - display_tolerance_z) cube([2 * head_radius, 1.5, head_thick - 0.5 + display_tolerance]);
	}
}
//--------------------------------------------------------------
module sunken_screw (screw_radius, screw_length, head_radius, head_thick)
{
	color (screw_color)
	difference(){
		union(){
			cylinder (h = head_thick, r1 = head_radius, r2 = screw_radius, $fn = 30);
			cylinder (h = screw_length, r = screw_radius, $fn = 30);
		}
		translate ([-head_radius, -0.75, 0] - display_tolerance_z) cube([2 * head_radius, 1.5, head_thick - 0.5 + display_tolerance]);
	}
}
//--------------------------------------------------------------
module grub_screw (screw_radius, screw_length)
{
	color (screw_color)
	difference(){
		union(){
			cylinder (h = screw_length, r = screw_radius, $fn = 30);
		}
		translate ([-screw_radius, -0.75, 0] - display_tolerance_z) cube([2 * screw_radius, 1.5, 1 + display_tolerance]);
	}
}
//--------------------------------------------------------------
module washer (internal_radius, external_radius, thick)
{
	color (screw_color)
	difference() {
		cylinder ( h = thick, r = external_radius, $fn = 30);
		translate (-tolerance_z) cylinder ( h = thick + 2 * tolerance, r = internal_radius, $fn = 30);
	}
}
//--------------------------------------------------------------
module M3x10_sunken()
{
	sunken_screw(m3_screw_radius, 10, m3_nut_radius, m3_nut_thick);
}
//--------------------------------------------------------------
module M3x15()
{
	screw(m3_screw_radius, 15, m3_nut_radius, m3_nut_thick);
}
//--------------------------------------------------------------
module M4x40_screw()
{
	screw(m4_screw_radius, 40, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x20_sunken()
{
	sunken_screw(m4_screw_radius, 20, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x18_sunken()
{
	sunken_screw(m4_screw_radius, 18, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------

module M4x30_sunken()
{
	sunken_screw(m4_screw_radius, 30, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x35_sunken()
{
	sunken_screw(m4_screw_radius, 35, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x40_sunken()
{
	sunken_screw(m4_screw_radius, 40, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x50_sunken()
{
	sunken_screw(m4_screw_radius, 50, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4_sunken(length)
{
	sunken_screw(m4_screw_radius, length, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x12_hexa()
{
	hexa_screw(m4_screw_radius, 12, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x16_hexa()
{
	hexa_screw(m4_screw_radius, 16, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x20_hexa()
{
	hexa_screw(m4_screw_radius, 20, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x25_hexa()
{
	hexa_screw(m4_screw_radius, 25, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x30_hexa()
{
	hexa_screw(m4_screw_radius, 30, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x40_hexa()
{
	hexa_screw(m4_screw_radius, 40, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4x45_hexa()
{
	hexa_screw(m4_screw_radius, 45, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M4_hexa(length)
{
	hexa_screw(m4_screw_radius, length, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M8x40_inbus()
{
	inbus_screw(M8_screw_radius, 40, M8_nut_radius, M8_nut_thick);
}
//--------------------------------------------------------------
module M8_hexa_screw(length)
{
	hexa_screw(M8_screw_radius, length, m8_nut_radius, m8_nut_thick);
}
//--------------------------------------------------------------
module M8x20_hexa()
{
	hexa_screw(M8_screw_radius, 20, M8_nut_radius, M8_nut_thick);
}
//--------------------------------------------------------------
module M8x50_hexa()
{
	hexa_screw(M8_screw_radius, 50, M8_nut_radius, M8_nut_thick);
}
//--------------------------------------------------------------
module M8x60_hexa()
{
	hexa_screw(M8_screw_radius, 60, M8_nut_radius, M8_nut_thick);
}
//--------------------------------------------------------------
module M8x70_hexa()
{
	hexa_screw(M8_screw_radius, 70, M8_nut_radius, M8_nut_thick);
}
//--------------------------------------------------------------
module M8x80_hexa()
{
	hexa_screw(M8_screw_radius, 80, M8_nut_radius, M8_nut_thick);
}
//--------------------------------------------------------------
module M8_hexa(length = 100)
{
	hexa_screw(M8_screw_radius, length, M8_nut_radius, M8_nut_thick);
}
//--------------------------------------------------------------
module M12_hexa(length)
{
	hexa_screw(M12_screw_radius, length, M12_nut_radius, M12_nut_thick);
}
//--------------------------------------------------------------
module M3_nut()
{
	nut(m3_screw_radius, m3_nut_radius, m3_nut_thick);
}
//--------------------------------------------------------------
module M12_nut()
{
	nut(M12_screw_radius, M12_nut_radius, M12_nut_thick);
}
//--------------------------------------------------------------
module M12_long_nut()
{
	nut(M12_screw_radius, M12_nut_radius, M12_long_nut_thick);
}
//--------------------------------------------------------------
module M12_long_long_nut()
{
	nut(M12_screw_radius, M12_nut_radius, M12_long_long_nut_thick);
}
//--------------------------------------------------------------
module M3_autolock_nut()
{
	autolock_nut(m3_screw_radius, m3_nut_radius, m3_auto_lock_nut_height);
}
//--------------------------------------------------------------
module M12_autolock_nut()
{
	autolock_nut(M12_screw_radius, M12_nut_radius, M12_autolock_nut_thick);
}
//--------------------------------------------------------------
module M3x5_grub()
{
	grub_screw(m3_screw_radius, 5);
}
//--------------------------------------------------------------
module M6x50_hexa_screw()
{
	hexa_screw(m6_screw_radius, 50, m6_nut_radius, m6_nut_thick);
}
//--------------------------------------------------------------
module M6x40_hexa_screw()
{
	hexa_screw(m6_screw_radius, 40, m6_nut_radius, m6_nut_thick);
}
//--------------------------------------------------------------
module M6_hexa_screw(length)
{
	hexa_screw(m6_screw_radius, length, m6_nut_radius, m6_nut_thick);
}
//--------------------------------------------------------------
module M5_sunken(length)
{
	sunken_screw(m5_screw_radius, length, m5_nut_radius, m5_nut_thick);
}
//--------------------------------------------------------------
module M6_sunken(length)
{
	sunken_screw(m6_screw_radius, length, m6_nut_radius, m6_nut_thick);
}
//--------------------------------------------------------------
module M12_sunken(length)
{
	sunken_screw(M12_screw_radius, length, M12_nut_radius, M12_nut_thick);
}
//--------------------------------------------------------------
module M4_nut()
{
	nut(m4_screw_radius, m4_nut_radius, m4_nut_thick);
}
//--------------------------------------------------------------
module M6_nut()
{
	nut(m6_screw_radius, m6_nut_radius, m6_nut_thick);
}
//--------------------------------------------------------------
module M8_nut()
{
	nut(M8_screw_radius, M8_nut_radius, M8_nut_thick);
}
//--------------------------------------------------------------
module M8_slim_nut()
{
	nut(M8_screw_radius, M8_nut_radius, M8_slim_nut_height);
}
//--------------------------------------------------------------
module M10_nut()
{
	nut(m10_screw_radius, m10_nut_radius, m10_nut_thick);
}
//--------------------------------------------------------------
module M4_autolock_nut()
{
	autolock_nut(m4_screw_radius, m4_nut_radius, m4_auto_lock_nut_height);
}
//--------------------------------------------------------------
module M6_autolock_nut()
{
	autolock_nut(m6_screw_radius, m6_nut_radius, m6_autolock_nut_thick);
}
//--------------------------------------------------------------
module M8_autolock_nut()
{
	autolock_nut(M8_screw_radius, M8_nut_radius, M8_autolock_nut_thick);
}
//--------------------------------------------------------------
module M4x12_washer()
{
	washer(2.15, 6, washer_4_thick);
}
//--------------------------------------------------------------
module M4x9_washer()
{
	washer(2.15, 4.5, washer_4_thick);
}
//--------------------------------------------------------------
module washer_4_9()
{
	washer(2.15, 4.5, washer_4_thick);
}
//--------------------------------------------------------------
module washer_4_12()
{
	washer(2.15, 6, washer_4_thick);
}
//--------------------------------------------------------------
module washer_9_16()
{
	washer(4.5, 8, washer_8_thick);
}
//--------------------------------------------------------------
module washer_4_15()
{
	washer(2.15, 7.5, washer_4_thick);
}
//--------------------------------------------------------------
module washer_6_12()
{
	washer(3.15, 6, washer_6_thick);
}
//--------------------------------------------------------------
module M12_washer()
{
	washer(6, 12, washer_12_thick);
}
//--------------------------------------------------------------

washer_4_12();
M4x40_hexa();