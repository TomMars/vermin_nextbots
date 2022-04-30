AddCSLuaFile()

ENT.Base            = "vermin_base"

ENT.model = "models/newrat.mdl"
ENT.skin = {4, 5}
ENT.health = 10
ENT.speed = 150
ENT.radius = 200

list.Set("NPC", "lab_rat", {
    Name = "Lab Rat",
    Class = "lab_rat",
    Category = "Nextbot Animals"
})