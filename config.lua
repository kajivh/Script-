-- ============================================
-- CONFIG - Configurações do AUTO BTTG
-- ============================================

local CONFIG = {
    -- Tempos de reação (em segundos)
    M1_INTERVALO = 0.15,      -- Intervalo entre cliques M1
    BLOCK_DELAY = 0.3,        -- Delay para bloquear
    
    -- Posição da UI
    UI_POSITION = UDim2.new(0.02, 0, 0.5, -120),
    UI_SIZE = UDim2.new(0, 160, 0, 200),
    
    -- Cores
    COR_PRIMARY = Color3.fromRGB(0, 150, 255),
    COR_SECONDARY = Color3.fromRGB(255, 70, 70),
    COR_SUCCESS = Color3.fromRGB(0, 200, 80),
    COR_BG = Color3.fromRGB(15, 15, 30),
}

return CONFIG