import 'package:flutter/material.dart';

class ChatBotTheme {
  final Color? backgroundColor;
  final Color? userMessageColor;
  final Color? botMessageColor;
  final Color? userMessageTextColor;
  final Color? botMessageTextColor;
  final Color? sendButtonColor;
  final Color? textFieldBorderColor;
  final Color? predefinedButtonColor;
  final Color? predefinedButtonTextColor;
  final TextStyle? titleTextStyle;
  final TextStyle? messageTextStyle;
  final InputDecoration? textFieldDecoration;
  final IconData? sendIcon;

  final BoxDecoration? predefinedButtonDecoration;
  final TextStyle? predefinedButtonTextStyle;
  final Color? predefinedButtonBorderColor;
  final double? predefinedButtonBorderRadius;
  final EdgeInsetsGeometry? predefinedButtonPadding;
  final Color? predefinedContainerBorderColor;

  const ChatBotTheme({
    this.backgroundColor,
    this.userMessageColor,
    this.botMessageColor,
    this.userMessageTextColor,
    this.botMessageTextColor,
    this.sendButtonColor,
    this.textFieldBorderColor,
    this.predefinedButtonColor,
    this.predefinedButtonTextColor,
    this.titleTextStyle,
    this.messageTextStyle,
    this.textFieldDecoration,
    this.sendIcon,
    this.predefinedButtonDecoration,
    this.predefinedButtonTextStyle,
    this.predefinedButtonBorderColor,
    this.predefinedButtonBorderRadius,
    this.predefinedButtonPadding,
    this.predefinedContainerBorderColor,
  });

  factory ChatBotTheme.defaultTheme(Color primary) => ChatBotTheme(
    backgroundColor: Colors.white,
    userMessageColor: primary.withOpacity(0.9),
    botMessageColor: Colors.grey[200],
    userMessageTextColor: Colors.white,
    botMessageTextColor: Colors.black87,
    sendButtonColor: primary,
    textFieldBorderColor: primary.withOpacity(0.5),
    predefinedButtonColor: primary.withOpacity(0.15),
    predefinedButtonTextColor: primary,
    predefinedButtonBorderColor: primary,
    predefinedButtonBorderRadius: 20,
    predefinedButtonPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 10,
    ),
    predefinedContainerBorderColor: Colors.grey.shade300,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: primary,
    ),
  );
}