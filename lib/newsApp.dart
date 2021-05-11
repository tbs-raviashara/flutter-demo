import 'package:demo/components/customListTile.dart';
import 'package:demo/model/article_model.dart';
import 'package:demo/servicrs/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: NewsApp()));
}

class NewsApp extends StatefulWidget {
  NewsApp({Key key}) : super(key: key);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          centerTitle: true,
          title: Text('News List'),
        ),
        body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data;
              return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      customListTile(articles[index], context));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
