import 'package:flutter/material.dart';
import 'package:naspa/pages/dashbaord/dashboard.dart';
import 'package:naspa/shared/constant.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String _email;
  late String _password;
  late String _firstName;
  late String _lastName;
  late String _phoneNumber;
  bool loading = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String src =
      "https://i.pinimg.com/564x/74/16/a8/7416a803c1e946983e4abeef009a0ebf.jpg";
  @override
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
                      "Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                    ),
                    _buildFirstName(),
                    _buildLastName(),
                    _buildEmail(),
                    _buildPassword(),
                    signupButton()
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Padding _buildEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
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
          labelText: 'Email Address',
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
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
    );
  }

  RaisedButton signupButton() {
    return RaisedButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      onPressed: () async {
        // if (_formkey.currentState!.validate()) {
        //   setState(() => loading = true);
        //   //NewsFeedPage()//PostProfile()
        // }
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Dashboard()));
      },
      color: Colors.teal[400],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: TextFormField(
        decoration: TextDecoration.copyWith(
          labelText: "Phone Number",
          isDense: true,
          labelStyle: TextStyle(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
        keyboardType: TextInputType.phone,
        validator: (val) {
          if (val!.isEmpty) {
            return "Enter Last Name";
          }
          return null;
        },
        onChanged: (val) {
          setState(() {
            _phoneNumber = val;
          });
        },
      ),
    );
  }

  Widget _buildFirstName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        decoration: TextDecoration.copyWith(
          labelText: "FirstName",
          isDense: true,
          labelStyle: TextStyle(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
        keyboardType: TextInputType.text,
        validator: (val) {
          if (val!.isEmpty) {
            return "Enter First Name";
          }
          return null;
        },
        onChanged: (val) {
          setState(() {
            _firstName = val;
          });
        },
      ),
    );
  }

  Widget _buildLastName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.text,
        decoration: TextDecoration.copyWith(
          labelText: "Last Name",
          isDense: true,
          labelStyle: TextStyle(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return "Enter Last Name";
          }
          return null;
        },
        onChanged: (val) {
          setState(() {
            _lastName = val;
          });
        },
      ),
    );
  }
}
