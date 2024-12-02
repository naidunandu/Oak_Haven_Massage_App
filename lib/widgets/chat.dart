import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_assets.dart';
import '../utils/app_theme.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          ...demoChatMessages.map((val) {
            return Message(
              message: val,
            );
          }),
        ],
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    super.key,
    required this.message,
  });

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContain(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.isSender) const SizedBox(width: 100.0 / 2),
          CircleAvatar(
            radius: 15,
            child: Image.asset(
              AppAssets.profileImg,
              height: 140,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 16.0 / 2),
          Expanded(child: messageContain(message)),
        ],
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    super.key,
    this.message,
  });

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0 * 0.75,
            vertical: 16.0 / 2,
          ),
          decoration: BoxDecoration(
            color: message!.isSender ? const Color(0xFFF4F4F4) : const Color(0xFFEFFFEF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message!.userName,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: CustomColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
              ).paddingOnly(bottom: 5),
              Text(
                message!.text,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: CustomColors.secondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
        ),
        if (!message!.isSender) const SizedBox(height: 14),
        if (!message!.isSender)
          Row(
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.heart).paddingOnly(right: 4),
                  const Text(
                    "156",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                    ),
                  )
                ],
              ).paddingOnly(right: 27),
              Row(
                children: [
                  Image.asset(AppAssets.messageSquareText).paddingOnly(right: 4),
                  const Text(
                    "200",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                    ),
                  )
                ],
              ),
            ],
          ),
      ],
    );
  }
}

enum ChatMessageType {
  text,
  image,
}

class ChatMessage {
  final String userName;
  final String text;
  final ChatMessageType messageType;
  final bool isSender;

  ChatMessage({
    this.userName = '',
    this.text = '',
    required this.messageType,
    required this.isSender,
  });
}

List demoChatMessages = [
  ChatMessage(
    userName: "Alexander Cumins",
    text: "Enjoying the renewed mobile app a lot — especially browsing through files in the organisation has become so much more convenient!",
    messageType: ChatMessageType.text,
    isSender: false,
  ),
  ChatMessage(
    userName: "Namretta",
    text: "Thanks so much for the feedback! This is a great idea.",
    messageType: ChatMessageType.text,
    isSender: false,
  ),
  ChatMessage(
    userName: "Jessica",
    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    messageType: ChatMessageType.text,
    isSender: true,
  ),
  ChatMessage(
    userName: "Ada_Bernstein",
    text:
        "Agree, I would love this! I keep opening the links in Slack notifications to the app. Sharing protos, mirroring as am working, and responding to comments are my three most common mobile use cases - first two are great now, just missing the third!",
    messageType: ChatMessageType.text,
    isSender: false,
  ),
];
