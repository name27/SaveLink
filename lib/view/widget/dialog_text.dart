import 'package:flutter/material.dart';
import 'package:link_note_app/constants/design/sizes.dart';

class DialogText extends StatelessWidget {
  const DialogText({
    super.key,
    this.leftText = "취소",
    this.rightText = "확인",
    this.leftOnTap,
    this.rightOnTap,
    this.headerText,
  });
  final String leftText;
  final String rightText;
  final void Function()? leftOnTap;
  final void Function()? rightOnTap;
  final String? headerText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            headerText != null
                ? Text(
                    headerText!,
                    style: const TextStyle(fontSize: Sizes.size16),
                  )
                : const SizedBox(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: leftOnTap,
                  child: Text(
                    leftText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.size16,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: rightOnTap,
                  child: Text(
                    rightText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.size16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
