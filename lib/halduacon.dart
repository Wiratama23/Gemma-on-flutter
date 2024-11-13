import 'package:flutter/material.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:get/get.dart';

class halduacon extends GetxController{
  TextEditingController userInput = TextEditingController();
  ScrollController scrollController = ScrollController();
  final flutterGemma = FlutterGemmaPlugin.instance;

  RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;
  RxBool isLoading = true.obs;

  String displayCurrentRes(String user){
    var name="";
    if(user == "user"){
      name = "Anda";
    } else {
      name = "Gemini";
    }
    return name;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    loadModel();
  }


  loadModel(){
    FlutterGemmaPlugin.instance.loadAssetModelWithProgress(fullPath: 'gemma-2b-it-gpu-int4.bin').listen(
          (progress) {
            int prog = -1;
            if(progress > prog){
              print('Loading progress: $progress%');
            }
            prog = progress;
      },
      onDone: () async {
            isLoading.value = false;
            await FlutterGemmaPlugin.instance.init(
              maxTokens: 512,  /// maxTokens is optional, by default the value is 1024
              temperature: 1.0,   /// temperature is optional, by default the value is 1.0
              topK: 1,   /// topK is optional, by default the value is 1
              randomSeed: 1,   /// randomSeed is optional, by default the value is 1
            );
        print('Model loading complete.');
      },
      onError: (error) {
        print('Error loading model: $error');
      },
    );
  }

  genResponse(String input) async {
    messages.add({"role": "user", "content": input});
    String? response = await flutterGemma.getChatResponse(
        messages: messages.map((msg) => Message(text: msg['content'], isUser: msg['role'] == 'user' ? true : false)).toList());
    messages.add({"role": "gemini", "content": response!});
    print(response);
  }
}