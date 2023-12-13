import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_note_app/constants/design/colors.dart';
import 'package:link_note_app/constants/design/gaps.dart';
import 'package:link_note_app/constants/design/sizes.dart';
import 'package:link_note_app/controller/tag_select_controller.dart';
import 'package:link_note_app/util/tags.dart';

class TagSelectScreen extends GetView<TagSelectController> {
  const TagSelectScreen({super.key});
  static const route = '/tagSelect';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.size10),
                child: Column(
                  children: [
                    Text(
                      "Recommended List Title",
                      style: TextStyle(
                          fontSize: Sizes.size28, fontWeight: FontWeight.w700),
                    ),
                    Gaps.v10,
                    Text(
                      "간편하게 링크를 분류할 제목을 선택해주세요.",
                      style: TextStyle(
                          fontSize: Sizes.size16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Gaps.v32,
              Center(
                child: Obx(
                  () => Wrap(
                    spacing: Sizes.size10,
                    runSpacing: Sizes.size10,
                    children: Tags.tags
                        .map((e) => AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: controller.myTags.contains(e) ? 1 : 0.5,
                              child: GestureDetector(
                                onTap: () => controller.tagOnTap(e),
                                child: Container(
                                    width: Sizes.size72,
                                    height: Sizes.size40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: MyColors.primary,
                                      borderRadius:
                                          BorderRadius.circular(Sizes.size10),
                                    ),
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                          fontSize: Sizes.size16,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: MediaQuery.of(context).size.height * 0.1,
        child: GestureDetector(
          onTap: controller.skipOnTap,
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.only(right: Sizes.size10),
              child: Text(
                controller.myTags.isNotEmpty ? "Next" : "Skip",
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: Sizes.size16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
