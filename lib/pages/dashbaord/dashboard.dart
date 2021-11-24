// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:naspa/models/service.dart';
import 'package:naspa/pages/service-detail-page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    List<Service> serviceTabs = [
      Service(
        title: "Car Wash",
        imageAssets: "assets/images/car-wash.jpg",
        subText: "Affordable",
      ),
      Service(
        title: "Quick Lube",
        imageAssets: "assets/images/limo.jpeg",
        subText: "Affordable",
      ),
      Service(
        title: "Tow Me",
        imageAssets: "assets/images/car-towing.jpg",
        subText: "Affordable",
      ),
      Service(
        title: "Extras",
        imageAssets: "assets/images/limo.jpeg",
        subText: "Affordable",
      ),
    ];

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
      body: Container(
          child: ListView(
        children: [
          Container(
            height: 230,
            child: Card(
              color: Colors.white70,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(16),
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/car.jpeg"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "KA-05-EH-065",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Vehicle Servicng",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Service Status",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(Icons.car_repair_outlined),
                                  Text("Way To Customer")
                                ],
                              )
                            ],
                          ),
                          Center(
                            child: SizedBox(
                              height: 60,
                              child: VerticalDivider(
                                  thickness: 2, color: Colors.indigo[700]),
                            ),
                          ),
                          Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Estimated time to drops",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.teal[600],
                                  fontSize: 14,
                                ),
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(Icons.calendar_today_outlined),
                                  Text(
                                    "12th Feb 2020",
                                    style: TextStyle(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            // height: 300,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: serviceTabs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return gridContainerMethod(serviceTabs[index].title,
                    serviceTabs[index].imageAssets, serviceTabs[index].subText);
              },
            ),
          )
        ],
      )),
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person_add_alt_1_outlined),
          //   label: 'Accounts',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[300],
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        onTap: _onItemTapped,
      ),
    );
  }

  Container gridContainerMethod(
      String title, String imageAssets, String subText) {
    return Container(
      // height: 230,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ServiceDetailPage()));
        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(16),
          elevation: 7,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageAssets),
                fit: BoxFit.fitHeight,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.teal[400],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(""),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       IconButton(onPressed: (){}, icon :CircleAvatar(
                //         backgroundColor: Colors.indigo[700],
                //         child: Icon(Icons.arrow_right_alt_sharp,color: Colors.white,)))
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
