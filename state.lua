-- ============================================
-- STATE - Estado do AUTO BTTG
-- ============================================

local estado = {
    rodando = false,
    m1_ativo = false,
    block_ativo = false,
    m1_task = nil,
    block_task = nil,
}

-- Funções de controle
local function iniciar()
    if estado.rodando then return end
    estado.rodando = true
end

local function parar()
    estado.rodando = false
end

local function toggleM1()
    estado.m1_ativo = not estado.m1_ativo
    return estado.m1_ativo
end

local function toggleBlock()
    estado.block_ativo = not estado.block_ativo
    return estado.block_ativo
end

local function getStatus()
    return {
        rodando = estado.rodando,
        m1 = estado.m1_ativo,
        block = estado.block_ativo,
    }
end

return {
    estado = estado,
    iniciar = iniciar,
    parar = parar,
    toggleM1 = toggleM1,
    toggleBlock = toggleBlock,
    getStatus = getStatus,
}