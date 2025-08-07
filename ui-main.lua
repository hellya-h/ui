-- Удаляем старый GUI, если он есть
if game:GetService("CoreGui"):FindFirstChild("FakeLoadingScreen") then
    game:GetService("CoreGui"):FindFirstChild("FakeLoadingScreen"):Destroy()
end

-- Создаем GUI
local gui = Instance.new("ScreenGui")
gui.Name = "FakeLoadingScreen"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 1000
gui.Parent = game:GetService("CoreGui")

-- Цвета
local backgroundColor = Color3.fromRGB(10, 10, 30)
local mainBlue = Color3.fromRGB(0, 120, 255)
local darkBlue = Color3.fromRGB(20, 20, 50)
local barFillColor = Color3.fromRGB(255, 255, 255)

-- Фон
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = backgroundColor
background.BorderSizePixel = 0
background.BackgroundTransparency = 1
background.Active = false
background.Selectable = false
background.ZIndex = 0
background.Parent = gui

-- Анимация появления
game:GetService("TweenService"):Create(background, TweenInfo.new(1.5), {
	BackgroundTransparency = 0
}):Play()

-- Логотип
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 100, 0, 100)
logo.Position = UDim2.new(0.5, -50, 0.12, 0)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://7733960981" -- Заменяемый логотип
logo.ZIndex = 2
logo.Parent = background

-- Вращение логотипа
task.spawn(function()
	while background.Parent do
		logo.Rotation = logo.Rotation + 1
		task.wait(0.01)
	end
end)

-- Заголовок
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0.26, 0)
title.BackgroundTransparency = 1
title.Text = "Everything Script"
title.TextColor3 = mainBlue
title.TextStrokeTransparency = 0.5
title.TextScaled = true
title.Font = Enum.Font.FredokaOne
title.ZIndex = 1
title.Parent = background

-- Подпись
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0.05, 0)
subtitle.Position = UDim2.new(0, 0, 0.345, 0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "By @thebestexploiterr on tiktok"
subtitle.TextColor3 = mainBlue
subtitle.TextStrokeTransparency = 0.7
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.ZIndex = 1
subtitle.Parent = background

-- Полоса загрузки (фон)
local barBackground = Instance.new("Frame")
barBackground.Size = UDim2.new(0.5, 0, 0.025, 0)
barBackground.Position = UDim2.new(0.25, 0, 0.52, 0)
barBackground.BackgroundColor3 = darkBlue
barBackground.BorderSizePixel = 0
barBackground.ClipsDescendants = true
barBackground.ZIndex = 1
barBackground.Parent = background

local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(1, 0)
bgCorner.Parent = barBackground

-- Загрузка
local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.Position = UDim2.new(0, 0, 0, 0)
loadingBar.BackgroundColor3 = barFillColor
loadingBar.BorderSizePixel = 0
loadingBar.ZIndex = 2
loadingBar.Parent = barBackground

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = loadingBar

-- Статус текста
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, 0, 0.05, 0)
statusText.Position = UDim2.new(0, 0, 0.565, 0)
statusText.BackgroundTransparency = 1
statusText.Text = "Starting..."
statusText.TextColor3 = mainBlue
statusText.TextStrokeTransparency = 0.7
statusText.TextScaled = true
statusText.Font = Enum.Font.Gotham
statusText.ZIndex = 1
statusText.Parent = background

-- Сообщения
local fakeMessages = {
	"Initializing...",
	"Loading modules...",
	"Optimizing assets...",
	"Connecting to servers...",
	"Loading UI components...",
	"Injecting scripts...",
	"Almost done...",
	"Finalizing..."
}

-- Меняем сообщение каждые 15 сек
task.spawn(function()
	for i = 1, math.floor(180 / 15) do
		statusText.Text = fakeMessages[math.random(1, #fakeMessages)]
		task.wait(15)
	end
end)

-- Анимация загрузки
local TweenService = game:GetService("TweenService")
local tween = TweenService:Create(loadingBar, TweenInfo.new(180, Enum.EasingStyle.Linear), {
	Size = UDim2.new(1, 0, 1, 0)
})
tween:Play()

-- Через 3 минуты — сообщение об ошибке
task.delay(180, function()
	-- Удаляем все старое
	for _, obj in pairs(background:GetChildren()) do
		if obj ~= background then
			obj:Destroy()
		end
	end

	-- Сообщение об ошибке
	local errorText = Instance.new("TextLabel")
	errorText.Size = UDim2.new(1, 0, 0.2, 0)
	errorText.Position = UDim2.new(0, 0, 0.4, 0)
	errorText.BackgroundTransparency = 1
	errorText.Text = "Oops...\nThe Loading Failed\nRejoin And Try Again!"
	errorText.TextColor3 = Color3.fromRGB(255, 255, 255)
	errorText.TextStrokeTransparency = 0.4
	errorText.TextScaled = true
	errorText.Font = Enum.Font.GothamBold
	errorText.ZIndex = 2
	errorText.Parent = background
end)
