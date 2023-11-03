import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;

  ChatBubble({
    required this.message,
    required this.time,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: isMe ? 30.0 : 0.0,
        right: isMe ? 0.0 : 30.0,
        top: 5.0,
        bottom: 5.0,
      ),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isMe ? Colors.blue : Theme.of(context).disabledColor,
        borderRadius: isMe
            ? const BorderRadius.only(
                topRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(10.0),
              ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(message, style: TextStyle(color: isMe ? Theme.of(context).cardColor : Colors.black)),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(time, style: TextStyle(fontSize: 12.0, color: Theme.of(context).disabledColor)),
            ],
          ),
          const SizedBox(width: 5.0),
        ],
      ),
    );
  }
}
