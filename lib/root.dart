import 'package:flutter/material.dart';
import 'package:tflite_image_classification/TfliteModel.dart';
import 'package:tflite_image_classification/page/favorite_page.dart';
import 'constant.dart';
import 'package:tflite_image_classification/page/home.dart';
import 'package:tflite_image_classification/page/detail_page.dart';
import 'package:tflite_image_classification/page/profile_page.dart';
import 'package:tflite_image_classification/page/setting.dart';

import 'models/plants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Plant> favorites = [];
  int currentTab = 0;
  final List<Widget> screen = [
    Dashboard(),
    TfliteModel(),
    ProfilePage(),
    Setting()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Constants.primaryColor,
          child: Icon(Icons.qr_code_scanner),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TfliteModel()),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = Dashboard();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentTab == 0
                            ? Constants.primaryColor
                            : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: currentTab == 0
                              ? Constants.primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = FavoritePage(
                        favoritedPlants: favorites,
                      );
                      final List<Plant> favoritedPlants =
                          Plant.getFavoritedPlants();
                      favorites = favoritedPlants;
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: currentTab == 1
                            ? Constants.primaryColor
                            : Colors.grey,
                      ),
                      Text(
                        'Favorite',
                        style: TextStyle(
                          color: currentTab == 1
                              ? Constants.primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Setting();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 2
                              ? Constants.primaryColor
                              : Colors.grey,
                        ),
                        Text(
                          'Setting',
                          style: TextStyle(
                            color: currentTab == 2
                                ? Constants.primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfilePage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 3
                              ? Constants.primaryColor
                              : Colors.grey,
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                            color: currentTab == 3
                                ? Constants.primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
