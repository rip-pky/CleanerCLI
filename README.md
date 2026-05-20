# 🧹 Cleaner.lua

Um utilitário simples e eficiente escrito em Lua para automatizar a limpeza de ficheiros e pastas desnecessários no seu ambiente de desenvolvimento.

## 🚀 Como utilizar

### 1. Preparação
Guarde o código fornecido num ficheiro chamado `main.lua` no diretório da sua preferência.

### 2. Execução
Abra o seu terminal (CMD, PowerShell, Bash ou Zsh) e navegue até à pasta onde guardou o ficheiro.

#### Modo de Teste (`Dry-run`)
Por padrão, o script está configurado para `dry_run = true`. Isto significa que **nenhum ficheiro será apagado**, o script apenas exibirá o que seria removido.

```bash
lua cleaner.lua
