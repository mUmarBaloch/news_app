import 'package:flutter/foundation.dart';

class News {
  final String? title;
  final String? description;

  factory News.fromJson(Map<String, dynamic> map) =>
      News(title: map['title'], description: map['description']);

  News({@required this.title, @required this.description});
}
