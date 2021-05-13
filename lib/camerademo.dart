import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(home: CameraDemo()));
}

class CameraDemo extends StatefulWidget {
  CameraDemo({Key key}) : super(key: key);

  @override
  _CameraDemoState createState() => _CameraDemoState();
}

class _CameraDemoState extends State<CameraDemo> {
  File _image;
  final picker = ImagePicker();
  String base64Image = '';
  /*
  * val = camera || gallery
  */
  Future getImage(String val) async {
    final pickedFile = await picker.getImage(
        source: val == 'camera' ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 100);

    setState(() {
      if (pickedFile != null) {
        _image = new File(pickedFile.path);

        List<int> imageBytes = _image.readAsBytesSync();
        base64Image = base64.encode(imageBytes);
        debugPrint(base64Image);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Upload Image"),
        backgroundColor: Colors.red[400],
      ),
      body: new Builder(
        builder: (BuildContext context) {
          return Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.red[400],
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      'Gallery',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () => {getImage('gallery')}),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.red[400],
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      'Photo',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () => {getImage('camera')}),
                SizedBox(
                  height: 200.0,
                  width: 300.0,
                  child: _image == null
                      ? Center(child: new Text('Sorry nothing selected!!'))
                      : Center(child: new Image.file(_image)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
