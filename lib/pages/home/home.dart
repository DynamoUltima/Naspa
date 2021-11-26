import 'package:flutter/material.dart';
import 'package:naspa/models/service.dart';
import 'package:naspa/pages/service-detail-page.dart';
import 'package:naspa/shared/carousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          CarouselWidget(),
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
                return gridContainerMethod(
                  serviceTabs[index].title,
                  serviceTabs[index].imageAssets,
                  serviceTabs[index].subText,
                );
              },
            ),
          )
        ],
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
                colorFilter: ColorFilter.mode(
                  Colors.white54,
                  BlendMode.overlay,
                ),
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
