import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Link {
  String tag;
  String link;
  String title;
  String? image;
  Link({
    required this.tag,
    required this.link,
    required this.title,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tag': tag,
      'link': link,
      'title': title,
      'image': image,
    };
  }

  factory Link.fromMap(Map<String, dynamic> map) {
    return Link(
      tag: map['tag'] as String,
      link: map['link'] as String,
      title: map['title'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Link.fromJson(String source) =>
      Link.fromMap(json.decode(source) as Map<String, dynamic>);
}
