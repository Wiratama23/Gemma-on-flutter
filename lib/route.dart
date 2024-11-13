import 'package:get/get.dart';
import 'package:ujicobagemma/haldua.dart';
import 'package:ujicobagemma/halduacon.dart';
import 'package:ujicobagemma/routename.dart';

class Routes {
  static final pages = [
    GetPage(
        name: Names.pageChat,
        page: () => const haldua(),
        binding: BindingsBuilder((){
          Get.put(halduacon());
        })
    ),
  ];
}