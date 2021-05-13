import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Home'),
            centerTitle: true,
            backgroundColor: Colors.red[400]),
        body: new Center(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/list')},
            child: new Text(
              'List View With Pull To Refresh',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/lite-roling')},
            child: new Text(
              'Lite Roling',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/group-list')},
            child: new Text(
              'Group List',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/second')},
            child: new Text(
              'Slidable List',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/rating')},
            child: new Text(
              'Rating',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/story')},
            child: new Text(
              'Story View',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/feature')},
            child: new Text(
              'Feature Discovery',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/google-login')},
            child: new Text(
              'Google Login',
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/pass-data', arguments: {
                "name": 'Ravi Ashara',
                "country": 'India',
              })
            },
            child: new Text(
              'Pass Data',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/device-info')},
            child: new Text(
              'Device Info',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/carouser-list')},
            child: new Text(
              'Carousel Slider ',
            ),
          ),
          ElevatedButton(
            onPressed: openUser,
            child: new Text(
              'Launch Url ',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/google-map')},
            child: new Text(
              'Google Map ',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/news')},
            child: new Text(
              'News App',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/camera')},
            child: new Text(
              'Upload Image',
            ),
          ),
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/dialog')},
            child: new Text(
              'Awesome Dialogs',
            ),
          ),
        ]))));
  }

  openUser() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
