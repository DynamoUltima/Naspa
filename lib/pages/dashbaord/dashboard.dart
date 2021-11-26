// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:naspa/models/service.dart';
import 'package:naspa/pages/home/history.dart';
import 'package:naspa/pages/home/home.dart';
import 'package:naspa/pages/home/settings.dart';
import 'package:naspa/pages/service-detail-page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    History(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "NASPA-AUTO", //replace with logo
          style: TextStyle(color: Colors.indigo[700]),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notification_add_outlined,
                color: Colors.indigo[700],
              ))
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),


      bottomNavigationBar: BottomNavigationBar(
        elevation: 15,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.horizontal_split),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
         
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[300],
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        onTap: _onItemTapped,
      ),
    );
  }
}
