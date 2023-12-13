import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:link_note_app/controller/home_controller.dart';
import 'package:link_note_app/controller/tag_select_controller.dart';
import 'package:link_note_app/model/link.dart';
import 'package:link_note_app/util/app_routes.dart';
import 'package:link_note_app/view/widget/dialog_text.dart';
import 'package:link_note_app/view/widget/dialog_text_field.dart';
// import 'package:link_note_app/view/widget/my_bottom_sheet.dart';
import 'package:ogp_data_extract/ogp_data_extract.dart';

class LinksController extends GetxController {
  final tag = Get.arguments['tag'];
  var tagController = Get.find<TagSelectController>();
  var homeController = Get.find<HomeScreenController>();

  late List<String> links;
  final RxList<Link> linkTiles = RxList<Link>();
  final TextEditingController linkTextController = TextEditingController();
  final RxBool isLoading = true.obs;

  void addLink() {
    Get.dialog(
      DialogTextField(
        controller: linkTextController,
        leftOnTap: () {
          Get.back();
        },
        rightOnTap: () {
          onSaveLink(linkTextController.text);
          Get.back();
        },
        hintText: "https://",
        headerText: "링크를 입력해주세요.",
      ),
    );
  }

  void onSaveLink(String link) {
    links.add(link);
    tagController.allLinks[tag] = links;
    if (tagController.prefs != null) {
      tagController.prefs!.setStringList(tag, links);
    }
    addListTile(link);
    homeController.getTagImage(link, tag);
  }

  Future addListTile(String link) async {
    final OgpData? ogpData = await OgpDataExtract.execute(link);
    linkTiles.add(
      Link.fromMap(
        {
          "tag": tag,
          "link": link,
          "title": ogpData?.title ?? link,
          "image": ogpData?.image,
        },
      ),
    );
  }

  Future getOpenGraph() async {
    isLoading(true);
    for (String taglink in links) {
      final OgpData? ogpData = await OgpDataExtract.execute(taglink);
      linkTiles.add(
        Link.fromMap(
          {
            "tag": tag,
            "link": taglink,
            "title": ogpData?.title ?? taglink,
            "image": ogpData?.image,
          },
        ),
      );
    }
    isLoading(false);
  }

  void moreLinkTileOnTap(BuildContext context, String link) {
    Get.dialog(DialogText(
      headerText: "정말 삭제하시겠습니까?",
      leftOnTap: () {
        Get.back();
      },
      rightOnTap: () => removeLink(link),
    ));
    // showModalBottomSheet(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return MyBottomSheet(
    //       headerIcon: const FaIcon(FontAwesomeIcons.shareFromSquare),
    //       headerText: "링크 이동",
    //       footerText: "링크 삭제",
    //       headerOnTap: () {
    //         Get.back();
    //       },
    //       footerOnTap: () {
    //         Get.dialog(DialogText(
    //           headerText: "정말 삭제하시겠습니까?",
    //           leftOnTap: () {
    //             Get.back();
    //           },
    //           rightOnTap: () => removeLink(tag),
    //         ));
    //       },
    //     );
    //   },
    // );
  }

  void changeLink() {}
  void removeLink(String link) async {
    var prefs = tagController.prefs!;
    links.remove(link);
    tagController.allLinks[tag]?.remove(link);
    await prefs.remove(tag);
    await prefs.setStringList(tag, links);
    await getOpenGraph();
    Get.back();
  }

  void goWeb(String link) {
    Get.toNamed(AppRoutes.webView, arguments: {"link": link});
  }

  @override
  void onInit() {
    super.onInit();
    links = tagController.allLinks[tag] ?? [];
    getOpenGraph();
  }
}
