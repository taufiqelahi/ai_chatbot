# 📄 Changelog

## [1.0.0+1] - Initial Release 🚀

### ✨ Added
- 💬 Floating chatbot button for easy access
- 📱 Multiple chat opening options:
    - Bottom Sheet
    - Full Page
- ⚡ Predefined quick question buttons
- 🤖 AI-powered responses using OpenRouter API
- 🧠 Smart response flow:
    - Predefined messages → Predefined buttons → AI fallback
- 🎨 Fully customizable UI via `ChatBotTheme`
- 🧩 Easy integration into any Flutter app

---

### ⚙️ Configuration
- `SmartChatBotHelper` widget with flexible parameters:
    - `appName`
    - `appDescription`
    - `token`
    - `predefinedMessages`
    - `predefinedButtons`
    - `openType`
    - `theme`

---

### 🎨 Customization
- Custom colors for:
    - User messages
    - Bot messages
    - Background
    - Header
    - Input field
- Custom styles and decorations for predefined buttons

---

### 🔐 Security
- OpenRouter API token integration
- Warning to avoid exposing API keys in public repositories

---

### 📦 Developer Experience
- Simple setup with minimal configuration
- Clean and reusable widget structure
- Works seamlessly with any Flutter project

---

## 🔮 Upcoming (Planned Features)

- 🔊 Voice input & speech-to-text
- 📎 File/image attachments support
- 🌐 Multi-language support
- 🧠 Context-aware conversation memory
- 📊 Analytics for chatbot usage
- 💾 Local storage for conversation history
- 🔌 Support for multiple AI providers (OpenAI, Gemini, etc.)