import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/api.dart';
import 'package:news_app/core/data.dart';
import 'package:news_app/models/news_model.dart';

class NewsListPage extends StatelessWidget {
  final List<String> images = ['bg', 'bg2', 'bg3', 'bg4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(87, 8, 97, 100),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'lib/assets/${images[Random.secure().nextInt(images.length)]}.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        title: Text('Top news for $search'),
      ),
      body: FutureBuilder<List<News>>(
          future: httpRequest(search),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, news) =>
                    newsCard(snapshot.data![news], context));
          }),
    );
  }

  Card newsCard(News news, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          news.title.toString(),
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        subtitle: Text(news.description.toString()),
      ),
    );
  }
}
