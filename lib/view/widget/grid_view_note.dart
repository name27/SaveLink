import 'package:flutter/material.dart';
import 'package:link_note_app/constants/design/colors.dart';
import 'package:link_note_app/constants/design/sizes.dart';
import 'package:link_note_app/constants/photos.dart';

class GridViewNote extends StatelessWidget {
  const GridViewNote({
    super.key,
    required this.myTags,
  });
  final List<String> myTags;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: myTags.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: Sizes.size10,
          crossAxisSpacing: Sizes.size10,
          childAspectRatio: 9 / 12),
      itemBuilder: (context, index) => Container(
        decoration: const BoxDecoration(color: MyColors.primary),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: Image.network(
              Photos.photoUrl[index],
              fit: BoxFit.cover,
            )),
            Text('$index'),
          ],
        ),
      ),
    );
  }
}
