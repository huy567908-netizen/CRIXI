local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VIM = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local AutoFarmEnabled = false
local AutoSkillEnabled = false
local AntiKnockback = false
local FPSDisplayEnabled = false
local SpectateEnabled = false
local WhitelistEnabled = false 
local TargetToWatch = nil
local WhitelistedPlayer = nil 
local Target = nil

local camRotationX = 0
local camRotationY = 0
local camZoom = 15
local lastMousePos = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)

local fpsGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
fpsGui.Name = "FPS_Display"
fpsGui.ResetOnSpawn = false
local fpsLabel = Instance.new("TextLabel", fpsGui)
fpsLabel.Size = UDim2.new(0, 200, 0, 30)
fpsLabel.Position = UDim2.new(0, 10, 0, 10)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
fpsLabel.Font = Enum.Font.GothamBold
fpsLabel.TextSize = 18
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.Visible = false

local Window = WindUI:CreateWindow({
    Title = "CRIXI STRONGESTBATTLESGROUND",
    Author = "Zae",
    Folder = "tsb_v10_update",
    Icon = "shaved-head",
    Theme = "Dark",
    Size = UDim2.fromOffset(600, 480),
    ToggleKey = Enum.KeyCode.J, 
})

local function getPlayersList()
    local list = {"None"}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then table.insert(list, p.Name) end
    end
    return list
end

local CombatTab = Window:Tab({ Title = "Combat", Icon = "swords" })

CombatTab:Toggle({ 
    Title = "Auto Farm KILL", 
    Value = false, 
    Callback = function(state) 
        AutoFarmEnabled = state 
        if not state then Target = nil end 
    end 
})

CombatTab:Toggle({
    Title = "Active Whitelist",
    Value = false,
    Callback = function(state)
        WhitelistEnabled = state
        Target = nil 
    end,
})

local WhitelistDropdown = CombatTab:Dropdown({
    Title = "Chọn người loại trừ",
    Multi = false,
    Options = getPlayersList(),
    Callback = function(selected)
        WhitelistedPlayer = (selected == "None") and nil or selected
    end,
})

CombatTab:Toggle({ Title = "AUTO SKILL & ATTACK", Value = false, Callback = function(state) AutoSkillEnabled = state end })
CombatTab:Toggle({ Title = "Anti-Knockback", Value = false, Callback = function(state) AntiKnockback = state end })

local TrollTab = Window:Tab({ Title = "Troll Player", Icon = "ghost" })
TrollTab:Button({
    Title = "Teleport to Void (Rơi từ từ)",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position.X, -450, LocalPlayer.Character.HumanoidRootPart.Position.Z)
        end
    end,
})

local SpectateTab = Window:Tab({ Title = "Spectate", Icon = "eye" })
local PlayerDropdown = SpectateTab:Dropdown({
    Title = "Chọn người xem",
    Multi = false,
    Options = getPlayersList(),
    Callback = function(selected)
        if selected == "None" then
            TargetToWatch = nil
        else
            TargetToWatch = Players:FindFirstChild(selected)
        end
    end,
})

SpectateTab:Toggle({
    Title = "Spectate",
    Value = false,
    Callback = function(state)
        SpectateEnabled = state
        if not state then
            Camera.CameraType = Enum.CameraType.Custom
            UserInputService.MouseIconEnabled = true
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
            end
        else
            Camera.CameraType = Enum.CameraType.Scriptable
            camRotationX = 0
            camRotationY = 0
            UserInputService.MouseIconEnabled = false 
        end
    end,
})

local function UpdateRotation()
    if not SpectateEnabled then return end
    local currentMousePos = UserInputService:GetMouseLocation()
    local diff = currentMousePos - lastMousePos
    camRotationX = camRotationX - (diff.X * 0.5)
    camRotationY = math.clamp(camRotationY - (diff.Y * 0.5), -80, 80)
    lastMousePos = currentMousePos
end

local function UpdateAllDropdowns()
    local newList = getPlayersList()
    PlayerDropdown:Refresh(newList, true)
    WhitelistDropdown:Refresh(newList, true)
end

task.spawn(function()
    while true do
        UpdateAllDropdowns()
        task.wait(5.0)
    end
end)

local TeleTab = Window:Tab({ Title = "Teleport", Icon = "map-pin" })
TeleTab:Button({
    Title = "Teleport Tool (Zae)",
    Callback = function()
        local mouse = LocalPlayer:GetMouse()
        local tool = Instance.new("Tool")
        tool.Name = "ZAE TELEPORT"
        tool.RequiresHandle = false
        tool.Parent = LocalPlayer.Backpack
        tool.Activated:Connect(function()
            local pos = mouse.Hit.p
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
            end
        end)
    end,
})

TeleTab:Button({ Title = "player up (1000m)", Callback = function() if LocalPlayer.Character then LocalPlayer.Character.HumanoidRootPart.CFrame *= CFrame.new(0, 1000, 0) end end })
TeleTab:Button({ Title = "jump down", Callback = function() if LocalPlayer.Character then local ray = Ray.new(LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(0, -20000, 0)) local _, pos = workspace:FindPartOnRay(ray, LocalPlayer.Character) LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0)) end end })

local PotatoTab = Window:Tab({ Title = "Fix lag", Icon = "trash" })
PotatoTab:Button({
    Title = "SUPPER POTATO GRAPHICS",
    Callback = function()
        game.Lighting.FogEnd = 999999
        game.Lighting.GlobalShadows = false
        local greyColor = Color3.fromRGB(150, 150, 150)
        local function fixLag(v)
            if v:IsDescendantOf(game.Players) or (v.Parent and v.Parent:FindFirstChild("Humanoid")) then
                if v:IsA("BasePart") then v.Color = greyColor v.Material = Enum.Material.SmoothPlastic v.Reflectance = 0
                elseif v:IsA("Clothing") or v:IsA("Accessory") or v:IsA("ShirtGraphic") then v:Destroy() end
            end
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled = false
            elseif v:IsA("Texture") or v:IsA("Decal") then
                if string.find(v.Texture:lower(), "leaf") or string.find(v.Texture:lower(), "leaves") or string.find(v.Texture:lower(), "grass") then v:Destroy() end
            elseif string.find(v.Name:lower(), "leaf") or string.find(v.Name:lower(), "leaves") or string.find(v.Name:lower(), "bush") or v.Name == "Rocks" or v.Name == "Debris" or v.Name == "Cracks" then v:Destroy()
            elseif v:IsA("BasePart") then 
                if v.Material == Enum.Material.Grass then v.Transparency = 1 v.CanCollide = false end
                v.Material = Enum.Material.SmoothPlastic v.CastShadow = false 
            end
        end
        for _, v in pairs(game.Workspace:GetDescendants()) do fixLag(v) end
        game.Workspace.DescendantAdded:Connect(fixLag)
        WindUI:Notify({Title = "Fix lag", Content = "Đã dọn sạch lá cây và tối ưu đồ họa!"})
    end,
})
PotatoTab:Toggle({ Title = "Show FPS", Value = false, Callback = function(state) FPSDisplayEnabled = state fpsLabel.Visible = state end })

local MiscTab = Window:Tab({ Title = "Misc", Icon = "package" })
MiscTab:Button({ 
    Title = "Kích hoạt Dash No Cooldown", 
    Callback = function() 
        workspace:SetAttribute('EffectAffects', 1) 
        workspace:SetAttribute('NoDashCooldown', 0) 
    end 
})
MiscTab:Button({
    Title = "Rejoin Server",
    Callback = function()
        WindUI:Notify({Title = "Teleport", Content = "Đang kết nối lại server cũ..."})
        task.wait(0.5)
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end,
})

RunService:BindToRenderStep("ZaeSpectateFinal", Enum.RenderPriority.Camera.Value + 1, function(dt)
    if FPSDisplayEnabled then fpsLabel.Text = "FPS : [" .. math.floor(1 / dt) .. "]" end
    
    if SpectateEnabled and TargetToWatch and TargetToWatch.Character and TargetToWatch.Character:FindFirstChild("HumanoidRootPart") then
        Camera.CameraType = Enum.CameraType.Scriptable
        UpdateRotation()
        local rootPart = TargetToWatch.Character.HumanoidRootPart
        local targetPos = rootPart.Position + Vector3.new(0, 2.5, 0)
        local rotationCF = CFrame.Angles(0, math.rad(camRotationX), 0) * CFrame.Angles(math.rad(camRotationY), 0, 0)
        local cameraPosition = targetPos + (rotationCF.LookVector * -camZoom)
        Camera.CFrame = CFrame.new(cameraPosition, targetPos)
    elseif not SpectateEnabled and Camera.CameraType == Enum.CameraType.Scriptable then
        Camera.CameraType = Enum.CameraType.Custom
    end

    if AntiKnockback and LocalPlayer.Character then LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0) end
    
    if AutoFarmEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local isWhitelisted = WhitelistEnabled and Target and Target.Name == WhitelistedPlayer
        if not Target or not Target.Parent or not Target.Character or not Target.Character:FindFirstChild("Humanoid") or Target.Character.Humanoid.Health <= 0 or isWhitelisted then
            local closest, dist = nil, math.huge
            for _, v in pairs(Players:GetPlayers()) do
                local skipThisPlayer = WhitelistEnabled and v.Name == WhitelistedPlayer
                if v ~= LocalPlayer and not skipThisPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 then
                    local d = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                    if d < dist then closest, dist = v, d end
                end
            end
            Target = closest
        end

        if Target and Target.Character and Target.Character:FindFirstChild("Head") then
            currentSpin = (currentSpin + 100) % 36000 
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Target.Character.Head.Position + Vector3.new(0, 6, 0)) 
                * CFrame.Angles(0, math.rad(currentSpin), 0) 
                * CFrame.new(0, 0, 1.2)
                * CFrame.Angles(math.rad(-90), 0, 0) 
        end
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if SpectateEnabled and input.UserInputType == Enum.UserInputType.MouseWheel then
        camZoom = math.clamp(camZoom - input.Position.Z * 3, 5, 100)
    end
end)

task.spawn(function()
    while true do
        if AutoSkillEnabled then
            local char = LocalPlayer.Character
            local event = char and char:FindFirstChild("Communicate")
            if event then
                local dashArgs = {[1] = {["Dash"] = Enum.KeyCode.W, ["Key"] = Enum.KeyCode.Q, ["Goal"] = "KeyPress"}}
                event:FireServer(unpack(dashArgs))
                if Target then
                    for _, key in pairs({Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three, Enum.KeyCode.Four, Enum.KeyCode.G}) do
                        VIM:SendKeyEvent(true, key, false, game)
                        task.wait(0.01)
                        VIM:SendKeyEvent(false, key, false, game)
                    end
                    event:FireServer({["Goal"] = "LeftClick", ["Mobile"] = true})
                end
            end
        end
        task.wait(0.1) 
    end
end)

WindUI:Notify({ Title = "CRIXI V10", Content = "KEY J FOR OPEN", Duration = 5 })
