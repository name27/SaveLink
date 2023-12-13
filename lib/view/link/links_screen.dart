import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:link_note_app/constants/design/sizes.dart';
import 'package:link_note_app/controller/links_controller.dart';
import 'package:link_note_app/view/widget/link_title_tile.dart';

class LinksScreen extends GetView<LinksController> {
  const LinksScreen({super.key});
  static const route = '/links';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.tag,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: controller.addLink,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size20),
        child: Obx(
          () => controller.linkTiles.isEmpty
              ? controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : const Center(
                      child: Text("우측 상단 아이콘을 눌러 링크를 추가해보세요."),
                    )
              : Obx(
                  () => ListView.separated(
                      itemCount: controller.linkTiles.length,
                      separatorBuilder: (context, index) => const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: Sizes.size2),
                            child: Divider(
                              thickness: 0.3,
                            ),
                          ),
                      itemBuilder: (context, index) {
                        var linkTile = controller.linkTiles[index];
                        return LinkTitleTile(
                          moreOnTap: () => controller.moreLinkTileOnTap(
                              context, linkTile.link),
                          contentOnTap: () => controller.goWeb(linkTile.link),
                          title: linkTile.title,
                          image: linkTile.image,
                          trailing: const FaIcon(
                            FontAwesomeIcons.trashCan,
                            color: Colors.red,
                            size: Sizes.size16,
                          ),
                        );
                      }),
                ),
        ),
      ),
    );
  }
}
