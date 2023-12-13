import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_note_app/controller/home_controller.dart';
import 'package:link_note_app/controller/links_controller.dart';
import 'package:link_note_app/controller/my_web_view_controller.dart';
import 'package:link_note_app/controller/tag_select_controller.dart';
import 'package:link_note_app/util/app_pages.dart';
import 'package:link_note_app/util/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(
        () {
          Get.put(TagSelectController());
          Get.put(HomeScreenController());
          Get.lazyPut(() => LinksController(), fenix: true);
          Get.lazyPut(() => MyWebViewController(), fenix: true);
        },
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.tagSelect,
    );
  }
}
