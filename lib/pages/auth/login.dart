// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String src =
      "https://www.shell.ca/en_ca/motorists/shell-canada-car-wash/_jcr_content/par/pageHeader/image.img.960.jpeg/1514941379206/27696-bnr-p5-cw-1900x1200-new.jpeg?imformat=chrome&imwidth=1280";
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                // ignore: prefer_const_constructors
                // decoration: BoxDecoration(
                //   color: Colors.blue,
                //   borderRadius: BorderRadius.only(
                //    bottomRight: Radius.circular(40.0),
                //     bottomLeft: Radius.circular(40.0),
                //   ),
                // ),
                child: ClipRRect(
                  borderRadius:  BorderRadius.only(
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
                    Text("Login",style: TextStyle(),),

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
