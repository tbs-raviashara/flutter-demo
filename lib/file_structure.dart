import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileStructure extends StatefulWidget {
  FileStructure({Key key}) : super(key: key);

  @override
  _FileStructureState createState() => _FileStructureState();
}

class _FileStructureState extends State<FileStructure> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("File"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: ElevatedButton(
            onPressed: () async {
              await callFolderCreationMethod('Flutter Demo');
            },
            child: new Text(
              'Create Folder',
            ),
          ),
        ),
      ),  
    );
  }

  callFolderCreationMethod(String folderInAppDocDir) async {
    String actualFileName = await folderCreate(folderInAppDocDir);
    print(actualFileName);
  }

  folderCreate(String folderName) async {
    final Directory _appDocDir =
        await getExternalStorageDirectory(); //Get this App External Storage Directory

    final Directory _appDocDirFolder = Directory(
        '${_appDocDir.path}/$folderName/'); //App External Storage Directory + folder name

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }
}
