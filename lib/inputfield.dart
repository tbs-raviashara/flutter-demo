import 'package:demo/constants/constant.dart';
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
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController cnoController = new TextEditingController();
  TextEditingController weburlController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Input Demo'),
              centerTitle: true,
              backgroundColor: Colors.red[400],
            ),
            body: Form(
                key: _form,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                            child: Column(children: <Widget>[
                          // TextF
                          TextFormField(
                            validator: nameValidator,
                            autofocus: true,
                            controller: firstNameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'First Name',
                                hintText: 'Enter First Name'),
                            obscureText: false,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                              validator: emailValidator,
                              autofocus: true,
                              controller: emailController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                    size: 14,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  border: OutlineInputBorder(),
                                  labelText: 'E-mail',
                                  hintText: 'Enter E-mail'),
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              textInputAction: TextInputAction.next),
                          SizedBox(height: 15),
                          TextFormField(
                            validator: mobileValidator,
                            autofocus: true,
                            controller: cnoController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                  size: 14,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                border: OutlineInputBorder(),
                                labelText: 'Contact Number',
                                hintText: 'Enter Contact nNumber'),
                            maxLength: 10,
                            obscureText: false,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            validator: requiredValidator,
                            autofocus: true,
                            controller: weburlController,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                border: OutlineInputBorder(),
                                labelText: 'Web Site',
                                hintText: 'Enter Web URL'),
                            keyboardType: TextInputType.url,
                            obscureText: false,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                              validator: requiredValidator,
                              autofocus: true,
                              controller: addressController,
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  border: OutlineInputBorder(),
                                  labelText: 'Address',
                                  hintText: 'Enter Address'),
                              keyboardType: TextInputType.streetAddress,
                              maxLines: 5,
                              obscureText: false,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              textInputAction: TextInputAction.newline),
                          SizedBox(height: 15),
                          TextFormField(
                              validator: passwordValidator,
                              autofocus: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                                    size: 22,
                                  ),
                                ),
                              ),
                              obscureText: _showPassword,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              textInputAction: TextInputAction.send),
                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              final isValid = _form.currentState.validate();
                              if (!isValid) {
                                return false;
                              }
                              print(firstNameController.text);
                              print(emailController.text);
                              print(cnoController.text);
                              print(weburlController.text);
                              print(addressController.text);
                              print(passwordController.text);
                            },
                            child: new Text('Submit'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purple[400]),
                          )
                        ])))))));
  }
}
