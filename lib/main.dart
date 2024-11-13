import 'package:flutter/material.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:get/get.dart';
import 'package:ujicobagemma/route.dart';
import 'package:ujicobagemma/routename.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "demo",
      initialRoute: Names.pageChat,
      getPages: Routes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
