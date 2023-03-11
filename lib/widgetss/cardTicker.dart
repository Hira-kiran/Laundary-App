// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardW extends StatelessWidget {
  String leading;

  String title1;
  String title2;
  String title3;

  CardW({
    super.key,
    required this.leading,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(
          leading,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 140),
              child: Text(
                title1,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                const Icon(Icons.person),
                Text(
                  title2,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.call),
                Text(title3),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
        trailing: const Icon(
          Icons.print,
          size: 30,
        ),
      ),
    );
  }
}
