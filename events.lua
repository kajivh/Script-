-- ============================================
-- EVENTS - Eventos da Interface
-- ============================================

local function configurar(ui, State, Actions, CONFIG)
    -- M1
    ui.M1Btn.MouseButton1Click:Connect(function()
        local ativo = State.toggleM1()
        ui.M1Btn.Text = ativo and "🟢 M1" or "🔴 M1"
        ui.M1Btn.BackgroundColor3 = ativo and CONFIG.COR_SUCCESS or CONFIG.COR_PRIMARY
        
        if ativo and State.estado.rodando then
            task.spawn(function()
                while State.estado.rodando and State.estado.m1_ativo do
                    Actions.fazerM1()
                    task.wait(CONFIG.M1_INTERVALO)
                end
            end)
        end
    end)
    
    ui.M1Btn.TouchTap:Connect(function()
        ui.M1Btn.MouseButton1Click:Fire()
    end)
    
    -- Block
    ui.BlockBtn.MouseButton1Click:Connect(function()
        local ativo = State.toggleBlock()
        ui.BlockBtn.Text = ativo and "🟢 BLOCK" or "🔴 BLOCK"
        ui.BlockBtn.BackgroundColor3 = ativo and CONFIG.COR_SUCCESS or CONFIG.COR_SECONDARY
        
        if ativo and State.estado.rodando then
            task.spawn(function()
                while State.estado.rodando and State.estado.block_ativo do
                    Actions.fazerBlock()
                    task.wait(CONFIG.BLOCK_DELAY)
                end
            end)
        end
    end)
    
    ui.BlockBtn.TouchTap:Connect(function()
        ui.BlockBtn.MouseButton1Click:Fire()
    end)
    
    -- Start
    ui.StartBtn.MouseButton1Click:Connect(function()
        if State.estado.rodando then
            State.parar()
            ui.StartBtn.Text = "▶ INICIAR"
            ui.StartBtn.BackgroundColor3 = CONFIG.COR_SUCCESS
            ui.StatusLabel.Text = "⏹️ PARADO"
            ui.StatusLabel.TextColor3 = Color3.fromRGB(200, 50, 50)
        else
            State.iniciar()
            ui.StartBtn.Text = "⏹ PARAR"
            ui.StartBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
            ui.StatusLabel.Text = "▶️ EXECUTANDO"
            ui.StatusLabel.TextColor3 = CONFIG.COR_SUCCESS
            
            -- Iniciar ciclos se ativos
            if State.estado.m1_ativo then
                task.spawn(function()
                    while State.estado.rodando and State.estado.m1_ativo do
                        Actions.fazerM1()
                        task.wait(CONFIG.M1_INTERVALO)
                    end
                end)
            end
            
            if State.estado.block_ativo then
                task.spawn(function()
                    while State.estado.rodando and State.estado.block_ativo do
                        Actions.fazerBlock()
                        task.wait(CONFIG.BLOCK_DELAY)
                    end
                end)
            end
        end
    end)
    
    ui.StartBtn.TouchTap:Connect(function()
        ui.StartBtn.MouseButton1Click:Fire()
    end)
end

return {
    configurar = configurar,
}