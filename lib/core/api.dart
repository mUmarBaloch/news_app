import 'dart:convert';
import 'package:news_app/models/news_model.dart';
import 'package:http/http.dart' as http;

import 'data.dart';

Future<List<News>> httpRequest(search) async {
  var response = await http.get(Uri.parse(
      'http://api.mediastack.com/v1/news?access_key=${accessKey}&languages=en&keywords=$search'));
  print(response.body);
  List body = json.decode(response.body)['data'];
  List<News> result = body.map((e) => News.fromJson(e)).toList();
  return result;
}
