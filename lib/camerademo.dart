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
  Future getImageFromCamera() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 100);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 100);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //display image selected from gallery

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
                    onPressed: getImageFromGallery),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.red[400],
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      'Photo',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: getImageFromGallery),
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
