
---

## 📄 **2. loadstring.lua** (Pasta raiz)

```lua
-- ============================================
-- LOADSTRING - AUTO BTTG
-- Carrega todo o script via loadstring
-- ============================================

loadstring([[
    -- ============================================
    -- 1. CARREGAR CONFIGURAÇÕES
    -- ============================================
    
    local CONFIG = {
        M1_INTERVALO = 0.15,
        BLOCK_DELAY = 0.3,
        UI_POSITION = UDim2.new(0.02, 0, 0.5, -120),
        UI_SIZE = UDim2.new(0, 160, 0, 200),
    }
    
    -- ============================================
    -- 2. CARREGAR CORE
    -- ============================================
    
    -- Serviços
    local UIS = game:GetService("UserInputService")
    local player = game:GetService("Players").LocalPlayer
    
    if not player then
        warn("[AUTO] ❌ Jogador não encontrado!")
        return
    end
    
    -- ============================================
    -- 3. ESTADO
    -- ============================================
    
    local estado = {
        rodando = false,
        m1_ativo = false,
        block_ativo = false,
        m1_task = nil,
        block_task = nil,
    }
    
    -- ============================================
    -- 4. AÇÕES
    -- ============================================
    
    local function fazerM1()
        pcall(function()
            local evento = {
                KeyCode = Enum.KeyCode.Button1,
                UserInputType = Enum.UserInputType.MouseButton1,
            }
            UIS:SetKeyDown(evento)
            task.wait(0.02)
            UIS:SetKeyUp(evento)
        end)
    end
    
    local function fazerBlock()
        pcall(function()
            local evento = {
                KeyCode = Enum.KeyCode.F,
                UserInputType = Enum.UserInputType.Keyboard,
            }
            UIS:SetKeyDown(evento)
            task.wait(0.05)
            UIS:SetKeyUp(evento)
        end)
    end
    
    -- ============================================
    -- 5. CICLOS
    -- ============================================
    
    local function cicloM1()
        while estado.rodando and estado.m1_ativo do
            fazerM1()
            task.wait(CONFIG.M1_INTERVALO)
        end
    end
    
    local function cicloBlock()
        while estado.rodando and estado.block_ativo do
            fazerBlock()
            task.wait(CONFIG.BLOCK_DELAY)
        end
    end
    
    -- ============================================
    -- 6. CONTROLE
    -- ============================================
    
    local function iniciar()
        if estado.rodando then return end
        estado.rodando = true
        if estado.m1_ativo then task.spawn(cicloM1) end
        if estado.block_ativo then task.spawn(cicloBlock) end
    end
    
    local function parar()
        estado.rodando = false
    end
    
    local function toggleM1()
        estado.m1_ativo = not estado.m1_ativo
        if estado.m1_ativo and estado.rodando then
            task.spawn(cicloM1)
        end
        return estado.m1_ativo
    end
    
    local function toggleBlock()
        estado.block_ativo = not estado.block_ativo
        if estado.block_ativo and estado.rodando then
            task.spawn(cicloBlock)
        end
        return estado.block_ativo
    end
    
    -- ============================================
    -- 7. INTERFACE
    -- ============================================
    
    local function criarInterface()
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "AutoBTTGUI"
        screenGui.ResetOnSpawn = false
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        screenGui.IgnoreGuiInset = true
        
        local frame = Instance.new("Frame")
        frame.Size = CONFIG.UI_SIZE
        frame.Position = CONFIG.UI_POSITION
        frame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
        frame.BackgroundTransparency = 0.1
        frame.BorderSizePixel = 2
        frame.BorderColor3 = Color3.fromRGB(0, 150, 255)
        frame.ClipsDescendants = true
        frame.ZIndex = 10
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 10)
        corner.Parent = frame
        
        -- Título
        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 25)
        title.Position = UDim2.new(0, 0, 0, 2)
        title.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
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
        m1Btn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
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
        blockBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
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
        startBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 80)
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
    
    -- ============================================
    -- 8. EVENTOS
    -- ============================================
    
    local function configurarEventos(ui)
        -- M1
        ui.M1Btn.MouseButton1Click:Connect(function()
            local ativo = toggleM1()
            ui.M1Btn.Text = ativo and "🟢 M1" or "🔴 M1"
            ui.M1Btn.BackgroundColor3 = ativo and Color3.fromRGB(0, 200, 80) or Color3.fromRGB(0, 150, 255)
        end)
        
        ui.M1Btn.TouchTap:Connect(function()
            ui.M1Btn.MouseButton1Click:Fire()
        end)
        
        -- Block
        ui.BlockBtn.MouseButton1Click:Connect(function()
            local ativo = toggleBlock()
            ui.BlockBtn.Text = ativo and "🟢 BLOCK" or "🔴 BLOCK"
            ui.BlockBtn.BackgroundColor3 = ativo and Color3.fromRGB(0, 200, 80) or Color3.fromRGB(255, 70, 70)
        end)
        
        ui.BlockBtn.TouchTap:Connect(function()
            ui.BlockBtn.MouseButton1Click:Fire()
        end)
        
        -- Start
        ui.StartBtn.MouseButton1Click:Connect(function()
            if estado.rodando then
                parar()
                ui.StartBtn.Text = "▶ INICIAR"
                ui.StartBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 80)
                ui.StatusLabel.Text = "⏹️ PARADO"
                ui.StatusLabel.TextColor3 = Color3.fromRGB(200, 50, 50)
            else
                iniciar()
                ui.StartBtn.Text = "⏹ PARAR"
                ui.StartBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
                ui.StatusLabel.Text = "▶️ EXECUTANDO"
                ui.StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 80)
            end
        end)
        
        ui.StartBtn.TouchTap:Connect(function()
            ui.StartBtn.MouseButton1Click:Fire()
        end)
    end
    
    -- ============================================
    -- 9. INICIALIZAÇÃO
    -- ============================================
    
    local function iniciarScript()
        local oldGui = player.PlayerGui:FindFirstChild("AutoBTTGUI")
        if oldGui then oldGui:Destroy() end
        
        local ui = criarInterface()
        if not ui then return end
        
        configurarEventos(ui)
        
        _G.AutoBTTG = {
            Iniciar = iniciar,
            Parar = parar,
            ToggleM1 = toggleM1,
            ToggleBlock = toggleBlock,
            Testar = function()
                print("[AUTO] 🧪 Testando M1...")
                fazerM1()
                task.wait(0.2)
                print("[AUTO] 🧪 Testando Block...")
                fazerBlock()
                print("[AUTO] ✅ Testes concluídos!")
            end,
            Status = function()
                return {
                    rodando = estado.rodando,
                    m1 = estado.m1_ativo,
                    block = estado.block_ativo,
                }
            end
        }
    end
    
    pcall(iniciarScript)
    
    print("")
    print("╔═══════════════════════════════════════╗")
    print("║   ⚡ AUTO BTTG v2.0                  ║")
    print("╠═══════════════════════════════════════╣")
    print("║   ✅ Interface criada!               ║")
    print("║   📌 Ative M1 e Block               ║")
    print("║   ▶️ Clique em INICIAR              ║")
    print("║   🧪 Teste: _G.AutoBTTG.Testar()   ║")
    print("╚═══════════════════════════════════════╝")
    print("")
    
    print("[AUTO] 📋 Comandos:")
    print("  _G.AutoBTTG.Iniciar()")
    print("  _G.AutoBTTG.Parar()")
    print("  _G.AutoBTTG.ToggleM1()")
    print("  _G.AutoBTTG.ToggleBlock()")
    print("  _G.AutoBTTG.Testar()")
    print("  _G.AutoBTTG.Status()")
    print("")
    
]])