// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:naspa/pages/auth/signup.dart';
import 'package:naspa/pages/dashbaord/dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String _email;
  late String _password;
  bool loading = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String src =
      "https://www.shell.ca/en_ca/motorists/shell-canada-car-wash/_jcr_content/par/pageHeader/image.img.960.jpeg/1514941379206/27696-bnr-p5-cw-1900x1200-new.jpeg?imformat=chrome&imwidth=1280";
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          child: ListView(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  // ignore: prefer_const_constructors
                  // decoration: BoxDecoration(
                  //   color: Colors.blue,
                  //   borderRadius: BorderRadius.only(
                  //    bottomRight: Radius.circular(40.0),
                  //     bottomLeft: Radius.circular(40.0),
                  //   ),
                  // ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0),
                    ),
                    child: Image.network(
                      src,
                      fit: BoxFit.cover,
                      isAntiAlias: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 34),
                      ),
                      _buildNumber(),
                      _buildPassword(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      loginButton(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Do you have an account"),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton loginButton() {
    return RaisedButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(25.0),
      ),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Dashboard()));
        // if (_formkey.currentState!.validate()) {
        //   setState(() => loading = true);
        //   //NewsFeedPage()//PostProfile()
        // }
      },
      color: Colors.teal[400],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'LOGIN',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Padding _buildNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        onChanged: (val) {
          setState(() {
            _email = val;
          });
        },
        validator: (val) {
          String pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(val!)) {
            return "Enter Valid Email";
          }
          return null;
        },
        decoration: InputDecoration(
          isDense: true,
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        onChanged: (val) {
          setState(() {
            _password = val;
          });
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "Enter password";
          }
          return null;
        },
        decoration: InputDecoration(
            isDense: true,
            labelStyle: TextStyle(),
            labelText: 'Password',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)))),
      ),
    );
  }
}
