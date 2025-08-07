local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")

-- Создаём GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Name = "EverythingScriptGui"
gui.DisplayOrder = 9999999

-- Блокировка мыши
local blockInput = Instance.new("TextButton", gui)
blockInput.Size = UDim2.new(1,0,1,0)
blockInput.BackgroundTransparency = 1
blockInput.Text = ""
blockInput.Modal = true -- это блокирует ввод, включая ESC

-- Фон
local background = Instance.new("Frame", gui)
background.Size = UDim2.new(1,0,1,0)
background.BackgroundColor3 = Color3.fromRGB(10, 10, 20)

-- Логотип
local logo = Instance.new("ImageLabel", background)
logo.Size = UDim2.new(0, 100, 0, 100)
logo.Position = UDim2.new(0.5, -50, 0.25, -50)
logo.BackgroundTransparency = 1
logo.Image = "https://www.roblox.com/asset/?id=16413073906" -- заменяемая ссылка
logo.ZIndex = 2

-- Анимация вращения логотипа
task.spawn(function()
	while gui do
		logo.Rotation += 1
		task.wait(0.01)
	end
end)

-- Название
local title = Instance.new("TextLabel", background)
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0.4, 0)
title.Text = "Everything Script"
title.TextColor3 = Color3.fromRGB(0, 170, 255)
title.TextSize = 36
title.Font = Enum.Font.GothamBlack
title.BackgroundTransparency = 1

-- Подпись
local credit = Instance.new("TextLabel", background)
credit.Size = UDim2.new(1, 0, 0, 30)
credit.Position = UDim2.new(0, 0, 0.46, 0) -- немного ниже
credit.Text = "By @thebestexploiterr on tiktok"
credit.TextColor3 = Color3.fromRGB(0, 140, 255)
credit.TextSize = 20
credit.Font = Enum.Font.Gotham
credit.BackgroundTransparency = 1

-- Текст Loading
local loadingText = Instance.new("TextLabel", background)
loadingText.Size = UDim2.new(1, 0, 0, 30)
loadingText.Position = UDim2.new(0, 0, 0.54, 0)
loadingText.Text = "Loading..."
loadingText.TextColor3 = Color3.fromRGB(120, 160, 255)
loadingText.TextSize = 20
loadingText.Font = Enum.Font.Gotham
loadingText.BackgroundTransparency = 1

-- Обёртка загрузочного бара
local barBackground = Instance.new("Frame", background)
barBackground.Size = UDim2.new(0.5, 0, 0, 20)
barBackground.Position = UDim2.new(0.25, 0, 0.6, 0)
barBackground.BackgroundColor3 = Color3.fromRGB(30, 50, 100)
barBackground.BorderSizePixel = 0
barBackground.ClipsDescendants = true
barBackground.BackgroundTransparency = 0
barBackground.ZIndex = 1
barBackground.Name = "BarBG"
barBackground:FindFirstChildOfClass("UICorner") or Instance.new("UICorner", barBackground).CornerRadius = UDim.new(0, 10)

-- Белый индикатор прогресса
local bar = Instance.new("Frame", barBackground)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.Position = UDim2.new(0, 0, 0, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar.BorderSizePixel = 0
bar.ZIndex = 2
Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 10)

-- Кнопка Rejoin
local rejoinBtn = Instance.new("TextButton", background)
rejoinBtn.Size = UDim2.new(0, 200, 0, 40)
rejoinBtn.Position = UDim2.new(0.5, -100, 0.7, 0)
rejoinBtn.Text = "Rejoin"
rejoinBtn.BackgroundColor3 = Color3.fromRGB(40, 80, 180)
rejoinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
rejoinBtn.TextSize = 20
rejoinBtn.Font = Enum.Font.Gotham
Instance.new("UICorner", rejoinBtn).CornerRadius = UDim.new(0, 10)

-- Обработка нажатия Rejoin
rejoinBtn.MouseButton1Click:Connect(function()
	local player = Players.LocalPlayer
	TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
end)

-- Медленная загрузка (3 минуты)
local duration = 180 -- секунд
local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
TweenService:Create(bar, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)}):Play()

-- После 3 минут – сообщение об ошибке
task.delay(duration, function()
	loadingText.Text = "Oops.. The Loading Failed"
	credit.Text = "Rejoin And Try Again!"
end)
