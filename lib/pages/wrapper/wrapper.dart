import 'package:flutter/material.dart';
import 'package:naspa/pages/auth/login.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:const Login() ,
      ),
      
    );
  }
}