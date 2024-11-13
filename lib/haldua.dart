import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ujicobagemma/chatbubble.dart';
import 'package:ujicobagemma/halduacon.dart';
import 'package:ujicobagemma/textfield.dart';

class haldua extends GetView<halduacon> {
  const haldua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Chat Screen",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,

      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.black54
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Obx(
                        () => controller.isLoading.value ? const CircularProgressIndicator() : ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          var message = controller.messages[index];
                          return ChatBubble(message: message, controller: controller);
                        }
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputTextFields(controller: controller),
                ),
            ],
          ),
        ),
      ),
    );
  }
}