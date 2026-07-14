-- ============================================
-- ACTIONS - Ações do AUTO BTTG
-- ============================================

local UIS = game:GetService("UserInputService")

-- Função para fazer M1
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

-- Função para fazer Block
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

return {
    fazerM1 = fazerM1,
    fazerBlock = fazerBlock,
}