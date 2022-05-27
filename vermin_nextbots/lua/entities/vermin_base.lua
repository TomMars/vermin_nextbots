AddCSLuaFile()

ENT.Base 			= "base_nextbot"

ENT.model = {}
ENT.skin = {0}
ENT.health = 10
ENT.speed = 100
ENT.run_speed = 250
ENT.radius = 200
ENT.vradius = 3     --vehicle "hitbox"
ENT.blood = BLOOD_COLOR_RED

ENT.idle_snd = {}
ENT.hurt_snd = {}
ENT.idle_anims = {}

if CLIENT then
    return
end

local validfood = {durgz_alcohol = true, durgz_cigarette = true, durgz_water = true}    --initialize food to eat
local badfood = {}      --killable food to eat

local tbl = list.Get("SpawnableEntities")
for k, v in pairs(tbl) do
    if table.HasValue(v, "Food") then
        validfood[k] = true
    elseif not validfood[k] and table.HasValue(v, "Drugs") then         -- initial ents in validfood are safe to eat
        validfood[k] = true
        badfood[k] = true
    end
end

local validveh = {gmod_sent_vehicle_fphysics_base = true, gmod_sent_vehicle_fphysics_wheel = true, sent_sakarias_carwheel = true}      --valid vehicle entities
local braindead = false

function ENT:Initialize()
    self:SetModel(self.model[math.random(#self.model)])
    self:SetSkin(self.skin[math.random(#self.skin)])
    self:SetHealth(self.health)
    self:SetBloodColor(self.blood)
    self.target = nil
    self.fear = false
end

function ENT:RunBehaviour()
    while true do

        if not self.fear and not braindead then

            if self.target != nil and self.target:IsValid() then      --eating food
                self:StartActivity(ACT_RUN)
                self.loco:SetDesiredSpeed(self.run_speed)
                self:MoveToPos(self.target:GetPos())
                self:StartActivity(ACT_IDLE)

                local tbl = ents.FindInSphere(self:GetPos(), 50)     --check in a close range
                local target = false

                for k, v in pairs(tbl) do       --check if the target still here
                    if v == self.target then
                        self:EmitSound("vermin/eating.mp3")
                        self.hit = self.hit + 1         --damage food

                        if self.hit >= 10 and self.target:IsValid() then        --destroy food
                            
                            self.target:Remove()

                            if badfood[self.target:GetClass()] then         --kill the npc if bad food
                                self:TakeDamage(self:Health(), self.target, self.target)
                            end
                        end

                        target = true
                        break
                    end
                end

                if target then      --wait before damaging food
                    coroutine.wait(math.Rand(1, 3))
                else
                    self.target = nil
                end

            else
                
                local tbl = ents.FindInSphere(self:GetPos(), self.radius)     --search some food

                table.Shuffle(tbl)      --shuffle to avoid bots to target the same food
                for k, v in pairs(tbl) do     --find a new target
                    if validfood[v:GetClass()] then
                        self.target = v
                        self.hit = 0
                        self:BehaveStart()
                    end
                end

                if #self.idle_snd != 0 and math.random(0, 10) == 0 then  --avoid npcs to play an idle sound everytime
                    self:EmitSound(self.idle_snd[math.random(#self.idle_snd)])
                end

                self:StartActivity(ACT_WALK)
                self.loco:SetDesiredSpeed(self.speed)
                self:MoveToPos(self:GetPos() + Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0) * self.radius)     --moving around if nothing found

                if #self.idle_anims != 0 and math.random(0, 5) == 0 then   --make npcs play extra idle anims
                    self:PlaySequenceAndWait(self.idle_anims[math.random(#self.idle_anims)])
                end

                self:StartActivity(ACT_IDLE)
                coroutine.wait(math.Rand(1, 5))
            end

        elseif not braindead then
            self:StartActivity(ACT_RUN)
            self.loco:SetDesiredSpeed(self.run_speed)
            self:MoveToPos(self:GetPos() + Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0) * (self.radius * 10))     --running away
            self:StartActivity(ACT_IDLE)
            coroutine.wait(math.Rand(1, 5))
            self.fear = false
        end

        coroutine.yield()  
    end
end

function ENT:OnInjured()
    self.target = nil
    self.fear = true
    self:BehaveStart()

    if #self.hurt_snd != 0 then
        self:EmitSound(self.hurt_snd[math.random(#self.hurt_snd)])
    end
end

function ENT:Think()

    if GetConVar("ai_disabled"):GetBool() then      --disable ai
        self.target = nil
        self.fear = false
        braindead = true
        self:StartActivity(ACT_IDLE)
        self:BehaveStart()
    else
        braindead = false
    end

    local tbl = ents.FindInSphere(self:GetPos(), self.vradius)         --vehicle damage begin

    for k, v in pairs(tbl) do
        if v:IsValid() and (validveh[v:GetClass()] or v:IsVehicle()) then
            local vel = v:GetVelocity()[1]

            if vel < -30 or vel > 30 then       --the vehicle should move
                local d = DamageInfo()
                d:SetDamage(math.abs(vel/5))
                d:SetAttacker(v)
                d:SetDamageType(DMG_CRUSH)
                self:TakeDamageInfo(d)
            end

        -- elseif v:IsValid() and v:IsScripted() and not v:IsNextBot() then     --debug stuff
        --     print(v:GetClass())
        end
    end         --vehicle damage end
end