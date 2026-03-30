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
            appName: "Facebook",
            showPredefinedAsChatMessages: true,
            openType: ChatBotOpenType.page,
            appDescription:
            "Facebook is a social app where you can connect with friends, chat, and share what's on your mind. "
                "You can find people from your contacts, send messages, and share photos and videos easily. "
                "Stay connected with your friends, join meetings, and keep up with the latest news—all in one place.",

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
