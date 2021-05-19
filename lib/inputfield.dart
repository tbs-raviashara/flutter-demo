import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: InputDemo()));
}

class InputDemo extends StatefulWidget {
  InputDemo({Key key}) : super(key: key);

  @override
  _InputDemoState createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Input Demo'),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                  child: Column(children: <Widget>[
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                      hintText: 'Enter First Name'),
                  obscureText: false,
                  style: TextStyle(color: Colors.black87, fontSize: 20),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 15),
                TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                          size: 14,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                        hintText: 'Enter E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                    textInputAction: TextInputAction.next),
                SizedBox(height: 15),
                TextField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 14,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(),
                      labelText: 'Contact Number',
                      hintText: 'Enter Contact nNumber'),
                  obscureText: false,
                  style: TextStyle(color: Colors.black87, fontSize: 20),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.url,
                  autofocus: true,
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(),
                      labelText: 'Web Site',
                      hintText: 'Enter Web URL'),
                  obscureText: false,
                  style: TextStyle(color: Colors.black87, fontSize: 20),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 15),
                TextField(
                    keyboardType: TextInputType.streetAddress,
                    autofocus: true,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(),
                        labelText: 'Address',
                        hintText: 'Enter Address'),
                    maxLines: 5,
                    obscureText: false,
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                    textInputAction: TextInputAction.newline),
                SizedBox(height: 15),
                TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        child: Icon(
                          _showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                          size: 14,
                        ),
                      ),
                    ),
                    obscureText: _showPassword,
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                    textInputAction: TextInputAction.send),
              ])))),
    ));
  }
}
