import 'package:flutter/material.dart';
import 'package:ujicobagemma/halduacon.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    required this.controller,
  });

  final Map<String, dynamic> message;
  final halduacon controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: message['role'] == 'user' ? Alignment.centerRight : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: message['role'] == 'user' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200
                ),
                child: Text(controller.displayCurrentRes(message['role'])),
              ),
              const SizedBox(height: 5),
              Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                  ),
                  child: Text(message['content']!)),
            ],
          ),
        )
    );
  }
}