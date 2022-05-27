// Created by Crowbar 0.71

$modelname "vermin\cockroach.mdl"
$cdmaterials "vermin\"

$bodygroup "studio"
{
	studio "cockroach.smd"
}

$texturegroup skinfamilies
{
	{ "roach_american" }
}

$lod 15
{
	replacemodel "cockroach.smd" "cockroach_LOD1.smd"
}

$lod 30
{
	replacemodel "cockroach.smd" "cockroach_LOD2.smd"

	replacebone "foreleg_L_tibia" "foreleg_L"
	replacebone "foreleg_r_tibia" "foreleg_r"
	replacebone "midleg_L_tibia" "midleg_L"
	replacebone "midleg_r_tibia" "midleg_r"
	replacebone "hindleg_L_tibia" "hindleg_L"
	replacebone "hindleg_r_tibia" "hindleg_r"
}

$lod 45
{
	replacemodel "cockroach.smd" "cockroach_LOD3.smd"

	bonetreecollapse "foreleg_L"
	bonetreecollapse "foreleg_r"
	bonetreecollapse "midleg_L"
	bonetreecollapse "midleg_r"
	bonetreecollapse "hindleg_L"
	bonetreecollapse "hindleg_r"
	replacebone "foreleg_L" "metathorax"
	replacebone "foreleg_r" "metathorax"
	replacebone "midleg_L" "thorax"
	replacebone "midleg_r" "thorax"
	replacebone "hindleg_L" "thorax"
	replacebone "hindleg_r" "thorax"
}

$lod 60
{
	replacemodel "cockroach.smd" "cockroach_LOD4.smd"

	bonetreecollapse "foreleg_L"
	bonetreecollapse "foreleg_r"
	bonetreecollapse "midleg_L"
	bonetreecollapse "midleg_r"
	bonetreecollapse "hindleg_L"
	bonetreecollapse "hindleg_r"
	replacebone "foreleg_L" "metathorax"
	replacebone "foreleg_r" "metathorax"
	replacebone "midleg_L" "thorax"
	replacebone "midleg_r" "thorax"
	replacebone "hindleg_L" "thorax"
	replacebone "hindleg_r" "thorax"
}

$shadowlod
{
	replacemodel "cockroach.smd" "cockroach_LOD4.smd"

	bonetreecollapse "foreleg_L"
	bonetreecollapse "foreleg_r"
	bonetreecollapse "midleg_L"
	bonetreecollapse "midleg_r"
	bonetreecollapse "hindleg_L"
	bonetreecollapse "hindleg_r"
	replacebone "foreleg_L" "metathorax"
	replacebone "foreleg_r" "metathorax"
	replacebone "midleg_L" "thorax"
	replacebone "midleg_r" "thorax"
	replacebone "hindleg_L" "thorax"
	replacebone "hindleg_r" "thorax"
}

$surfaceprop "alienflesh"
$contents "solid"
$illumposition 0 0 1.75
$cbox 0 0 0 0 0 0
$bbox -3.25 -2.5 0 3.25 2.5 3.45

$hboxset "default"
$hbox 0 "thorax" -1.17 -1.98 -1.28 1.17 1.27 0.39
$hbox 0 "metathorax" -1.17 -0.45 -1.35 1.17 2.05 0.34
$hbox 0 "head" -0.5 -0.13 -0.5 0.5 0.63 0.7

$definebone "thorax" "" -0.000000 1.228939 0.752691 0.000000 0.000000 179.999985 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "metathorax" "thorax" 0.000000 1.669091 0.000000 -0.000115 0.000057 -8.560906 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "head" "metathorax" -0.000001 2.091347 -0.223149 -0.000000 0.000057 -11.223844 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "foreleg_L" "metathorax" 0.267135 1.261191 0.226876 1.177772 -98.430428 48.398033 0.000000 0.000000 0.000000 -0.000002 -0.000001 0.000000
$definebone "foreleg_L_tibia" "foreleg_L" 0.000000 0.554755 0.000000 2.070440 6.531890 -35.142876 0.000000 0.000000 0.000000 -0.000002 0.000000 0.000003
$definebone "foreleg_r" "metathorax" -0.267134 1.261191 0.226877 -1.178001 98.430199 48.398315 0.000000 0.000000 0.000000 0.000001 -0.000000 0.000000
$definebone "foreleg_r_tibia" "foreleg_r" 0.000000 0.554755 -0.000000 -2.070440 -6.531718 -35.142937 0.000000 0.000000 0.000000 -0.000001 0.000001 -0.000001
$definebone "midleg_L" "thorax" 0.267732 1.669091 0.256857 -0.000000 -89.999985 19.898710 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "midleg_L_tibia" "midleg_L" 0.000000 0.614373 -0.000000 -0.000000 0.000000 -10.813950 0.000000 -0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "midleg_r" "thorax" -0.267732 1.669091 0.256857 -0.000000 90.000038 19.898767 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "midleg_r_tibia" "midleg_r" 0.000000 0.614373 0.000000 -0.000000 0.000000 -10.813949 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "hindleg_L" "thorax" 0.264400 0.000000 0.288032 -0.000000 -89.999985 18.721912 0.000000 0.000000 -0.000000 -0.000000 0.000000 0.000000
$definebone "hindleg_L_tibia" "hindleg_L" -0.000000 0.632462 -0.000000 -0.000000 0.000000 -9.516599 0.000000 -0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "hindleg_r" "thorax" -0.264399 0.000000 0.288032 -0.000000 90.000038 18.721970 0.000000 -0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "hindleg_r_tibia" "hindleg_r" 0.000000 0.632462 0.000000 -0.000000 0.000000 -9.516601 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000


$sequence "ragdoll" {
	"anims\ragdoll.smd"
	activity "ACT_DIERAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionjoints "cockroach_physics.smd"
{
	$mass 1
	$inertia 10
	$damping 0.01
	$rotdamping 1
	$rootbone "thorax"

	$jointconstrain "metathorax" x limit -50 70 0.04
	$jointconstrain "metathorax" y limit -30 30 0.04
	$jointconstrain "metathorax" z limit -50 50 0.04

	$jointconstrain "head" x limit -50 50 0.04
	$jointconstrain "head" y limit -40 40 0.04
	$jointconstrain "head" z limit -15 15 0.04
}