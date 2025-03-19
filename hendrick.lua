-- Create the UI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local HitboxButton = Instance.new("TextButton")
local VisibilityButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame for the UI
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Size = UDim2.new(0, 200, 0, 160)
Frame.Position = UDim2.new(0.5, -100, 0.5, -80)

-- Hitbox toggle button
HitboxButton.Parent = Frame
HitboxButton.Size = UDim2.new(0, 180, 0, 40)
HitboxButton.Position = UDim2.new(0, 10, 0, 30)
HitboxButton.Text = "Expand Hitbox"
HitboxButton.TextColor3 = Color3.new(1,1,1)
HitboxButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

-- Hitbox visibility button
VisibilityButton.Parent = Frame
VisibilityButton.Size = UDim2.new(0, 180, 0, 40)
VisibilityButton.Position = UDim2.new(0, 10, 0, 80)
VisibilityButton.Text = "Hide Hitbox"
VisibilityButton.TextColor3 = Color3.new(1,1,1)
VisibilityButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

-- Variables to track hitbox state
local player = game.Players.LocalPlayer
local hitboxExpanded = false
local hitboxVisible = true

-- Function to toggle hitbox size
HitboxButton.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = player.Character.HumanoidRootPart
        if hitboxExpanded then
            -- Restore to default size
            rootPart.Size = Vector3.new(2, 2, 1)
            rootPart.Transparency = 0  -- Visible by default
            HitboxButton.Text = "Expand Hitbox"
        else
            -- Expand hitbox size
            rootPart.Size = Vector3.new(10, 10, 10)
            HitboxButton.Text = "Normal Hitbox"
        end
        hitboxExpanded = not hitboxExpanded
    end
end)

-- Function to toggle hitbox visibility
VisibilityButton.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = player.Character.HumanoidRootPart
        if hitboxVisible then
            -- Make the hitbox invisible
            rootPart.Transparency = 1
            VisibilityButton.Text = "Show Hitbox"
        else
            -- Make the hitbox visible
            rootPart.Transparency = 0
            VisibilityButton.Text = "Hide Hitbox"
        end
        hitboxVisible = not hitboxVisible
    end
end)
