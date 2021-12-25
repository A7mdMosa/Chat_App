import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {required this.text, required this.sender, required this.isMe, Key? key})
      : super(key: key);

  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Text(sender, style: Theme.of(context).textTheme.subtitle1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Material(
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
            elevation: 5,
            color: isMe ? const Color(0xff2B3C4F) : const Color(0xff527296),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                text,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
