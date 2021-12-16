import 'package:flutter/material.dart';

class ListDesign extends StatefulWidget {
  ListDesign({Key key}) : super(key: key);

  @override
  _ListDesignState createState() => _ListDesignState();
}

class _ListDesignState extends State<ListDesign> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Item List"),
          backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        ),
        body: ListView(children: <Widget>[
          Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  height: 100.0,
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                    border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24),
                    ),
                  ),
                  child: Icon(Icons.autorenew, color: Colors.white),
                ),
                title: Text(
                  "Reversing around the corner",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: LinearProgressIndicator(
                          backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                          value: 0.95,
                          valueColor: AlwaysStoppedAnimation(Colors.green),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Advanced",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.white, size: 30.0),
                onTap: () {
                  print('Click');
                },
              ),
            ),
          ),
          Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  height: 100.0,
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                    border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24),
                    ),
                  ),
                  child: Icon(Icons.autorenew, color: Colors.white),
                ),
                title: Text(
                  "Reversing around the corner",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: LinearProgressIndicator(
                          backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                          value: 0.33,
                          valueColor: AlwaysStoppedAnimation(Colors.green),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Advanced",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.white, size: 30.0),
                onTap: () {
                  print('Click');
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
