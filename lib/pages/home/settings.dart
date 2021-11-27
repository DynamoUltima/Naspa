import 'package:flutter/material.dart';
import 'package:naspa/pages/auth/login.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            // leading: CircleAvatar(
            //   backgroundColor: Colors.indigo[700],
            //   foregroundImage: AssetImage("assets/images/limo.jpeg"),
            // ),
            title: Text("Car Details"),
            // subtitle: Text("17th November 2020"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            // leading: CircleAvatar(
            //   backgroundColor: Colors.indigo[700],
            //   foregroundImage: AssetImage("assets/images/limo.jpeg"),
            // ),
            title: Text("User Details"),
            // subtitle: Text("17th November 2020"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            // leading: CircleAvatar(
            //   backgroundColor: Colors.indigo[700],
            //   foregroundImage: AssetImage("assets/images/limo.jpeg"),
            // ),
            title: Text("Payment Details"),
            // subtitle: Text("17th November 2020"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo[700],
              foregroundImage: AssetImage("assets/images/limo.jpeg"),
            ),
            title: Text("Logout"),
            // subtitle: Text("17th November 2020"),
            // trailing: Text("BMW"),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
          Divider()
        ],
      ),
    );
  }
}
