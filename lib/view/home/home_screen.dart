import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_note_app/constants/design/sizes.dart';
import 'package:link_note_app/controller/home_controller.dart';
import 'package:link_note_app/view/widget/link_title_tile.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});
  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tagController.myTags.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            "Link Folder",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
              onPressed: controller.addLinkTitle,
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
          child: Obx(
            () => ListView.separated(
                itemCount: controller.tagController.myTags.length,
                separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: Sizes.size5),
                      child: Divider(
                        thickness: 0.2,
                      ),
                    ),
                itemBuilder: (context, index) {
                  String tag = controller.tagController.myTags[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Sizes.size20),
                    child: Obx(
                      () => LinkTitleTile(
                        contentOnTap: () => controller.goAllLinksScreen(tag),
                        title: tag,
                        image: controller.tagImage[tag],
                        linkslength:
                            controller.tagController.allLinks[tag]?.length ?? 0,
                        moreOnTap: () => controller.moreOnTap(context, tag),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
