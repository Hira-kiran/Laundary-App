// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:internshippractice/API%20forms/signup.dart';

import 'screens/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 80,
                      ),
                      child: Text(
                        "Brand Name",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("images/logo.png"),
                        ))
                  ],
                ),
              ),
              const Divider(
                height: 60,
                indent: 40,
                endIndent: 40,
                color: Color.fromARGB(255, 111, 110, 110),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 50, top: 90),
                child: Text(
                  "Some text of\n your choice",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Container(
                  height: 60,
                  width: 260,
                  child: const Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 60,
                    width: 260,
                    child: const Center(
                        child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
