import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:link_note_app/constants/design/colors.dart';
import 'package:link_note_app/constants/design/sizes.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet(
      {super.key,
      this.footerOnTap,
      this.headerOnTap,
      this.headerText,
      this.headerIcon,
      this.footerText,
      this.footerIcon});
  final void Function()? footerOnTap;
  final void Function()? headerOnTap;
  final String? headerText;
  final Widget? headerIcon;
  final String? footerText;
  final Widget? footerIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: headerOnTap,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size10,
                    horizontal: Sizes.size32,
                  ),
                  child: Text(
                    headerText ?? '제목 변경',
                    style: const TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child:
                      headerIcon ?? const FaIcon(FontAwesomeIcons.penToSquare),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: Sizes.size10),
            child: Divider(
              color: MyColors.lightGrey,
              thickness: 0.3,
            ),
          ),
          GestureDetector(
            onTap: footerOnTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size10,
                    horizontal: Sizes.size32,
                  ),
                  child: Text(
                    footerText ?? '삭제 하기',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: footerIcon ??
                      const FaIcon(
                        FontAwesomeIcons.trashCan,
                        color: Colors.red,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
