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
            appName: "Plnze",
            showPredefinedAsChatMessages: true,
            openType: ChatBotOpenType.page,
            appDescription:
                "This is a professional social media application that combines communication, content sharing, meetings, and news in a single platform.The app automatically connects users with people from their device contacts, similar to WhatsApp, allowing them to find and interact with existing contacts easily. Users can create a professional profile, connect with friends and colleagues, and communicate through messaging.Users can share moments in the form of text posts, images, and videos, similar to modern social media platforms. The app also allows users to create and join online meetings with video and audio support, similar to Google Meet, for professional discussions, teamwork, and collaboration.Additionally, the app includes a built-in news feed that aggregates trusted global news sources, similar to Google News and Apple News. News categories include international, business, technology, sports, and politics, with sources such as CNN, Al Jazeera, and other verified publishers.The overall goal of the app is to provide a unified professional ecosystem where users can connect, communicate, collaborate, share updates, and stay informed—all within one secure and user-friendly application.",
            predefinedButtons: {
              "How to create a meetings?":
                  "Go to the 'Meetings' tab on nav bar and click on 'Create Meeting'.",
              "How to contact support?": "Use the 'Support' tab in the app.",
              "What features does the app offer?":
                  "You can share posts, create meetings, and chat with friends.",
            },
            predefinedMessages: {
              "hi": "Hello there 👋, how can I help you today?",
              "who are you": "I’m your virtual assistant for Plnze.",
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
            token:
                "$token",
          ),
        ],
      ),
    );
    ;
  }
}
