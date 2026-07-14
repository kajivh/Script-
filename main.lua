-- ============================================
-- MAIN - AUTO BTTG
-- Arquivo principal para LocalScript
-- ============================================

-- Carregar módulos
local CONFIG = require(script.Parent.config)
local State = require(script.Parent.core.state)
local Actions = require(script.Parent.core.actions)
local Utils = require(script.Parent.core.utils)
local Interface = require(script.Parent.ui.interface)
local Events = require(script.Parent.ui.events)

-- Serviços
local player = game:GetService("Players").LocalPlayer

if not player then
    warn("[AUTO] ❌ Jogador não encontrado!")
    return
end

-- Inicializar
local function iniciarScript()
    -- Remover GUI antiga
    local oldGui = player.PlayerGui:FindFirstChild("AutoBTTGUI")
    if oldGui then oldGui:Destroy() end
    
    -- Criar interface
    local ui = Interface.criar(player, CONFIG)
    if not ui then
        warn("[AUTO] ❌ Falha ao criar interface!")
        return
    end
    
    -- Configurar eventos
    Events.configurar(ui, State, Actions, CONFIG)
    
    -- Exportar funções
    _G.AutoBTTG = {
        Iniciar = State.iniciar,
        Parar = State.parar,
        ToggleM1 = State.toggleM1,
        ToggleBlock = State.toggleBlock,
        Testar = function()
            print("[AUTO] 🧪 Testando...")
            Actions.fazerM1()
            task.wait(0.2)
            Actions.fazerBlock()
            print("[AUTO] ✅ Testes concluídos!")
        end,
        Status = function()
            return State.getStatus()
        end
    }
    
    print("[AUTO] ✅ Script carregado com sucesso!")
end

pcall(iniciarScript)