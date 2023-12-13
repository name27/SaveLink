import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:link_note_app/constants/design/gaps.dart';
import 'package:link_note_app/constants/design/sizes.dart';

class LinkTitleTile extends StatelessWidget {
  const LinkTitleTile({
    super.key,
    this.image,
    this.title = "",
    this.linkslength,
    this.moreOnTap,
    this.contentOnTap,
    this.trailing,
  });
  final String? image;
  final String title;
  final int? linkslength;
  final void Function()? moreOnTap;
  final void Function()? contentOnTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: contentOnTap,
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.size10),
                    child: image != null
                        ? CachedNetworkImage(
                            imageUrl: image!,
                            fit: BoxFit.cover,
                            width: Sizes.size80,
                            height: Sizes.size80,
                            placeholder: (context, url) => Container(
                              width: Sizes.size80,
                              height: Sizes.size80,
                              color: Colors.black,
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )
                        : Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            width: Sizes.size80,
                            height: Sizes.size80,
                          ),
                  ),
                  Gaps.h16,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: Sizes.size16 + Sizes.size2),
                        ),
                        Gaps.v10,
                        linkslength != null
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.noteSticky,
                                    size: Sizes.size16,
                                  ),
                                  Gaps.h6,
                                  Text(
                                    linkslength.toString(),
                                    style:
                                        const TextStyle(fontSize: Sizes.size16),
                                  ),
                                ],
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Gaps.h5,
        GestureDetector(
          onTap: moreOnTap,
          child: trailing ?? const Icon(Icons.more_vert_outlined),
        ),
      ],
    );
  }
}
