import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_note_app/controller/tag_select_controller.dart';
import 'package:link_note_app/util/app_routes.dart';
import 'package:link_note_app/view/widget/my_bottom_sheet.dart';
import 'package:link_note_app/view/widget/dialog_text.dart';
import 'package:link_note_app/view/widget/dialog_text_field.dart';
import 'package:ogp_data_extract/ogp_data_extract.dart';

class HomeScreenController extends GetxController {
  var tagController = Get.find<TagSelectController>();
  final TextEditingController allLinksTitleController = TextEditingController();
  final TextEditingController titleTextController = TextEditingController();

  RxMap<String, String?> tagImage = RxMap();

  void goAllLinksScreen(String tag) {
    Get.toNamed(AppRoutes.links, arguments: {'tag': tag});
  }

  void moreOnTap(BuildContext context, String tag) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        titleTextController.text = tag;
        return MyBottomSheet(
          footerText: "폴더 삭제",
          headerOnTap: () {
            Get.back();
            Get.dialog(
              DialogTextField(
                headerText: "제목 변경",
                controller: titleTextController,
                hintText: "제목을 입력해주세요",
                leftOnTap: () {
                  Get.back();
                },
                rightOnTap: () => changeMyTag(tag),
              ),
            );
          },
          footerOnTap: () {
            Get.dialog(DialogText(
              headerText: "정말 삭제하시겠습니까?",
              leftOnTap: () {
                Get.back();
              },
              rightOnTap: () => removeMyTag(tag),
            ));
          },
        );
      },
    );
  }

  void changeMyTag(String tag) async {
    var myTags = tagController.myTags;
    var prefs = tagController.prefs!;
    myTags[myTags.indexOf(tag)] = titleTextController.text;
    await prefs.setStringList(
        titleTextController.text, tagController.allLinks[tag] ?? []);
    await prefs.remove(tag);
    await prefs.setStringList('myTags', myTags);
    await getTagLink();
    Get.back();
  }

  void removeMyTag(String tag) async {
    var myTags = tagController.myTags;
    var prefs = tagController.prefs!;
    myTags.remove(tag);
    await prefs.remove(tag);
    await prefs.setStringList('myTags', myTags);
    await getTagLink();
    Get.back();
    Get.back();
  }

  void addLinkTitle() {
    Get.dialog(
      DialogTextField(
        headerText: "폴더 제목을 입력해주세요.",
        hintText: "title...",
        controller: allLinksTitleController,
        leftOnTap: () {
          Get.back();
        },
        rightOnTap: () {
          tagController.myTags.add(allLinksTitleController.text);
          tagController.prefs!.setStringList('myTags', tagController.myTags);
          Get.back();
        },
      ),
    );
  }

  Future getTagImage(String url, String myTag) async {
    final OgpData? ogpData = await OgpDataExtract.execute(url);
    tagImage[myTag] = ogpData?.image;
  }

  Future getTagLink() async {
    var myTags = tagController.myTags;
    for (String myTag in myTags) {
      List<String> linkList = tagController.prefs!.getStringList(myTag) ?? [];
      tagController.allLinks[myTag] = linkList;
      if (linkList.isNotEmpty) {
        await getTagImage(linkList.first, myTag);
      }
    }
  }

  @override
  void onInit() async {
    super.onInit();
    ever(tagController.myTags, (_) => getTagLink());
  }
}
