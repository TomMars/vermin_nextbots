AddCSLuaFile()

ENT.Base 			= "base_nextbot"

ENT.model = nil
ENT.skin = {}
ENT.health = 0
ENT.speed = 0
ENT.radius = 0

local validfood = {}

if SERVER then      --initialize food to eat
    local tbl = list.Get("SpawnableEntities")
    for k, v in pairs(tbl) do
        if table.HasValue(v, "Food") then
            validfood[k] = true
        end
    end
end

function ENT:Initialize()
    if SERVER then
        self:SetModel(self.model)
        self:SetSkin(self.skin[math.random(#self.skin)])
        self:SetHealth(self.health)
        self.target = nil
        self.fear = false
    end
end

function ENT:RunBehaviour()
    while true do

        if not self.fear and not GetConVar("ai_disabled"):GetBool() then

            self.loco:SetDesiredSpeed(self.speed)

            if self.target != nil and self.target:IsValid() then      --eating food
                self:MoveToPos(self.target:GetPos())

                local tbl = ents.FindInSphere(self:GetPos(), 50)     --check in a close range
                local target = false

                for k, v in pairs(tbl) do       --check if the target still here
                    if v == self.target then
                        self.hit = self.hit + 1         --damage food

                        if self.hit >= 10 and self.target:IsValid() then        --destroy food
                            self.target:Remove()
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

                table.Shuffle(tbl)      --shuffle to avoid rats to target the same food
                for k, v in pairs(tbl) do     --find a new target
                    if validfood[v:GetClass()] then
                        self.target = v
                        self.hit = 0
                        self:BehaveStart()
                    end
                end

                self:MoveToPos(self:GetPos() + Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0) * self.radius)     --moving around if nothing found
                coroutine.wait(math.Rand(1, 5))
            end

        elseif not GetConVar("ai_disabled"):GetBool() then
            self.loco:SetDesiredSpeed(self.speed + 50)
            self:MoveToPos(self:GetPos() + Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0) * (self.radius * 10))     --running away
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
end