import 'package:flutter/material.dart';
import 'package:link_note_app/constants/design/sizes.dart';

class DialogTextField extends StatelessWidget {
  const DialogTextField({
    super.key,
    required this.controller,
    this.leftText = "취소",
    this.rightText = "저장",
    this.hintText,
    this.leftOnTap,
    this.rightOnTap,
    this.headerText,
  });
  final TextEditingController controller;
  final String leftText;
  final String rightText;
  final String? hintText;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                ),
              ),
            ),
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
