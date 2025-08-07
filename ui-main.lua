--[[
  Everything Script - Fancy Loading GUI
  Features:
  - Rotating logo
  - 3-minute loading bar with smooth animation
  - Glow effects on text and UI
  - Input block (safe ShiftLock-style)
  - Fake error after loading
--]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

pcall(function()
	if game.CoreGui:FindFirstChild("EverythingScriptGui") then
		game.CoreGui.EverythingScriptGui:Destroy()
	end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "EverythingScriptGui"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game:GetService("CoreGui")

-- Input blocker
local blocker = Instance.new("TextButton")
blocker.Size = UDim2.new(1, 0, 1, 0)
blocker.Position = UDim2.new(0, 0, 0, 0)
blocker.BackgroundTransparency = 1
blocker.Text = ""
blocker.AutoButtonColor = false
blocker.ZIndex = 999
blocker.Parent = gui

-- Background
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
bg.BorderSizePixel = 0
bg.ZIndex = 1

-- Logo
local logo = Instance.new("ImageLabel", bg)
logo.Size = UDim2.new(0, 100, 0, 100)
logo.Position = UDim2.new(0.5, -50, 0.25, -50)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://13577884121"
logo.ZIndex = 2

-- Glow animation (rotation)
task.spawn(function()
	while gui and logo do
		logo.Rotation += 1
		task.wait(0.01)
	end
end)

-- Title
local title = Instance.new("TextLabel", bg)
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0.4, 0)
title.Text = "Everything Script"
title.TextColor3 = Color3.fromRGB(0, 170, 255)
title.TextStrokeTransparency = 0.5
title.TextStrokeColor3 = Color3.fromRGB(0, 255, 255)
title.TextSize = 36
title.Font = Enum.Font.GothamBlack
title.BackgroundTransparency = 1
title.ZIndex = 2

-- Credit
local credit = Instance.new("TextLabel", bg)
credit.Size = UDim2.new(1, 0, 0, 30)
credit.Position = UDim2.new(0, 0, 0.46, 5)
credit.Text = "By @thebestexploiterr on tiktok"
credit.TextColor3 = Color3.fromRGB(0, 140, 255)
credit.TextStrokeTransparency = 0.5
credit.TextStrokeColor3 = Color3.fromRGB(0, 255, 255)
credit.TextSize = 20
credit.Font = Enum.Font.Gotham
credit.BackgroundTransparency = 1
credit.ZIndex = 2

-- Loading label
local loadingText = Instance.new("TextLabel", bg)
loadingText.Size = UDim2.new(1, 0, 0, 30)
loadingText.Position = UDim2.new(0, 0, 0.54, 0)
loadingText.Text = "Loading..."
loadingText.TextColor3 = Color3.fromRGB(120, 160, 255)
loadingText.TextStrokeTransparency = 0.6
loadingText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
loadingText.TextSize = 20
loadingText.Font = Enum.Font.Gotham
loadingText.BackgroundTransparency = 1
loadingText.ZIndex = 2

-- Loading bar container
local barBG = Instance.new("Frame", bg)
barBG.Size = UDim2.new(0.5, 0, 0, 20)
barBG.Position = UDim2.new(0.25, 0, 0.6, 0)
barBG.BackgroundColor3 = Color3.fromRGB(30, 50, 100)
barBG.BorderSizePixel = 0
barBG.ClipsDescendants = true
barBG.ZIndex = 2
Instance.new("UICorner", barBG).CornerRadius = UDim.new(0, 10)

-- Loading bar
local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar.BorderSizePixel = 0
bar.ZIndex = 2
Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 10)

-- Light animation inside loading bar
local shimmer = Instance.new("Frame", bar)
shimmer.Size = UDim2.new(0.2, 0, 1, 0)
shimmer.Position = UDim2.new(-0.2, 0, 0, 0)
shimmer.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
shimmer.BackgroundTransparency = 0.5
shimmer.ZIndex = 3
Instance.new("UICorner", shimmer).CornerRadius = UDim.new(0, 8)

-- Animate shimmer
task.spawn(function()
	while shimmer and shimmer.Parent do
		TweenService:Create(shimmer, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			Position = UDim2.new(1, 0, 0, 0)
		}):Play()
		task.wait(2.2)
		shimmer.Position = UDim2.new(-0.2, 0, 0, 0)
	end
end)

-- Animate loading progress
local duration = 180
TweenService:Create(bar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
	Size = UDim2.new(1, 0, 1, 0)
}):Play()

-- Final message
task.delay(duration, function()
	loadingText.Text = "Oops.. The Loading Failed"
	credit.Text = "Rejoin And Try Again!"
end)
