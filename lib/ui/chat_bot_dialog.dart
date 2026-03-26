import 'package:ai_chat_bot/model/chat_message.dart';
import 'package:ai_chat_bot/services/ai_service.dart';
import 'package:ai_chat_bot/utils/chat_bot_theme.dart';
import 'package:flutter/material.dart';

class ChatBotDialog extends StatefulWidget {
  final String appName;
  final String appDescription;
  final Map<String, String> predefinedMessages;
  final Map<String, String> predefinedButtons;
  final ChatBotTheme theme;
  final bool showPredefinedAsChatMessages;
  final bool isFullPage;
  final String token;

  const ChatBotDialog({
    super.key,
    required this.appName,
    required this.appDescription,
    required this.predefinedMessages,
    required this.predefinedButtons,
    required this.theme,
    this.showPredefinedAsChatMessages = false,
    this.isFullPage = false,
    required this.token,
  });

  @override
  State<ChatBotDialog> createState() => _ChatBotDialogState();
}

class _ChatBotDialogState extends State<ChatBotDialog> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _messages.add(
      ChatMessage(
        text:
            "👋 Hi! I'm ${widget.appName} Assistant.\nHow can I help you today?",
        isUser: false,
      ),
    );
  }

  String? _checkPredefinedMessages(String text) {
    final lowerText = text.toLowerCase().trim();
    for (final entry in widget.predefinedMessages.entries) {
      if (lowerText.contains(entry.key.toLowerCase())) {
        return entry.value;
      }
    }
    return null;
  }

  Future<void> _sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
      _controller.clear();
      _isLoading = true;
    });

    String reply;

    final predefinedResponse = _checkPredefinedMessages(text);
    if (predefinedResponse != null) {
      reply = predefinedResponse;
    } else if (widget.predefinedButtons.containsKey(text)) {
      reply = widget.predefinedButtons[text]!;
    } else {
      final prompt =
          "You are a helpful assistant for the app '${widget.appName}'. "
          "The app details are: ${widget.appDescription}. "
          "User said: $text";

      reply = await AIService.generateResponse(
        prompt: prompt,
        token: widget.token,
      );
    }

    if (!mounted) return;

    setState(() {
      _messages.add(ChatMessage(text: reply, isUser: false));
      _isLoading = false;
    });
  }

  Widget _buildPredefinedButtonsHorizontal() {
    if (widget.predefinedButtons.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.predefinedButtons.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final question = widget.predefinedButtons.keys.elementAt(index);

          return GestureDetector(
            onTap: () => _sendMessage(question),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color:
                    widget.theme.predefinedButtonColor ??
                    widget.theme.sendButtonColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:
                      widget.theme.predefinedButtonColor ??
                      widget.theme.sendButtonColor ??
                      Colors.blueAccent,
                ),
              ),
              child: Text(
                question,
                style: TextStyle(
                  color: widget.theme.predefinedButtonTextColor ?? Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPredefinedButtonsAsMessages() {
    if (widget.predefinedButtons.isEmpty) {
      return const SizedBox.shrink();
    }

    final questions = widget.predefinedButtons.keys.toList();

    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 12, right: 50),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: widget.theme.botMessageColor ?? Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  widget.theme.predefinedContainerBorderColor ??
                  Colors.grey.shade300,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(questions.length, (index) {
              final question = questions[index];

              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == questions.length - 1 ? 0 : 8,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    widget.theme.predefinedButtonBorderRadius ?? 20,
                  ),
                  onTap: () => _sendMessage(question),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    constraints: const BoxConstraints(maxWidth: 260),
                    padding:
                        widget.theme.predefinedButtonPadding ??
                        const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                    decoration:
                        widget.theme.predefinedButtonDecoration ??
                        BoxDecoration(
                          color:
                              widget.theme.predefinedButtonColor ??
                              widget.theme.sendButtonColor?.withOpacity(0.12) ??
                              Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(
                            widget.theme.predefinedButtonBorderRadius ?? 20,
                          ),
                          border: Border.all(
                            color:
                                widget.theme.predefinedButtonBorderColor ??
                                widget.theme.sendButtonColor ??
                                Colors.blueAccent,
                          ),
                        ),
                    child: Text(
                      question,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style:
                          widget.theme.predefinedButtonTextStyle ??
                          TextStyle(
                            color:
                                widget.theme.predefinedButtonTextColor ??
                                widget.theme.sendButtonColor ??
                                Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildPredefinedSection() {
    if (widget.showPredefinedAsChatMessages) {
      return _buildPredefinedButtonsAsMessages();
    }
    return _buildPredefinedButtonsHorizontal();
  }

  Widget _buildMessageBubble(ChatMessage msg) {
    return Align(
      alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: msg.isUser
              ? widget.theme.userMessageColor
              : widget.theme.botMessageColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          msg.text,
          style:
              widget.theme.messageTextStyle ??
              TextStyle(
                color: msg.isUser
                    ? widget.theme.userMessageTextColor
                    : widget.theme.botMessageTextColor,
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: widget.isFullPage
              ? double.infinity
              : MediaQuery.of(context).size.height * 0.75,
          color: widget.theme.backgroundColor ?? Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (!widget.isFullPage) ...[
                Text(
                  "Chat with ${widget.appName}",
                  style:
                      widget.theme.titleTextStyle ??
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: widget.theme.sendButtonColor,
                      ),
                ),
                const Divider(),
              ],
              _buildPredefinedSection(),
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final msg = _messages[index];
                    return _buildMessageBubble(msg);
                  },
                ),
              ),
              if (_isLoading)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: widget.theme.sendButtonColor,
                  ),
                ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration:
                          widget.theme.textFieldDecoration ??
                          InputDecoration(
                            hintText: "Type your message...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color:
                                    widget.theme.textFieldBorderColor ??
                                    Colors.grey,
                              ),
                            ),
                          ),
                      onSubmitted: _sendMessage,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      widget.theme.sendIcon ?? Icons.send,
                      color: widget.theme.sendButtonColor,
                    ),
                    onPressed: () => _sendMessage(_controller.text),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
