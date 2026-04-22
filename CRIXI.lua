--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))();
local v1 = game:GetService("Players");
local v2 = game:GetService("RunService");
local v3 = game:GetService("VirtualInputManager");
local v4 = game:GetService("UserInputService");
local v5 = v1.LocalPlayer;
local v6 = false;
local v7 = false;
local v8 = false;
local v9 = nil;
local v10 = false;
local v11 = Instance.new("ScreenGui", v5:WaitForChild("PlayerGui"));
v11.Name = "FPS_Display";
v11.ResetOnSpawn = false;
local v14 = Instance.new("TextLabel", v11);
v14.Size = UDim2.new(0 - 0, 214 - (9 + 5), 0 + 0, 1984 - (508 + 1446));
v14.Position = UDim2.new(0 - 0, 8 + 2, 997 - (915 + 82), 28 - 18);
v14.BackgroundTransparency = 1 + 0;
v14.TextColor3 = Color3.fromRGB(0 - 0, 1442 - (1069 + 118), 0 - 0);
v14.Font = Enum.Font.GothamBold;
v14.TextSize = 39 - 21;
v14.TextXAlignment = Enum.TextXAlignment.Left;
v14.Visible = false;
local v25 = v0:CreateWindow({Title="CRIXI STRONGESTBATTLESGROUND",Author="Zae",Folder="tsb_v10_potato",Icon="shaved-head",Theme="Dark",Size=UDim2.fromOffset(105 + 495, 135 + 345),ToggleKey=Enum.KeyCode.J});
local v26 = v25:Tab({Title="Combat & Troll",Icon="swords"});
v26:Toggle({Title="Auto Farm KILL",Value=false,Callback=function(v30)
	local v31 = 0 - 0;
	while true do
		if ((v31 == 0) or (4593 <= 2672)) then
			v6 = v30;
			if not v30 then
				v9 = nil;
			end
			break;
		end
	end
end});
v26:Toggle({Title="AUTO SKILL",Value=false,Callback=function(v32)
	v7 = v32;
end});
v26:Toggle({Title="Anti-Knockback",Value=false,Callback=function(v33)
	v8 = v33;
end});
v26:Toggle({Title="Show FPS Display",Value=false,Callback=function(v34)
	v10 = v34;
	v14.Visible = v34;
end});
v26:Button({Title="Kích hoạt Dash No Cooldown",Callback=function()
	local v36 = 0 - 0;
	while true do
		if ((v36 == (1 + 0)) or (1168 > 3156)) then
			v0:Notify({Title="Combat",Content="Đã xóa hồi chiêu lướt!"});
			break;
		end
		if ((v36 == (0 - 0)) or (572 > 4486)) then
			workspace:SetAttribute("EffectAffects", 1 + 0);
			workspace:SetAttribute("NoDashCooldown", 791 - (368 + 423));
			v36 = 1;
		end
	end
end});
local v27 = v25:Tab({Title="Teleport",Icon="map-pin"});
v27:Button({Title="player up (1000m)",Callback=function()
	if (v5.Character and v5.Character:FindFirstChild("HumanoidRootPart")) then
		v5.Character.HumanoidRootPart.CFrame *= CFrame.new(971 - (140 + 831), 3142 - 2142, 0)
	end
end});
v27:Button({Title="jump down",Callback=function()
	if ((1404 == 1404) and v5.Character and v5.Character:FindFirstChild("HumanoidRootPart")) then
		local v47 = 18 - (10 + 8);
		local v48;
		local v49;
		while true do
			if (v47 == (0 - 0)) then
				v48 = RaycastParams.new();
				v48.FilterDescendantsInstances = {v5.Character};
				v47 = 3 - 2;
			end
			if ((v47 == (689 - (198 + 490))) or (3748 < 2212)) then
				v48.FilterType = Enum.RaycastFilterType.Blacklist;
				v49 = workspace:Raycast(v5.Character.HumanoidRootPart.Position, Vector3.new(0 + 0, -(35388 - 15388), 438 - (145 + 293)), v48);
				v47 = 2;
			end
			if ((v47 == 2) or (1180 == 2180)) then
				if v49 then
					v5.Character.HumanoidRootPart.CFrame = CFrame.new(v49.Position + Vector3.new(1206 - (696 + 510), 433 - (44 + 386), 1486 - (998 + 488)));
				end
				break;
			end
		end
	end
end});
v27:Button({Title="Teleport Tool (Zae)",Callback=function()
	local v37 = 0 - 0;
	local v38;
	local v39;
	while true do
		if ((4090 < 4653) and (v37 == (0 + 0))) then
			v38 = v5:GetMouse();
			v39 = Instance.new("Tool");
			v37 = 1 + 0;
		end
		if ((v37 == (3 - 2)) or (2652 < 196)) then
			v39.Name = "ZAE TELEPORT";
			v39.RequiresHandle = false;
			v37 = 6 - 4;
		end
		if (v37 == (2 + 0)) then
			v39.Parent = v5.Backpack;
			v39.Activated:Connect(function()
				if (v5.Character and v5.Character:FindFirstChild("HumanoidRootPart")) then
					v5.Character.HumanoidRootPart.CFrame = CFrame.new(v38.Hit.p + Vector3.new(0, 14 - 11, 772 - (201 + 571)));
				end
			end);
			break;
		end
	end
end});
local v28 = v25:Tab({Title="Potato Mode",Icon="trash"});
v28:Button({Title="SUPPER POTATO GRAPHICS",Callback=function()
	local v40 = 0;
	local v41;
	local v42;
	local v43;
	while true do
		if ((4135 < 4817) and (v40 == (1141 - (116 + 1022)))) then
			for v59, v60 in pairs(workspace:GetDescendants()) do
				v43(v60);
			end
			v0:Notify({Title="Potato",Content="Graphics Reduced!"});
			break;
		end
		if ((272 == 272) and (v40 == (8 - 6))) then
			v43 = nil;
			function v43(v61)
				pcall(function()
					if ((100 <= 3123) and (v61:IsA("BasePart") or v61:IsA("MeshPart"))) then
						local v68 = 0 + 0;
						while true do
							if (v68 == (1 + 0)) then
								v61.CastShadow = false;
								if (v61:IsA("MeshPart") or (1369 > 4987)) then
									v61.TextureID = "";
								end
								break;
							end
							if (v68 == (0 - 0)) then
								v61.Material = Enum.Material.SmoothPlastic;
								v61.Color = v41;
								v68 = 1;
							end
						end
					elseif (v61:IsA("Decal") or v61:IsA("Texture") or v61:IsA("ParticleEmitter") or v61:IsA("Trail") or (863 >= 4584)) then
						v61:Destroy();
					end
				end);
			end
			v40 = 3;
		end
		if (v40 == (0 + 0)) then
			v41 = Color3.fromRGB(986 - (660 + 176), 532 - 382, 150);
			v42 = game:GetService("Lighting");
			v40 = 860 - (814 + 45);
		end
		if (v40 == (2 - 1)) then
			v42.GlobalShadows = false;
			v42.Ambient = v41;
			v40 = 1 + 1;
		end
	end
end});
v2.RenderStepped:Connect(function(v44)
	if (v10 or (724 >= 1668)) then
		v14.Text = "FPS : [" .. math.floor((1 + 0) / v44) .. "]";
	end
end);
local v29 = 0;
v2.Heartbeat:Connect(function()
	if (v8 and v5.Character and v5.Character:FindFirstChild("HumanoidRootPart")) then
		v5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0 + 0, 0 - 0);
	end
	if (v6 and v5.Character and v5.Character:FindFirstChild("HumanoidRootPart")) then
		local v52 = 0;
		while true do
			if ((428 < 1804) and (v52 == (0 - 0))) then
				if (not v9 or not v9.Parent or not v9.Character or not v9.Character:FindFirstChild("Humanoid") or (v9.Character.Humanoid.Health <= 0)) then
					local v69, v70 = nil, math.huge;
					for v73, v74 in pairs(v1:GetPlayers()) do
						if (((v74 ~= v5) and v74.Character and v74.Character:FindFirstChild("HumanoidRootPart") and (v74.Character.Humanoid.Health > (0 - 0))) or (3325 > 4613)) then
							local v79 = 885 - (261 + 624);
							local v80;
							while true do
								if (v79 == 0) then
									v80 = (v5.Character.HumanoidRootPart.Position - v74.Character.HumanoidRootPart.Position).magnitude;
									if ((v80 < v70) or (4950 <= 4553)) then
										v69, v70 = v74, v80;
									end
									break;
								end
							end
						end
					end
					v9 = v69;
				end
				if ((2665 <= 3933) and v9 and v9.Character and v9.Character:FindFirstChild("Head")) then
					v29 = (v29 + 64 + 36) % (63975 - 27975);
					local v71 = v9.Character.Head.Position;
					v5.Character.HumanoidRootPart.CFrame = CFrame.new(v71 + Vector3.new(1080 - (1020 + 60), 7, 0 + 0)) * CFrame.Angles(0 - 0, math.rad(v29), 0) * CFrame.new(1423 - (630 + 793), 0 - 0, 1.5 - 0) * CFrame.Angles(math.rad(-90), 0 - 0, 0 + 0);
				end
				break;
			end
		end
	end
end);
task.spawn(function()
	local v45 = 0 - 0;
	local v46;
	while true do
		if (v45 == (1747 - (760 + 987))) then
			v46 = {Enum.KeyCode.One,Enum.KeyCode.Two,Enum.KeyCode.Three,Enum.KeyCode.Four,Enum.KeyCode.G};
			while task.wait(0.1 - 0) do
				if (v7 and v9 and v9.Character) then
					local v66 = 0 - 0;
					while true do
						if (v66 == (1 + 0)) then
							task.wait(0.01 + 0);
							v3:SendMouseButtonEvent(1055 - (87 + 968), 0 - 0, 0 + 0, false, game, 1);
							break;
						end
						if ((3273 == 3273) and ((0 - 0) == v66)) then
							for v81, v82 in pairs(v46) do
								local v83 = 1413 - (447 + 966);
								while true do
									if (v83 == (0 - 0)) then
										v3:SendKeyEvent(true, v82, false, game);
										task.wait(0.01);
										v83 = 1818 - (1703 + 114);
									end
									if ((3824 > 409) and (v83 == (242 - (187 + 54)))) then
										v3:SendKeyEvent(false, v82, false, game);
										break;
									end
								end
							end
							v3:SendMouseButtonEvent(701 - (376 + 325), 0 - 0, 0, true, game, 2 - 1);
							v66 = 1 + 0;
						end
					end
				end
			end
			break;
		end
	end
end);
