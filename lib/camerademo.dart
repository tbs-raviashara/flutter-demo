import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
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
      } else {
        print('No image selected.');
      }
    });
  }

  /*onImageButtonPressed(String source, capturedImageFile) async {
    final ImagePicker _picker = ImagePicker();
    File val;

    final pickedFile = await _picker.getImage(
      source: source == 'camera' ? ImageSource.camera : ImageSource.gallery,
    );

    print(pickedFile.path);

    val = await ImageCropper.cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      compressQuality: 100,
      compressFormat: ImageCompressFormat.jpg,
      androidUiSettings: AndroidUiSettings(
        toolbarColor: Colors.white,
        toolbarTitle: "genie cropper",
      ),
    );
    capturedImageFile(val.path);
  }*/

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
