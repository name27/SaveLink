import 'package:get/get.dart';
import 'package:link_note_app/util/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TagSelectController extends GetxController {
  SharedPreferences? prefs;
  final RxList<String> myTags = RxList<String>();

  final RxMap<String, List<String>> allLinks = RxMap<String, List<String>>();

  void skipOnTap() {
    Get.offAndToNamed(AppRoutes.home);
  }

  void tagOnTap(String tag) {
    myTags.contains(tag) ? myTags.remove(tag) : myTags.add(tag);
  }

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      myTags.addAll(prefs!.getStringList('myTags') ?? []);
      if (myTags.isNotEmpty) {
        await Get.offAndToNamed(AppRoutes.home);
      } else {
        await Get.offAndToNamed(AppRoutes.tagSelect);
      }
    }
  }
}
