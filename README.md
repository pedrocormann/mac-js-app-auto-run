# 🚀 Mac Auto Launch: Chrome App on Boot

Este projeto configura um Mac para:

- ✅ Rodar um servidor local (como Vite ou outro app Node.js)
- ✅ Abrir automaticamente uma página web no Chrome em modo app (sem barra de navegação)
- ✅ Garantir que o Chrome abra sempre em tela cheia e em primeiro plano
- ✅ Eliminar notificações irritantes de restauração de janelas do Chrome

---

## 🗂 Estrutura do Projeto

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

## ⚙️ Instalação

### 1. Mova os scripts para as pastas corretas

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
Acesse:

Preferências do Sistema → Privacidade e Segurança → Acesso Total ao Disco

Adicione os seguintes apps:

Terminal (ou iTerm)

Visual Studio Code (se estiver usando)

Automator (opcional, caso vá editar AppleScript)

4. (Opcional) Compile o AppleScript
Para rodar manualmente:

bash
Copy
Edit
osascript applescript/main.scpt
Ou para gerar um .app:

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
💡 Dica: Evitar restauração de janelas no Chrome
Execute no Terminal:

bash
Copy
Edit
defaults write com.google.Chrome "exit_type" -string "Normal"
defaults write com.google.Chrome "exited_cleanly" -bool true
E verifique se o arquivo ~/Library/Application Support/Google/Chrome/Default/Preferences não está corrompido.

✅ Resultado Esperado
Sempre que o Mac for iniciado:

🔧 O servidor local será iniciado automaticamente

🌐 O Chrome abrirá no link configurado (http://localhost:4173) em modo app

🖥️ A janela do Chrome será trazida ao primeiro plano e ficará em fullscreen

🙅 Nenhuma janela de restauração será exibida

Feito com 💻 por @pedrocormann