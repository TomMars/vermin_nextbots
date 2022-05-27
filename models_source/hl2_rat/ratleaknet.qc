// Created by Crowbar 0.71

$modelname "vermin\rat.mdl"
$cdmaterials "vermin\"

$bodygroup "studio"
{
	studio "rat_reference.smd"
}

$texturegroup skinfamilies
{
	{ "rat_classic" }
	{ "rat_grey" }
	{ "rat_black" }
	{ "rat_brown" }
	{ "rat_white" }
	{ "rat_albino" }
}

$lod 15
{
	replacemodel "rat_reference.smd" "rat_reference_LOD1.smd"
}

$lod 30
{
	replacemodel "rat_reference.smd" "rat_reference_LOD2.smd"

	replacebone "rat.tail3" "rat.tail2"
	replacebone "rat.tarsus_L" "rat.tibia_L"
	replacebone "rat.tarsus_r" "rat.tibia_r"
}

$lod 45
{
	replacemodel "rat_reference.smd" "rat_reference_LOD3.smd"

	bonetreecollapse "rat.tail1"
	replacebone "rat.tarsus_L" "rat.tibia_L"
	replacebone "rat.tarsus_r" "rat.tibia_r"
}

$lod 60
{
	replacemodel "rat_reference.smd" "rat_reference_LOD4.smd"

	bonetreecollapse "rat.tail1"
	bonetreecollapse "rat.femur_L"
	bonetreecollapse "rat.femur_r"
	replacebone "rat.arm_L_radius" "rat.arm_L_humerus"
	replacebone "rat.arm_r_radius" "rat.arm_r_humerus"
}

$shadowlod
{
	replacemodel "rat_reference.smd" "rat_reference_LOD4.smd"

	bonetreecollapse "rat.tail1"
	bonetreecollapse "rat.femur_L"
	bonetreecollapse "rat.femur_r"
	replacebone "rat.arm_L_radius" "rat.arm_L_humerus"
	replacebone "rat.arm_r_radius" "rat.arm_r_humerus"
}

$surfaceprop "flesh"
$contents "solid"
$illumposition 0 6.683 4.919
$cbox 0 0 0 0 0 0
$bbox -10 -3.988 0 11.157 3.988 9.839

$hboxset "default"
$hbox 0 "rat.hips" -3.5 -4.5 -3.75 2.5 2.5 3.75
$hbox 0 "rat.spine" -2.79 -4.5 -3 2.79 1.5 3
$hbox 0 "rat.head" -0.96 -2.75 -2.25 5.03 1.75 2.25
$hbox 0 "rat.tail1" -1 -1.25 -1.2 6 1.25 1.8
$hbox 0 "rat.tail2" 0 -0.58 -0.73 7 0.58 1.02

$definebone "rat.hips" "" 0 4.487925 7.219572 0 89.999982 89.999982 0 0 0 0 0 0
$definebone "rat.spine" "rat.hips" -6.24552 0.306979 0 0.000019 180.000005 -180.000005 0 0 0 0 0 0
$definebone "rat.head" "rat.spine" 4.128282 -0.354312 0 0 0 0 0 0 0 0 0 0
$definebone "rat.arm_L_humerus" "rat.spine" 1.476702 -1.942044 -1.630675 10.08518 -119.29827 174.56006 0 0 0 0 0 0
$definebone "rat.arm_L_radius" "rat.arm_L_humerus" 2.895893 0 0 0 -65.066062 0.000002 0 0 0 0 0 0
$definebone "rat.arm_r_humerus" "rat.spine" 1.476702 -1.942043 1.630675 -10.085203 -119.298297 5.439949 0 0 0 0 0 0
$definebone "rat.arm_r_radius" "rat.arm_r_humerus" 2.895894 0 0 0.000001 65.066062 0.000001 0 0 0 0 0 0
$definebone "rat.femur_L" "rat.hips" 0.77097 -1.378489 2.042785 -13.518365 -95.772475 1.353785 0 0 0 0 0 0
$definebone "rat.tibia_L" "rat.femur_L" 2.909593 0 0 0 55.871979 -0.000002 0 0 0 0 0 0
$definebone "rat.tarsus_L" "rat.tibia_L" 3.017056 0 0 0 -110.131664 0.000003 0 0 0 0 0 0
$definebone "rat.femur_r" "rat.hips" 0.77097 -1.378489 -2.042785 13.518345 -95.772503 178.646221 0 0 0 0 0 0
$definebone "rat.tibia_r" "rat.femur_r" 2.909593 0 0 0 -55.871979 0.000002 0 0 0 0 0 0
$definebone "rat.tarsus_r" "rat.tibia_r" 3.017055 0 0 -0.000002 110.131664 -0.000002 0 0 0 0 0 0
$definebone "rat.tail1" "rat.hips" 3.069408 -1.178342 0 0 -20.411566 89.999982 0 0 0 0 0 0
$definebone "rat.tail2" "rat.tail1" 6.026319 0 0 1.756976 0 0 0 0 0 0 0 0
$definebone "rat.tail3" "rat.tail2" 6.031434 0 0 4.27782 0 0 0 0 0 0 0 0

$sequence "ragdoll" {
	"anims\ragdoll.smd"
	activity "ACT_DIERAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "idle" {
	"anims\idle1.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "idle2" {
	"anims\idle2.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "idle3" {
	"anims\idle3.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "walk" {
	"anims\walk.smd"
	activity "ACT_WALK" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
	walkframe 1 LX LY
	walkframe 2 LX LY
	walkframe 3 LX LY
	walkframe 4 LX LY
	walkframe 5 LX LY
	walkframe 6 LX LY
	walkframe 7 LX LY
	walkframe 8 LX LY
	walkframe 9 LX LY
	walkframe 10 LX LY
	walkframe 11 LX LY
	walkframe 12 LX LY
	walkframe 13 LX LY
	walkframe 14 LX LY
	walkframe 15 LX LY
	walkframe 16 LX LY
	walkframe 17 LX LY
	walkframe 18 LX LY
	walkframe 19 LX LY
	walkframe 20 LX LY
	walkframe 21 LX LY
	walkframe 22 LX LY
	walkframe 23 LX LY
	walkframe 24 LX LY
	walkframe 25 LX LY
	walkframe 26 LX LY
	walkframe 27 LX LY
	walkframe 28 LX LY
	walkframe 29 LX LY
	LX LY
}

$sequence "run" {
	"anims\run.smd"
	activity "ACT_RUN" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
	walkframe 1 LX LY
	walkframe 2 LX LY
	walkframe 3 LX LY
	walkframe 4 LX LY
	walkframe 5 LX LY
	walkframe 6 LX LY
	walkframe 7 LX LY
	walkframe 8 LX LY
	walkframe 9 LX LY
	walkframe 10 LX LY
	walkframe 11 LX LY
	walkframe 12 LX LY
	walkframe 13 LX LY
	walkframe 14 LX LY
	LX LY
}

$collisionjoints "ratleaknet_physics.smd"
{
	$mass 2
	$inertia 10
	$damping 0.01
	$rotdamping 1
	$rootbone "rat.hips"


	$jointconstrain "rat.tail1" x limit 0 0 0.04
	$jointconstrain "rat.tail1" y limit -28 30 0.04
	$jointconstrain "rat.tail1" z limit -41 41 0.04

	$jointconstrain "rat.tail2" x limit 0 0 0
	$jointconstrain "rat.tail2" y limit -32 37 0.04
	$jointconstrain "rat.tail2" z limit -35 35 0.04

	$jointconstrain "rat.spine" x limit 0 0 0
	$jointconstrain "rat.spine" y limit -35 35 0.04
	$jointconstrain "rat.spine" z limit -30 28 0.04

	$jointconstrain "rat.head" x limit 0 0 0
	$jointconstrain "rat.head" y limit -48 48 0.04
	$jointconstrain "rat.head" z limit -59 30 0.04

	$jointconstrain "rat.tail3" x limit 0 0 0
	$jointconstrain "rat.tail3" y limit -32 32 0.04
	$jointconstrain "rat.tail3" z limit -30 30 0.04
}
