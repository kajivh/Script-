-- ============================================
-- UTILS - Utilidades do AUTO BTTG
-- ============================================

-- Log com timestamp
local function log(mensagem, tipo)
    local timestamp = os.date("%H:%M:%S")
    local prefixo = ""
    
    if tipo == "erro" then
        prefixo = "❌ "
    elseif tipo == "sucesso" then
        prefixo = "✅ "
    elseif tipo == "aviso" then
        prefixo = "⚠️ "
    else
        prefixo = "📌 "
    end
    
    print(string.format("[%s] %s%s", timestamp, prefixo, mensagem))
end

-- Delay seguro
local function safeWait(segundos)
    local start = tick()
    while tick() - start < segundos do
        task.wait()
    end
end

return {
    log = log,
    safeWait = safeWait,
}