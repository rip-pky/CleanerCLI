--[[
    CleanerCLI - Ferramenta de manutenção de diretórios
    Desenvolvido por: [www.github.com/rip-pky]
]]--

local M = {}

-- Configurações padrão
local DEFAULT_CONFIG = {
    dry_run = true,
    paths = {"*.log", "*.tmp", "build", "dist"}
}

-- Cores para o terminal (ANSI)
local colors = {
    green = "\27[32m",
    red   = "\27[31m",
    reset = "\27[0m"
}

-- Processa os argumentos da linha de comando
local function parse_args(args)
    local config = DEFAULT_CONFIG
    for _, arg in ipairs(args) do
        if arg == "--force" then
            config.dry_run = false
        end
    end
    return config
end

-- Executa o comando de sistema com segurança
function M.execute_clean(config)
    print(string.format("%sIniciando limpeza... (Dry-run: %s)%s", 
          colors.green, tostring(config.dry_run), colors.reset))

    for _, path in ipairs(config.paths) do
        local cmd = (package.config:sub(1,1) == "\\") and ("del /s /q " .. path) or ("rm -rf " .. path)
        
        if config.dry_run then
            print("Simulando: " .. cmd)
        else
            local success, status = pcall(os.execute, cmd)
            if success then
                print(string.format("Removido: %s", path))
            else
                print(string.format("%sErro ao remover %s%s", colors.red, path, colors.reset))
            end
        end
    end
end

-- Entrada principal
local args = {...}
local config = parse_args(args)
M.execute_clean(config)