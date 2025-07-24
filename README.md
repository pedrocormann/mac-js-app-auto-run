# Mac Auto Launch: Chrome App on Boot

Este projeto configura um Mac para:

- Rodar um servidor local (como Vite ou outro app Node.js)
- Abrir automaticamente uma página web no Chrome em modo app (sem barra de navegação)
- Garantir que o Chrome abra sempre em tela cheia e em primeiro plano
- Eliminar notificações irritantes de restauração de janelas do Chrome

---

## 🗂 Estrutura do projeto

mac-auto-sample/
├── bin/
│ ├── start-chrome.sh # Abre o Chrome em modo app apontando para http://localhost:4173
│ └── run-chrome-app.sh # Executa o script acima com delay e força o fullscreen
├── plist/
│ └── com.unflatstudio.chromeapp.plist # LaunchAgent para rodar no boot
├── applescript/
│ └── main.scpt # AppleScript para dar fullscreen no Chrome

yaml
Copy
Edit

---

## 🚀 Instalação

### 1. Mova os scripts para pastas corretas

```bash
mkdir -p ~/bin
cp bin/*.sh ~/bin/
chmod +x ~/bin/*.sh
2. Copie o .plist para os agentes de inicialização
bash
Copy
Edit
mkdir -p ~/Library/LaunchAgents
cp plist/com.unflatstudio.chromeapp.plist ~/Library/LaunchAgents/
3. Permissões necessárias
Vá em:

Preferências do Sistema → Privacidade e Segurança → Acesso Total ao Disco

Adicione:

Terminal ou iTerm

Visual Studio Code (se usar)

Automator (opcional, caso vá editar AppleScript)

4. (Opcional) Compile o AppleScript
bash
Copy
Edit
osascript applescript/main.scpt
Se quiser gerar um app .app a partir dele:

bash
Copy
Edit
osascript -l AppleScript -e 'save applescript/main.scpt as "application"' 
5. Carregue o LaunchAgent
bash
Copy
Edit
launchctl unload ~/Library/LaunchAgents/com.unflatstudio.chromeapp.plist 2>/dev/null
launchctl load ~/Library/LaunchAgents/com.unflatstudio.chromeapp.plist
💡 Dica
Evite que o Chrome salve sessões antigas e abra janelas com restore. Desative no Terminal:

bash
Copy
Edit
defaults write com.google.Chrome "exit_type" -string "Normal"
defaults write com.google.Chrome "exited_cleanly" -bool true
E certifique-se que ~/Library/Application Support/Google/Chrome/Default/Preferences não está corrompido.

✅ Resultado
Sempre que o Mac for iniciado:

O servidor local é carregado

O Chrome abre em modo app no link configurado (http://localhost:4173)

A janela do Chrome é trazida ao primeiro plano e entra em fullscreen

Sem prompts de restauração ou janelas extras