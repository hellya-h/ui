--// Fancy Loading Screen UI by @thebestexploiterr // -- Updated: Animated purple-pink glow, better spacing, logo on left

local TweenService = game:GetService("TweenService") local Players = game:GetService("Players") local player = Players.LocalPlayer local playerGui = player:WaitForChild("PlayerGui")

-- Clear any previous GUI if playerGui:FindFirstChild("EverythingScriptUI") then playerGui:FindFirstChild("EverythingScriptUI"):Destroy() end

-- Create GUI local gui = Instance.new("ScreenGui") guizName = "EverythingScriptUI" gui.ResetOnSpawn = false gui.IgnoreGuiInset = true gui.Parent = playerGui

-- Background local background = Instance.new("Frame") background.Size = UDim2.new(1, 0, 1, 0) background.BackgroundColor3 = Color3.fromRGB(10, 0, 20) background.BorderSizePixel = 0 background.Parent = gui

-- UI Gradient Glow local gradient = Instance.new("UIGradient") gradient.Color = ColorSequence.new { ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 0, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 200)) } gradient.Rotation = 0 gradient.Parent = background

-- Animated gradient rotation task.spawn(function() while true do TweenService:Create(gradient, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), { Rotation = gradient.Rotation + 360 }):Play() task.wait(3) end end)

-- Title local title = Instance.new("TextLabel") title.Text = "Everything Script" title.Size = UDim2.new(1, 0, 0, 60) title.Position = UDim2.new(0, 0, 0.25, 0) title.BackgroundTransparency = 1 title.TextScaled = true title.Font = Enum.Font.GothamBold title.TextColor3 = Color3.fromRGB(220, 180, 255) title.TextStrokeColor3 = Color3.fromRGB(255, 0, 255) title.TextStrokeTransparency = 0.5 title.Parent = background

-- Subtitle local subtitle = Instance.new("TextLabel") subtitle.Text = "By @thebestexploiterr on tiktok" subtitle.Size = UDim2.new(1, 0, 0, 30) subtitle.Position = UDim2.new(0, 0, 0.325, 0) subtitle.BackgroundTransparency = 1 subtitle.TextScaled = true subtitle.Font = Enum.Font.Gotham title.TextColor3 = Color3.fromRGB(220, 180, 255) subtitle.TextStrokeColor3 = Color3.fromRGB(255, 0, 255) subtitle.TextStrokeTransparency = 0.5 subtitle.Parent = background

-- Logo image local logo = Instance.new("ImageLabel") logo.Size = UDim2.new(0, 80, 0, 80) logo.Position = UDim2.new(0.32, -100, 0.42, -20) logo.BackgroundTransparency = 1 logo.Image = "rbxassetid://17284584261" -- replace with your ID logo.Parent = background

-- Logo rotation TweenService:Create(logo, TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), { Rotation = 360 }):Play()

-- Loading bar container local loadingContainer = Instance.new("Frame") loadingContainer.Size = UDim2.new(0.3, 0, 0, 20) loadingContainer.Position = UDim2.new(0.5, 0, 0.45, 0) loadingContainer.AnchorPoint = Vector2.new(0.5, 0) loadingContainer.BackgroundColor3 = Color3.fromRGB(40, 0, 60) loadingContainer.BorderSizePixel = 0 loadingContainer.ClipsDescendants = true loadingContainer.Parent = background

local uicorner1 = Instance.new("UICorner") uicorner1.CornerRadius = UDim.new(0, 10) uicorner1.Parent = loadingContainer

-- Inner progress bar local loadingBar = Instance.new("Frame") loadingBar.Size = UDim2.new(0, 0, 1, 0) loadingBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255) loadingBar.BorderSizePixel = 0 loadingBar.Parent = loadingContainer

local uicorner2 = Instance.new("UICorner") uicorner2.CornerRadius = UDim.new(0, 10) uicorner2.Parent = loadingBar

-- Animation light inside bar local shine = Instance.new("Frame") shine.Size = UDim2.new(0.2, 0, 1, 0) shine.Position = UDim2.new(-0.2, 0, 0, 0) shine.BackgroundColor3 = Color3.fromRGB(255, 255, 255) shine.BackgroundTransparency = 0.6 shine.Parent = loadingBar

local shineCorner = Instance.new("UICorner") shineCorner.CornerRadius = UDim.new(0, 10) shineCorner.Parent = shine

-- Animate bar and shine TweenService:Create(loadingBar, TweenInfo.new(180, Enum.EasingStyle.Linear), { Size = UDim2.new(1, 0, 1, 0) }):Play()

TweenService:Create(shine, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), { Position = UDim2.new(1, 0, 0, 0) }):Play()

-- Final message after 3 minutes task.delay(180, function() background:ClearAllChildren()

local failedText = Instance.new("TextLabel")
failedText.Text = "Oops.. The Loading Failed\nRejoin And Try Again!"
failedText.Size = UDim2.new(1, 0, 1, 0)
failedText.Position = UDim2.new(0, 0, 0.4, 0)
failedText.BackgroundTransparency = 1
failedText.TextScaled = true
failedText.Font = Enum.Font.GothamBold
failedText.TextColor3 = Color3.fromRGB(255, 150, 255)
failedText.TextStrokeColor3 = Color3.fromRGB(255, 0, 255)
failedText.TextStrokeTransparency = 0.4
failedText.Parent = background

end)

-- Mouse Lock pcall(function() local camera = workspace.CurrentCamera camera.CameraType = Enum.CameraType.Scriptable camera.CFrame = camera.CFrame end)

-- Block touch buttons (Mobile) local blocker = Instance.new("TextButton") blocker.Size = UDim2.new(1, 0, 1, 0) blocker.BackgroundTransparency = 1 blocker.Text = "" blocker.ZIndex = 100 blocker.AutoButtonColor = false blocker.Parent = background
