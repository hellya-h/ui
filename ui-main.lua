local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer

-- Защита от повторного запуска
if game.CoreGui:FindFirstChild("EverythingScriptGui") then
    game.CoreGui:FindFirstChild("EverythingScriptGui"):Destroy()
end

local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Name = "EverythingScriptGui"
gui.Parent = game:GetService("CoreGui")

-- Фон
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 20)

-- Логотип
local logo = Instance.new("ImageLabel", bg)
logo.Size = UDim2.new(0, 100, 0, 100)
logo.Position = UDim2.new(0.5, -50, 0.25, -50)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://13577884121" -- рабочий ID
logo.ZIndex = 2

-- Вращение
task.spawn(function()
	while gui and logo do
		logo.Rotation += 1
		task.wait(0.01)
	end
end)

-- Тексты
local title = Instance.new("TextLabel", bg)
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0.4, 0)
title.Text = "Everything Script"
title.TextColor3 = Color3.fromRGB(0, 170, 255)
title.TextSize = 36
title.Font = Enum.Font.GothamBlack
title.BackgroundTransparency = 1

local credit = Instance.new("TextLabel", bg)
credit.Size = UDim2.new(1, 0, 0, 30)
credit.Position = UDim2.new(0, 0, 0.46, 0)
credit.Text = "By @thebestexploiterr on tiktok"
credit.TextColor3 = Color3.fromRGB(0, 140, 255)
credit.TextSize = 20
credit.Font = Enum.Font.Gotham
credit.BackgroundTransparency = 1

local loadingText = Instance.new("TextLabel", bg)
loadingText.Size = UDim2.new(1, 0, 0, 30)
loadingText.Position = UDim2.new(0, 0, 0.54, 0)
loadingText.Text = "Loading..."
loadingText.TextColor3 = Color3.fromRGB(120, 160, 255)
loadingText.TextSize = 20
loadingText.Font = Enum.Font.Gotham
loadingText.BackgroundTransparency = 1

-- Бар
local barBG = Instance.new("Frame", bg)
barBG.Size = UDim2.new(0.5, 0, 0, 20)
barBG.Position = UDim2.new(0.25, 0, 0.6, 0)
barBG.BackgroundColor3 = Color3.fromRGB(30, 50, 100)
barBG.BorderSizePixel = 0
barBG.ClipsDescendants = true
Instance.new("UICorner", barBG).CornerRadius = UDim.new(0, 10)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 10)

-- Кнопка Rejoin
local btn = Instance.new("TextButton", bg)
btn.Size = UDim2.new(0, 200, 0, 40)
btn.Position = UDim2.new(0.5, -100, 0.7, 0)
btn.Text = "Rejoin"
btn.BackgroundColor3 = Color3.fromRGB(40, 80, 180)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 20
btn.Font = Enum.Font.Gotham
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
btn.MouseButton1Click:Connect(function()
	TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
end)

-- Загрузка
local duration = 180
TweenService:Create(bar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)}):Play()

-- После загрузки
task.delay(duration, function()
	loadingText.Text = "Oops.. The Loading Failed"
	credit.Text = "Rejoin And Try Again!"
end)
