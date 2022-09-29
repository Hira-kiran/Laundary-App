// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:internshippractice/screens/signup.dart';
import 'package:internshippractice/screens/wlcm.dart';

import 'package:internshippractice/services/auth_services.dart';
import '../Modelss/loginModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = false;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthServices authServices = AuthServices();
  FormModel formModel = FormModel();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 270),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/logo.png"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Let's get started?",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              //*********** */ For Email
              Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 60, bottom: 10),
                      child: TextFormField(
                        controller: nameController,
                        cursorColor: Colors.pink,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            hintText: "Email",
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.pink),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                    //*************For Password
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 10),
                      child: TextFormField(
                        controller: passwordController,
                        cursorColor: Colors.pink,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.pink),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Password",
                          filled: true,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.pink.withOpacity(0.5),
                              )),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 185, top: 5),
                child: Text(
                  "Forget Password?",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: InkWell(
                  onTap: () {
                    loading = loading;
                    setState(() {
                      loading = true;
                    });

                    if (formkey.currentState!.validate()) {
                      loading = false;
                      AuthServices.Login(nameController.text.trim(),
                              passwordController.text.trim())
                          .then((value) {
                        formModel.username == "admin"
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WelcomeScreen()))
                            : print(formModel.username);
                      });
                      /*   .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const WelcomeScreen()))); */
                    } else {
                      print("Failed");
                      loading = false;
                    }
                  },
                  child: Container(
                      height: 65,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: loading
                              ? const CircularProgressIndicator(
                                  color: Color.fromARGB(255, 54, 52, 52),
                                  strokeWidth: 5,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ))),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 240, left: 75),
            child: Row(
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: const Text(
                    " Signup",
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        // decoration: TextDecoration.underline,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
