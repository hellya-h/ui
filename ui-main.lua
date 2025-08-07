-- Удаляем, если уже есть
if game:GetService("CoreGui"):FindFirstChild("FakeLoadingScreen") then
    game:GetService("CoreGui"):FindFirstChild("FakeLoadingScreen"):Destroy()
end

-- GUI в CoreGui
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
local barFillColor = Color3.fromRGB(255, 255, 255) -- белый

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

-- Плавное появление
game:GetService("TweenService"):Create(background, TweenInfo.new(1.5), {
    BackgroundTransparency = 0
}):Play()

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

-- Более скруглённые углы (угол: 100%)
local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(1, 0)
bgCorner.Parent = barBackground

-- Loading bar (сама заполняющаяся часть)
local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.Position = UDim2.new(0, 0, 0, 0)
loadingBar.BackgroundColor3 = barFillColor -- белый цвет
loadingBar.BorderSizePixel = 0
loadingBar.ZIndex = 2
loadingBar.Parent = barBackground

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = loadingBar

-- Статус
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

-- Фейковые сообщения
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

-- Меняем статус каждые 15 сек
task.spawn(function()
 for i = 1, math.floor(180 / 15) do
  statusText.Text = fakeMessages[math.random(1, #fakeMessages)]
  task.wait(15)
 end
end)

-- Медленная анимация загрузки (на 3 минуты)
local TweenService = game:GetService("TweenService")
local tween = TweenService:Create(loadingBar, TweenInfo.new(180, Enum.EasingStyle.Linear), {
 Size = UDim2.new(1, 0, 1, 0)
})
tween:Play()

-- Если нужно автоудаление через 3 минуты:
-- task.delay(180, function()
--     gui:Destroy()
-- end)
