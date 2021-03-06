// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        Card(
          elevation: 5,
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo[700],
              foregroundImage: AssetImage("assets/images/limo.jpeg"),
            ),
            title: Text("Quick Lube"),
            subtitle: Text("17th November 2020"),
            trailing: Text("BMW"),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ListTile(
                leading: Text("Paid"),
                trailing: Text("Completed"),
              )
            ],
            // onTap: () {},
          ),
        ),
        Card(
          elevation: 5,
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo[700],
              foregroundImage: AssetImage("assets/images/car-towing.jpg"),
            ),
            title: Text("Tow Me"),
            subtitle: Text("20th November 2020"),
            trailing: Text("BMW"),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ListTile(
                leading: Text("Paid"),
                trailing: Text("Pending"),
              )
            ],
            // onTap: () {},
          ),
        ),
        Card(
          elevation: 5,
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo[700],
              foregroundImage: AssetImage("assets/images/car-wash.jpg"),
            ),
            title: Text("Car Wash"),
            subtitle: Text("20th November 2020"),
            trailing: Text("BMW"),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ListTile(
                leading: Text("Paid"),
                trailing: Text("Completed"),
              )
            ],
            // onTap: () {},
          ),
        )
      ],
    ));
  }
}

/*
ListView(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        children: [
          Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo[700],
                foregroundImage: AssetImage("assets/images/limo.jpeg"),
              ),
              title: Text("Quick Lube"),
              subtitle: Text("17th November 2020"),
              trailing: Text("BMW"),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo[700],
                foregroundImage: AssetImage("assets/images/car-towing.jpg"),
              ),
              title: Text("Tow Me"),
              subtitle: Text("20th November 2020"),
              trailing: Text("BMW"),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo[700],
                foregroundImage: AssetImage("assets/images/car-wash.jpg"),
              ),
              title: Text("Car Wash"),
              subtitle: Text("25th November 2020"),
              trailing: Text("Toyota"),
              onTap: () {},
            ),
          )
        ],
      ),

*/
