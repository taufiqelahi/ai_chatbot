# ai_chat_bot 🤖

<p align="center">
A customizable Flutter AI chatbot widget for adding smart assistant features into your app.
</p>

<p align="center">
<img src="https://img.shields.io/pub/v/ai_chat_bot">
<img src="https://img.shields.io/pub/likes/ai_chat_bot">
<img src="https://img.shields.io/pub/points/ai_chat_bot">
<img src="https://img.shields.io/pub/popularity/ai_chat_bot">
</p>

---

## ✨ Features

- 💬 Floating chatbot button
- 📱 Open chat as:
    - Bottom Sheet
    - Full Page
- ⚡ Predefined quick questions
- 🤖 AI-powered responses (OpenRouter)
- 🎨 Fully customizable UI (colors, styles, buttons)
- 🧠 Smart fallback: predefined → AI
- 🧩 Easy integration into any Flutter app

---

## 📸 Preview

<!-- Replace these with your real screenshots -->
<p align="center">
<img src="https://via.placeholder.com/250x500.png?text=Chat+Preview+1" width="250">
<img src="https://via.placeholder.com/250x500.png?text=Chat+Preview+2" width="250">
</p>

---

## 🚀 Installation

Add to your `pubspec.yaml`:

```
dependencies:
  ai_chat_bot: ^0.0.1
  
```
 Then run:
```
flutter pub get
```
---
#### 📦 Import
```
import 'package:ai_chat_bot/ai_chat_bot.dart';
```
# 🔐 API Token Setup (OpenRouter)

This package uses OpenRouter to generate AI responses.

## Step 1: Create account

Go to 👉 https://openrouter.ai

## Step 2: Generate API Key
1. Go to your **Dashboard**
2. Navigate to **API Keys**
3. Click **Create New Key**
4. Copy the generated API token

⚠️ Keep your API key secure. Do NOT expose it in public repositories.

 ⚡ Quick Example

```dart
import 'package:ai_chat_bot/ai_chat_bot.dart';
import 'package:example/token.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: [
          // Your normal screen content
          Center(child: Text("Main Screen")),
          SmartChatBotHelper(
            appName: "Facebook",// Name of your app displayed in chat header
            showPredefinedAsChatMessages: false,
            openType: ChatBotOpenType.page,
            ///AI context to provide relevant answers based on app features and user needs
            appDescription:
            "Facebook is a social app where you can connect with friends, chat, and share what's on your mind. "
                "You can find people from your contacts, send messages, and share photos and videos easily. "
                "Stay connected with your friends, join meetings, and keep up with the latest news—all in one place.",


/// Instant responses for common questions about your app features
            predefinedButtons: {
              "How do I create a post?":
              "Tap on 'What's on your mind?' at the top of your feed to create a post.",

              "How do I add a friend?":
              "Go to a profile and tap on 'Add Friend' to send a request.",

              "How do I send a message?":
              "Open Messenger, choose a friend, and start chatting.",

              "How do I upload a photo?":
              "Tap on 'Photo/Video' while creating a post and select your media.",

              "How do I see notifications?":
              "Tap on the bell icon to check your latest notifications.",

              "How do I update my profile?":
              "Go to your profile and tap 'Edit Profile' to update your info.",
            },
            
/// Instant responses for simple greetings or questions that don't require AI
            predefinedMessages: {
              "hi": "Hi 👋, welcome! How can I help you today?",
              "who are you": "I’m your assistant 🤖, here to help you use the app.",
            },

            theme: ChatBotTheme(
              backgroundColor: Colors.white,
              userMessageColor: Colors.blue,
              userMessageTextColor: Colors.white,
              botMessageColor: Colors.grey.shade200,
              sendButtonColor: Colors.green,
              predefinedButtonTextColor: Colors.red,

              predefinedButtonTextStyle: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              predefinedButtonDecoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.blueAccent),
              ),
            ),
            token: "$token",
          ),
        ],
      ),
    );
    ;
  }
}

```
## ⚙️ Configuration

### SmartChatBotHelper Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `appName` | `String` | ✅ Yes | Name of your app displayed in chat header |
| `appDescription` | `String` | ✅ Yes | Context information for AI to provide relevant responses |
| `token` | `String` | ✅ Yes | Your OpenRouter API key for AI responses |
| `predefinedMessages` | `Map<String, String>` | ❌ No | Key-value pairs for instant responses without AI |
| `predefinedButtons` | `Map<String, String>` | ❌ No | Quick question buttons that users can tap |
| `showPredefinedAsChatMessages` | `bool` | ❌ No | Display predefined options as chat bubbles (default: `false`) |
| `openType` | `ChatBotOpenType` | ❌ No | How the chat opens: `bottomSheet` or `page` (default: `bottomSheet`) |
| `theme` | `ChatBotTheme` | ❌ No | Customize colors, styles, and appearance |

### ChatBotOpenType Options

| Value | Description |
|-------|-------------|
| `ChatBotOpenType.bottomSheet` | Opens as a modal bottom sheet that slides up |
| `ChatBotOpenType.page` | Opens as a full-screen page with navigation |

### ChatBotTheme Properties

| Property | Type | Description |
|----------|------|-------------|
| `backgroundColor` | `Color` | Main background color of the chat |
| `userMessageColor` | `Color` | Background color of user messages |
| `userMessageTextColor` | `Color` | Text color of user messages |
| `botMessageColor` | `Color` | Background color of bot messages |
| `botMessageTextColor` | `Color` | Text color of bot messages (default: `Colors.black`) |
| `sendButtonColor` | `Color` | Color of the send message button |
| `predefinedButtonTextStyle` | `TextStyle` | Text style for predefined buttons |
| `predefinedButtonDecoration` | `BoxDecoration` | Decoration for predefined buttons |
| `headerColor` | `Color` | Background color of the chat header |
| `headerTextColor` | `Color` | Text color of the chat header |
| `inputBackgroundColor` | `Color` | Background color of the input field |
| `inputTextColor` | `Color` | Text color of the input field |

### Usage Examples

#### Basic Configuration
```dart
 SmartChatBotHelper(
appName: "Facebook",// Name of your app
showPredefinedAsChatMessages: false,
openType: ChatBotOpenType.page,
appDescription:// Context for AI to provide relevant answers
"Facebook is a social app where you can connect with friends, chat, and share what's on your mind. "
"You can find people from your contacts, send messages, and share photos and videos easily. "
"Stay connected with your friends, join meetings, and keep up with the latest news—all in one place.",


// Instant responses for common questions

predefinedButtons: {
"How do I create a post?":
"Tap on 'What's on your mind?' at the top of your feed to create a post.",

"How do I add a friend?":
"Go to a profile and tap on 'Add Friend' to send a request.",

"How do I send a message?":
"Open Messenger, choose a friend, and start chatting.",

"How do I upload a photo?":
"Tap on 'Photo/Video' while creating a post and select your media.",

"How do I see notifications?":
"Tap on the bell icon to check your latest notifications.",

"How do I update my profile?":
"Go to your profile and tap 'Edit Profile' to update your info.",
},
// Instant responses for simple greetings or questions
predefinedMessages: {
"hi": "Hi 👋, welcome! How can I help you today?",
"who are you": "I’m your assistant 🤖, here to help you use the app.",
},

theme: ChatBotTheme(
backgroundColor: Colors.white,
userMessageColor: Colors.blue,
userMessageTextColor: Colors.white,
botMessageColor: Colors.grey.shade200,
sendButtonColor: Colors.green,
predefinedButtonTextColor: Colors.red,

predefinedButtonTextStyle: const TextStyle(
color: Colors.black87,
fontSize: 14,
fontWeight: FontWeight.bold,
),
predefinedButtonDecoration: BoxDecoration(
color: Colors.blue.shade50,
borderRadius: BorderRadius.circular(14),
border: Border.all(color: Colors.blueAccent),
),
),
token: "$token"// Your OpenRouter API key for AI responses,
),
```

## 🔄 How It Works

The chatbot follows a simple yet effective flow to provide responses:

1. **User sends message** - User types or selects a question
2. **Check predefinedMessages** - System looks for exact match in instant response map
3. **Check predefinedButtons** - If no match, checks predefined quick questions
4. **Send to AI** - If no predefined response found, forwards to OpenRouter AI
5. **Display response** - Shows the answer in chat interface


Found a bug? Open an issue on GitHub.


## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.


## 👨‍💻 Author

**Taufiq Elahi**

- GitHub: [@taufiqelahi](https://github.com/taufiqelahi)


---

<p align="center">
Made with ❤️ for the Flutter community
</p>


---

## 📸 Preview

<p align="center">
  <img src="https://github.com/taufiqelahi/ai_chatbot/blob/main/assets/ss1.png" width="250"/>
  <img src="https://github.com/taufiqelahi/ai_chatbot/blob/main/assets/ss2.png" width="250"/>
</p>
```md


Remove any real API key from repo
Update version:
version: 0.0.1
```