AddCSLuaFile()

ENT.Base            = "vermin_base"

ENT.model = "models/newrat.mdl"
ENT.skin = {0, 1, 2, 3}
ENT.health = 10
ENT.speed = 150
ENT.radius = 200

list.Set("NPC", "basic_rat", {
    Name = "Basic Rat",
    Class = "basic_rat",
    Category = "Nextbot Animals"
})