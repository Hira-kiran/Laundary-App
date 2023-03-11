// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:internshippractice/Constants/colors.dart';

class TextformFieldW extends StatefulWidget {
  String hintText;
  Icon prefixIcon;
  String? validateText;
  TextEditingController controller;
  IconButton? suffixIcon;

  bool obscure;
  TextformFieldW(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      this.validateText,
      this.suffixIcon,
      this.obscure = false,
      required this.controller});

  @override
  State<TextformFieldW> createState() => _TextformFieldWState();
}

class _TextformFieldWState extends State<TextformFieldW> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        obscureText: widget.obscure,
        controller: widget.controller,
        decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: greyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: pinkColor),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon),
        validator: (value) {
          if (value!.isEmpty) {
            return widget.validateText;
          }
          return null;
        },
      ),
    );
  }
}
