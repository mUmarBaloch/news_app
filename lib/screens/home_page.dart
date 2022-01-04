import 'package:flutter/material.dart';
import 'package:news_app/core/data.dart';
import 'package:news_app/screens/news_list_page.dart';

class HomePage extends StatelessWidget {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(87, 8, 97, 100),
            //   Colors.deepPurple,
            Color.fromRGBO(169, 18, 177, 100)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20,
            ),
            logoWidget(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(
                      controller: _textController,
                      style: TextStyle(fontSize: 18),
                      cursorWidth: 1,
                      cursorHeight: 22,
                      decoration: InputDecoration(
                        labelText: 'search',
                        border: InputBorder.none,
                      )),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsListPage()));
                      search = _textController.text;
                    },
                    icon: Icon(Icons.search),
                    color: Colors.white)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: null,
                child: Text(
                  'About us',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                )),
          ],
        ));
  }

  Column logoWidget() {
    return Column(
      children: [
        Text(
          'NEWSNOW',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            letterSpacing: 10,
          ),
        ),
        Icon(
          Icons.filter_list,
          size: 44,
          color: Colors.white,
        ),
      ],
    );
  }
}
