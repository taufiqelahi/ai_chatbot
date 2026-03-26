
import 'package:ai_chat_bot/ui/chat_bot_dialog.dart';
import 'package:ai_chat_bot/utils/chat_bot_button.dart';
import 'package:ai_chat_bot/utils/chat_bot_theme.dart';
import 'package:flutter/material.dart';

enum ChatBotOpenType {
  bottomSheet,
  page,
}
class SmartChatBotHelper extends StatefulWidget {
  final String appName;
  final String appDescription;
  final Map<String, String> predefinedMessages;
  final Map<String, String> predefinedButtons;
  final ChatBotTheme? theme;
  final bool showPredefinedAsChatMessages;
  final ChatBotOpenType openType;
  final String token;



  const SmartChatBotHelper({
    super.key,
    required this.appName,
    required this.appDescription,
    required this.predefinedMessages,
    required this.predefinedButtons,
    this.theme,
    this.showPredefinedAsChatMessages = false,
    this.openType = ChatBotOpenType.bottomSheet,
    required this.token
  });

  @override
  State<SmartChatBotHelper> createState() => _SmartChatBotHelperState();
}

class _SmartChatBotHelperState extends State<SmartChatBotHelper> {
  void _openChat(BuildContext context) {
    if (widget.openType == ChatBotOpenType.page) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Scaffold(
            backgroundColor: widget.theme?.backgroundColor ?? Colors.white,
            appBar: AppBar(
              title: Text(widget.appName),
              backgroundColor:
              widget.theme?.sendButtonColor ?? Colors.blueAccent,
              foregroundColor: Colors.white,
            ),
            body: ChatBotDialog(
              appName: widget.appName,
              token: widget.token,
              appDescription: widget.appDescription,
              predefinedMessages: widget.predefinedMessages,
              predefinedButtons: widget.predefinedButtons,
              showPredefinedAsChatMessages: widget.showPredefinedAsChatMessages,
              theme: widget.theme ?? ChatBotTheme.defaultTheme(Colors.blueAccent),
              isFullPage: true,
            ),
          ),
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: widget.theme?.backgroundColor ?? Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ChatBotDialog(
        appName: widget.appName,
        token: widget.token,
        appDescription: widget.appDescription,
        predefinedMessages: widget.predefinedMessages,
        predefinedButtons: widget.predefinedButtons,
        showPredefinedAsChatMessages: widget.showPredefinedAsChatMessages,
        theme: widget.theme ?? ChatBotTheme.defaultTheme(Colors.blueAccent),
        isFullPage: false,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ChatBotButton(
      color: widget.theme?.sendButtonColor ?? Colors.blueAccent, // ✅ Fixed line
      onPressed: () => _openChat(context),
    );
  }
}
