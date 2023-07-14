local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Importing the textures
local objs = game:GetObjects("rbxassetid://13903337050")
local import = objs[1]
import.Parent = ReplicatedStorage

-- Very epic index for swords
local swordIndex = {
    {
        name = "wood_sword",
        offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
        model = import:WaitForChild("Wood_Sword"),
    },
    {
        name = "stone_sword",
        offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
        model = import:WaitForChild("Stone_Sword"),
    },
    {
        name = "iron_sword",
        offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
        model = import:WaitForChild("Iron_Sword"),
    },
    {
        name = "diamond_sword",
        offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
        model = import:WaitForChild("Diamond_Sword"),
    },
    {
        name = "emerald_sword",
        offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
        model = import:WaitForChild("Emerald_Sword"),
    },
}

-- Very epic index for pickaxes
local pickaxeIndex = {
    {
        name = "wood_pickaxe",
        offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
        model = import:WaitForChild("Wood_Pickaxe"),
    },
    {
        name = "stone_pickaxe",
        offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
        model = import:WaitForChild("Stone_Pickaxe"),
    },
    {
        name = "iron_pickaxe",
        offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
        model = import:WaitForChild("Iron_Pickaxe"),
    },
    {
        name = "diamond_pickaxe",
        offset = CFrame.Angles(math.rad(0), math.rad(80), math.rad(-95)),
        model = import:WaitForChild("Diamond_Pickaxe"),
    },
}

-- Main viewmodel renderer for swords
local swordFunc = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)
    if not tool:IsA("Accessory") then
        return
    end
    
    for _, v in pairs(swordIndex) do
        if v.name == tool.Name then
            for _, v in pairs(tool:GetDescendants()) do
                if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                    v.Transparency = 1
                end
            end
            
            local model = v.model:Clone()
            model.CFrame = tool.Handle.CFrame * v.offset
            model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
            model.Parent = tool
            
            local weld = Instance.new("WeldConstraint", model)
            weld.Part0 = model
            weld.Part1 = tool.Handle
            
            local tool2 = Players.LocalPlayer.Character[tool.Name]
            
            for _, v in pairs(tool2:GetDescendants()) do
                if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                    v.Transparency = 1
                end
            end
            
            local model2 = v.model:Clone()
            model2.Anchored = false
            model2.CFrame = tool2.Handle.CFrame * v.offset
            model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
            model2.CFrame *= CFrame.new(0.4, 0, -0.9)
            model2.Parent = tool2
            
            local weld2 = Instance.new("WeldConstraint", model)
            weld2.Part0 = model2
            weld2.Part1 = tool2.Handle
        end
    end
end)

-- Main viewmodel renderer for pickaxes
local pickaxeFunc = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)
    if not tool:IsA("Accessory") then
        return
    end
    
    for _, v in pairs(pickaxeIndex) do
        if v.name == tool.Name then
            for _, v in pairs(tool:GetDescendants()) do
                if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                    v.Transparency = 1
                end
            end
            
            local model = v.model:Clone()
            model.CFrame = tool.Handle.CFrame * v.offset
            model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
            model.Parent = tool
            
            local weld = Instance.new("WeldConstraint", model)
            weld.Part0 = model
            weld.Part1 = tool.Handle
            
            local tool2 = Players.LocalPlayer.Character[tool.Name]
            
            for _, v in pairs(tool2:GetDescendants()) do
                if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                    v.Transparency = 1
                end
            end
            
            local model2 = v.model:Clone()
            model2.Anchored = false
            model2.CFrame = tool2.Handle.CFrame * v.offset
            model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
            model2.CFrame *= CFrame.new(-0.2, 0, -0.08)
            model2.Parent = tool2
            
            local weld2 = Instance.new("WeldConstraint", model)
            weld2.Part0 = model2
            weld2.Part1 = tool2.Handle
        end
    end
end)
