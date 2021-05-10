import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PassData(),
  ));
}

class PassData extends StatelessWidget {
  PassData({Key key}) : super(key: key);
  Map data = {};
  @override
  Widget build(BuildContext context) {
    // Get previous page data
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
        appBar: AppBar(
            title: Text('Home'),
            centerTitle: true,
            backgroundColor: Colors.red[400]),
        body: new Center(
          child: Text("Name:- ${data['name']} \nCountry:- ${data['country']} ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ));
  }
}
