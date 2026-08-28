local LocalPlayer = game:GetService("Players").LocalPlayer

local function getCharacter()
    if not LocalPlayer.Character then
        LocalPlayer.CharacterAdded:Wait()
    end
    LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    return LocalPlayer.Character
end

local function DistanceFromPlrSort(ObjectList)
    local RootPart = getCharacter().LowerTorso
    table.sort(ObjectList, function(ChestA, ChestB)
        local RootPos = RootPart.Position
        local DistanceA = (RootPos - ChestA.Position).Magnitude
        local DistanceB = (RootPos - ChestB.Position).Magnitude
        return DistanceA < DistanceB
    end)
end

local UncheckedChests, FirstRun = {}, true
local function getChestsSorted()
    if FirstRun then
        FirstRun = false
        for _, Object in pairs(game:GetDescendants()) do
            if Object.Name:find("Chest") and Object.ClassName == "Part" then
                table.insert(UncheckedChests, Object)
            end
        end
    end
    local Chests = {}
    for _, Chest in pairs(UncheckedChests) do
        if Chest:FindFirstChild("TouchInterest") then
            table.insert(Chests, Chest)
        end
    end
    DistanceFromPlrSort(Chests)
    return Chests
end

local Noclip = false
local NoclipConnection

local function toggleNoclip(Toggle)
    Noclip = Toggle
    local Character = getCharacter()
    
    for _, v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = not Toggle
        end
    end
    
    if Toggle then
        if NoclipConnection then
            NoclipConnection:Disconnect()
        end
        NoclipConnection = game:GetService("RunService").Stepped:Connect(function()
            if Noclip and Character then
                for _, v in pairs(Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    else
        if NoclipConnection then
            NoclipConnection:Disconnect()
            NoclipConnection = nil
        end
    end
end

local function FlyTo(Goal)
    local Character = getCharacter()
    local RootPart = Character.HumanoidRootPart
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    
    if not Humanoid then return end
    
    toggleNoclip(true)
    
    local GoalPosition = Goal.Position + Vector3.new(0, 3, 0)
    local Distance = (RootPart.Position - GoalPosition).Magnitude
    
    local BodyVelocity = Instance.new("BodyVelocity")
    BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BodyVelocity.Velocity = Vector3.new(0, 0, 0)
    BodyVelocity.Parent = RootPart
    
    local BodyGyro = Instance.new("BodyGyro")
    BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    BodyGyro.CFrame = RootPart.CFrame
    BodyGyro.Parent = RootPart
    
    while Distance > 5 and RootPart and RootPart.Parent do
        task.wait()
        Distance = (RootPart.Position - GoalPosition).Magnitude
        local Direction = (GoalPosition - RootPart.Position).Unit
        
        BodyVelocity.Velocity = Direction * 250
        BodyGyro.CFrame = CFrame.lookAt(RootPart.Position, GoalPosition)
        
        for _, v in pairs(Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
    
    if BodyVelocity then BodyVelocity:Destroy() end
    if BodyGyro then BodyGyro:Destroy() end
    
    toggleNoclip(false)
end

local function startFarm()
    task.spawn(function()
        while task.wait() do
            local Chests = getChestsSorted()
            if #Chests > 0 then
                FlyTo(Chests[1].CFrame)
            end
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0) 
    startFarm()
end)

startFarm()
