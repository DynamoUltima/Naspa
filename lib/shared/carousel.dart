import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  List<Widget> carouselCards = [
    Container(
      //  height: 230,
      child: Card(
        
        color: Colors.teal[300],
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(16),
        elevation: 10,
        child: Container(
         
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
                        color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Toyota",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 28,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
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
                              color: Colors.white),
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(Icons.car_repair_outlined,
                                color: Colors.white),
                            Text(
                              "Way To Customer",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        height: 60,
                        child:
                            VerticalDivider(thickness: 2, color: Colors.white),
                      ),
                    ),
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Estimated time ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Icon(Icons.calendar_today_outlined,
                                color: Colors.white),
                            Text(
                              "12th Feb 2020",
                              style: TextStyle(color: Colors.white),
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
      height: 230,
      child: Card(
        color: Colors.teal[300],
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(8),
        elevation: 10,
        child: Container(
          // decoration: BoxDecoration(

          //   image: DecorationImage(
          //     colorFilter:ColorFilter.mode(Colors.white70,BlendMode.overlay,),
          //     image: AssetImage("assets/images/car.jpeg"),
          //     fit: BoxFit.fitWidth,
          //     alignment: Alignment.topCenter,
          //   ),
          // ),
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
                        color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "BMW",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 28,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Service Status",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(Icons.car_repair_outlined,
                                  color: Colors.white),
                              Text(
                                "Way To Customer",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      
                      child: Center(
                        child: SizedBox(
                          height: 60,
                          child:
                              VerticalDivider(thickness: 1, color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      flex:4,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Estimated time ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(Icons.calendar_today_outlined,
                                  color: Colors.white),
                              Text(
                                "12th Feb 2020",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
      ),
      items: carouselCards.map((item) => item).toList(),
    );
  }
}
