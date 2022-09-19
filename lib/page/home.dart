import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tflite_image_classification/constant.dart';
import 'package:tflite_image_classification/widgets/app_large_text.dart';
import 'package:tflite_image_classification/models/plants.dart';

import 'detail_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  List<Plant> _plantList = Plant.plantList;
  List ag1 = [
    "coveraglaonema1.jpeg",
    "coveraglaonema2.jpeg",
    "coveraglaonema3.jpg"
  ];
  var aglaonema = {
    "coveraglaonema1.jpeg": "Aglonema 1",
    "coveraglaonema2.jpeg": "Aglonema 2",
    "coveraglaonema3.jpg": "Aglonema 3"
  };
  var philodendrom = {
    "coverphilo1.jpeg": "Philodendron 1",
    "coverphilo2.jpeg": "Philodendron 2",
    "coverphilo3.jpeg": "Philodendron 3"
  };
  var syngonium = {
    "coversyngo1.jpg": "Syngonium 1",
    "coversyngo2.jpeg": "Syngonium 2",
    "coversyngo3.jpeg": "Syngonium 3"
  };
  var images2 = {
    "200bigroy.jpg": "Big Roy",
    "200donacarmen.jpeg": "Dona Carmen",
    "200snowwhite.jpg": "Snow White",
    "200sunset.jpeg": "Sunset"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(color: Constants.primaryColor, width: 2.0),
                  ),
                  tabs: [
                    Tab(text: "Aglaonema"),
                    Tab(text: "Philodendron"),
                    Tab(text: "Syngonium"),
                  ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: _tabController, children: [
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                plantId: 0,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("assets/images/" + ag1[index]),
                              fit: BoxFit.cover)),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                plantId: 1,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("assets/images/" +
                                  philodendrom.keys.elementAt(index)),
                              fit: BoxFit.cover)),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                plantId: 2,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("assets/images/" +
                                  syngonium.keys.elementAt(index)),
                              fit: BoxFit.cover)),
                    ),
                  );
                },
              ),
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore more",
                  size: 22,
                ),
                Text("See all")
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          // margin: const EdgeInsets.only(right: 50),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/" +
                                      images2.keys.elementAt(index)),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(images2.values.elementAt(index)),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
