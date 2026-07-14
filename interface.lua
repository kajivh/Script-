-- ============================================
-- INTERFACE - Interface do AUTO BTTG
-- ============================================

local function criar(player, CONFIG)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoBTTGUI"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.IgnoreGuiInset = true
    
    local frame = Instance.new("Frame")
    frame.Size = CONFIG.UI_SIZE
    frame.Position = CONFIG.UI_POSITION
    frame.BackgroundColor3 = CONFIG.COR_BG
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 2
    frame.BorderColor3 = CONFIG.COR_PRIMARY
    frame.ClipsDescendants = true
    frame.ZIndex = 10
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame
    
    -- Título
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 25)
    title.Position = UDim2.new(0, 0, 0, 2)
    title.BackgroundColor3 = CONFIG.COR_PRIMARY
    title.BackgroundTransparency = 0.3
    title.Text = "⚡ AUTO BTTG"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 14
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.Parent = frame
    
    -- Status
    local status = Instance.new("TextLabel")
    status.Name = "StatusLabel"
    status.Size = UDim2.new(1, 0, 0, 20)
    status.Position = UDim2.new(0, 0, 0.16, 0)
    status.BackgroundTransparency = 1
    status.Text = "⏹️ PARADO"
    status.TextColor3 = Color3.fromRGB(200, 50, 50)
    status.TextSize = 12
    status.Font = Enum.Font.Gotham
    status.TextScaled = true
    status.Parent = frame
    
    -- M1
    local m1Btn = Instance.new("TextButton")
    m1Btn.Name = "M1Btn"
    m1Btn.Size = UDim2.new(0.85, 0, 0, 30)
    m1Btn.Position = UDim2.new(0.075, 0, 0.25, 0)
    m1Btn.BackgroundColor3 = CONFIG.COR_PRIMARY
    m1Btn.BackgroundTransparency = 0.2
    m1Btn.BorderSizePixel = 0
    m1Btn.Text = "🔴 M1"
    m1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    m1Btn.TextSize = 13
    m1Btn.Font = Enum.Font.GothamBold
    m1Btn.TextScaled = true
    m1Btn.AutoButtonColor = false
    
    local m1Corner = Instance.new("UICorner")
    m1Corner.CornerRadius = UDim.new(0, 6)
    m1Corner.Parent = m1Btn
    m1Btn.Parent = frame
    
    -- Block
    local blockBtn = Instance.new("TextButton")
    blockBtn.Name = "BlockBtn"
    blockBtn.Size = UDim2.new(0.85, 0, 0, 30)
    blockBtn.Position = UDim2.new(0.075, 0, 0.42, 0)
    blockBtn.BackgroundColor3 = CONFIG.COR_SECONDARY
    blockBtn.BackgroundTransparency = 0.2
    blockBtn.BorderSizePixel = 0
    blockBtn.Text = "🔴 BLOCK"
    blockBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    blockBtn.TextSize = 13
    blockBtn.Font = Enum.Font.GothamBold
    blockBtn.TextScaled = true
    blockBtn.AutoButtonColor = false
    
    local blockCorner = Instance.new("UICorner")
    blockCorner.CornerRadius = UDim.new(0, 6)
    blockCorner.Parent = blockBtn
    blockBtn.Parent = frame
    
    -- Iniciar
    local startBtn = Instance.new("TextButton")
    startBtn.Name = "StartBtn"
    startBtn.Size = UDim2.new(0.85, 0, 0, 35)
    startBtn.Position = UDim2.new(0.075, 0, 0.6, 0)
    startBtn.BackgroundColor3 = CONFIG.COR_SUCCESS
    startBtn.BackgroundTransparency = 0.15
    startBtn.BorderSizePixel = 0
    startBtn.Text = "▶ INICIAR"
    startBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    startBtn.TextSize = 15
    startBtn.Font = Enum.Font.GothamBold
    startBtn.TextScaled = true
    startBtn.AutoButtonColor = false
    
    local startCorner = Instance.new("UICorner")
    startCorner.CornerRadius = UDim.new(0, 8)
    startCorner.Parent = startBtn
    startBtn.Parent = frame
    
    -- Info
    local info = Instance.new("TextLabel")
    info.Size = UDim2.new(1, 0, 0, 18)
    info.Position = UDim2.new(0, 0, 0.88, 0)
    info.BackgroundTransparency = 1
    info.Text = "M1:0.15s | Block:0.3s"
    info.TextColor3 = Color3.fromRGB(150, 150, 180)
    info.TextSize = 10
    info.Font = Enum.Font.Gotham
    info.TextScaled = true
    info.Parent = frame
    
    frame.Parent = screenGui
    screenGui.Parent = player:WaitForChild("PlayerGui")
    
    return {
        ScreenGui = screenGui,
        Frame = frame,
        M1Btn = m1Btn,
        BlockBtn = blockBtn,
        StartBtn = startBtn,
        StatusLabel = status,
    }
end

return {
    criar = criar,
}