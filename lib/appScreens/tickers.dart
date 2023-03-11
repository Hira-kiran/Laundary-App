import 'package:flutter/material.dart';
import '../Constants/colors.dart';
import '../widgetss/cardTicker.dart';

class TickerPage extends StatelessWidget {
  const TickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: pinkColor,
        centerTitle: true,
        title: const Text("Recently Sold Lotteries"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: CardW(
              leading: "523",
              title1: "2022-4-10",
              title2: "Hira kiran",
              title3: "62378",
            ),
          ),
          CardW(
            leading: "453",
            title1: "2022-5-7",
            title2: "Misbah",
            title3: "1767",
          ),
          CardW(
            leading: "903",
            title1: "2022-8-10",
            title2: "Maria",
            title3: "1122",
          )
        ],
      ),
    );
  }
}
