import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepOrange,
      leading: const Icon(Icons.arrow_back),
      title: Text('$title'),
      centerTitle: true,
      elevation: 0,
    );
  }
}
