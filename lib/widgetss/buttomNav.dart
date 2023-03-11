// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internshippractice/Constants/colors.dart';
import 'package:internshippractice/appScreens/game.dart';
import 'package:internshippractice/appScreens/home.dart';
import 'package:internshippractice/appScreens/notification.dart';
import 'package:internshippractice/appScreens/profile.dart';
import 'package:internshippractice/appScreens/tickers.dart';

class MyNav extends StatefulWidget {
  const MyNav({Key? key}) : super(key: key);

  @override
  State<MyNav> createState() => _MyNavState();
}

class _MyNavState extends State<MyNav> {
  // final navigationkey=
  // GlobalKey<CurvedNavigationBar>;
  int index = 0;
  final screens = [
    const HomeScreen(),
    const GamePage(),
    const ProfilePage(),
    const NotificationPage(),
    const TickerPage()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        home: Scaffold(
          body: screens[index],
          bottomNavigationBar: CurvedNavigationBar(
            color: blackColor,
            buttonBackgroundColor: pinkColor,
            backgroundColor: blackColor,
            items: const [
              Icon(
                Icons.home,
                color: whiteColor,
              ),
              Icon(
                Icons.games,
                color: whiteColor,
              ),
              Icon(
                Icons.person,
                color: whiteColor,
              ),
              Icon(
                Icons.notifications,
                color: whiteColor,
              ),
              Icon(
                Icons.traffic,
                color: whiteColor,
              ),
            ],
            height: 60.h,
            index: index,
            onTap: ((index) => setState(() => this.index = index)),
          ),
        ));
  }
}
