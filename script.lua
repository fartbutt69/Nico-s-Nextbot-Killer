--[[

	Nico's Nextbot Killer
	Created by Devamspion

]]

--[[if game.GameId ~= 10118559731 then
	warn("\nNico's Nextbot Killer : Created by Devamspion on V3rmillion.\n\nLoading Unsuccessful.\n\nPlease only use this script on the official nico's nextbots.")
	return
end]]

--// Toggles

local ESPEnabled = false
local FasterRespawnEnabled = false
local DoorSpamEnabled = false

--// Variables

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local UIS = game:GetService("UserInputService")
local boxes = {}

--// GUI

local ScreenGui = Instance.new("ScreenGui")
local Intro = Instance.new("ImageLabel")
local Killa = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local Name = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local ESP = Instance.new("TextLabel")
local FasterRe = Instance.new("TextLabel")
local DoorSpam = Instance.new("TextLabel")
local Startup = Instance.new("Sound",ScreenGui)
local scream = Instance.new("Sound",ScreenGui)

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.ResetOnSpawn = false

Startup.SoundId = "rbxassetid://5857614116"
Startup.Name = "Startup"

scream.SoundId = "rbxassetid://252192336"
scream.Name = "Scream"

Intro.Name = "Intro"
Intro.Parent = ScreenGui
Intro.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Intro.BackgroundTransparency = 1.000
Intro.Position = UDim2.new(0.40239343, 0, 0.338689744, 0)
Intro.Size = UDim2.new(0.195213169, 0, 0.322620511, 0)
Intro.Visible = false
Intro.Image = "http://www.roblox.com/asset/?id=10529044500"

Killa.Name = "Killa"
Killa.Parent = Intro
Killa.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Killa.BackgroundTransparency = 1.000
Killa.BorderSizePixel = 0
Killa.Position = UDim2.new(-0.153256699, 0, 1.21072805, 0)
Killa.Size = UDim2.new(1.30651343, 0, 0.42145595, 0)
Killa.Visible = false
Killa.Font = Enum.Font.Creepster
Killa.Text = "KILLER"
Killa.TextColor3 = Color3.fromRGB(255, 0, 4)
Killa.TextScaled = true
Killa.TextSize = 14.000
Killa.TextWrapped = true

UICorner.CornerRadius = UDim.new(0.0799999982, 0)
UICorner.Parent = Intro

Name.Name = "Name"
Name.Parent = Intro
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.BorderSizePixel = 0
Name.Position = UDim2.new(-0.153256699, 0, 1, 0)
Name.Size = UDim2.new(1.30651343, 0, 0.275862068, 0)
Name.Font = Enum.Font.SourceSansBold
Name.Text = "Nico's Nextbot"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

UIAspectRatioConstraint.Parent = Intro
UIAspectRatioConstraint.AspectRatio = 1.209

ESP.Name = "ESP"
ESP.Parent = ScreenGui
ESP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ESP.BackgroundTransparency = 1.000
ESP.Position = UDim2.new(0, 0, 0.871446252, 0)
ESP.Size = UDim2.new(0.994764388, 0, 0.0395550057, 0)
ESP.Visible = false
ESP.Font = Enum.Font.SourceSansItalic
ESP.Text = "Nextbot ESP: Disabled"
ESP.TextColor3 = Color3.fromRGB(255, 255, 255)
ESP.TextScaled = true
ESP.TextSize = 14.000
ESP.TextWrapped = true
ESP.TextXAlignment = Enum.TextXAlignment.Right

FasterRe.Name = "FasterRe"
FasterRe.Parent = ScreenGui
FasterRe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FasterRe.BackgroundTransparency = 1.000
FasterRe.Position = UDim2.new(0, 0, 0.911001265, 0)
FasterRe.Size = UDim2.new(0.994764388, 0, 0.0395550057, 0)
FasterRe.Visible = false
FasterRe.Font = Enum.Font.SourceSansItalic
FasterRe.Text = "Faster Respawn: Disabled"
FasterRe.TextColor3 = Color3.fromRGB(255, 255, 255)
FasterRe.TextScaled = true
FasterRe.TextSize = 14.000
FasterRe.TextWrapped = true
FasterRe.TextXAlignment = Enum.TextXAlignment.Right

DoorSpam.Name = "DoorSpam"
DoorSpam.Parent = ScreenGui
DoorSpam.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DoorSpam.BackgroundTransparency = 1.000
DoorSpam.Position = UDim2.new(0, 0, 0.950556278, 0)
DoorSpam.Size = UDim2.new(0.994764388, 0, 0.0395550057, 0)
DoorSpam.Visible = false
DoorSpam.Font = Enum.Font.SourceSansItalic
DoorSpam.Text = "Door Spam: Disabled"
DoorSpam.TextColor3 = Color3.fromRGB(255, 255, 255)
DoorSpam.TextScaled = true
DoorSpam.TextSize = 14.000
DoorSpam.TextWrapped = true
DoorSpam.TextXAlignment = Enum.TextXAlignment.Right

--// Intro

wait(1)
Intro.Visible = true
Startup:Play()
wait(2)
scream:Play()
Killa.Visible = true
wait(2)
Intro.Visible = false

DoorSpam.Visible = true
FasterRe.Visible = true
ESP.Visible = true

--// Functions

function Toggler(whattotoggle)
	if whattotoggle == "ESP" then
		if ESPEnabled == false then
			for i,v in pairs(game.Workspace.bots:GetChildren()) do
				if boxes[v]:IsA("BillboardGui") then
					boxes[v].Enabled = true
				end
			end
			ESP.Text = "Nextbot ESP: Enabled"
			ESPEnabled = true
		else
			for i,v in pairs(game.Workspace.bots:GetChildren()) do
				if boxes[v]:IsA("BillboardGui") then
					boxes[v].Enabled = false
				end
			end
			ESP.Text = "Nextbot ESP: Disabled"
			ESPEnabled = false
		end
	elseif whattotoggle == "FasterRespawn" then
		if FasterRespawnEnabled == false then
			FasterRe.Text = "Faster Respawn: Disabled"
			FasterRespawnEnabled = true
		else
			FasterRe.Text = "Faster Respawn: Enabled"
			FasterRespawnEnabled = false
		end
	elseif whattotoggle == "DoorSpam" then
		if DoorSpamEnabled == false then
			DoorSpam.Text = "Door Spam: Enabled"
			DoorSpamEnabled = true
		else
			DoorSpam.Text = "Door Spam: Disabled"
			DoorSpamEnabled = false
		end
	end
end

function NextbotESP(nextbot)
	--if not nextbot:IsA("Model") then return end
	warn("\nNico's Nextbot Killer : Adding Nextbot "..nextbot.Name.." to ESP System..")
	local box = Instance.new("BillboardGui", nextbot)
	local frame = Instance.new("Frame",box)
	local frameedge = Instance.new("UICorner",frame)
	local image = Instance.new("ImageLabel",frame)
	local imageedge = Instance.new("UICorner",image)
	
	frame.Size = UDim2.new(3,0,3,0)
	box.AlwaysOnTop = true
	box.Adornee = nextbot
	box.Size = UDim2.new(3,0,3,0)
	box.Enabled = false

	frame.Size = UDim2.new(3,0,3,0)
	frame.BorderSizePixel = 0
	
	frameedge.CornerRadius = UDim.new(1,0)
	
	image.BackgroundTransparency = 1
	image.Size = UDim2.new(0.9, 0,0.9, 0)
	image.Position = UDim2.new(0.05, 0,0.045, 0)
	
	imageedge.CornerRadius = UDim.new(1,0)

	game:GetService("RunService").RenderStepped:Connect(function()
		local s,e=pcall(function()
			image.Image = nextbot.HumanoidRootPart.icon.ImageLabel.Image
			if nextbot:FindFirstChild("chase").closetohuman.Value then
				frame.BackgroundColor3 = Color3.fromRGB(0,255,0)
			else
				frame.BackgroundColor3 = Color3.fromRGB(255,0,0)
			end
		end)
	end)
	
	boxes[nextbot] = box
	warn("\nNico's Nextbot Killer : "..nextbot.Name.." Added successfully!")
end

for i,v in pairs(game.Workspace.bots:GetChildren()) do
	NextbotESP(v)
end

game.Workspace.bots.ChildAdded:Connect(function(child)
	NextbotESP(child)
end)

game.Workspace.bots.ChildRemoved:Connect(function(child)
	boxes[child] = nil
end)

character:WaitForChild("Humanoid").Died:Connect(function()
	if FasterRespawnEnabled then
		game.ReplicatedStorage.events.respawnchar:FireServer()
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if DoorSpamEnabled then
		for i,v in pairs(game.Workspace.doors:GetChildren()) do
			if v.Name == "interactable_door" then
				game.ReplicatedStorage.events.door:FireServer(v)
			end
		end
	end
end)

UIS.InputBegan:Connect(function(k)
	if k.KeyCode == Enum.KeyCode.H then
		Toggler("ESP")
	elseif k.KeyCode == Enum.KeyCode.J then
		Toggler("FasterRespawn")
	elseif k.KeyCode == Enum.KeyCode.K then
		Toggler("DoorSpam")
	end
end)

warn("\nNico's Nextbot Killer : Created by Devamspion on V3rmillion.\n\nLoading Successful.\n\nPress H to activate Nextbot ESP.\nPress J to activate Faster Respawn.\nPress K to activate Door Spam.")
