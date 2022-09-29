// ignore_for_file: file_names, sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hiddePassword = true;
  bool hiddeForgetPassword = true;
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        // height: 812,
        /*  decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/backgroundimg.jpg"),
                fit: BoxFit.cover)), */
        child: Column(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60, left: 270),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("images/logo.png"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Join us now!",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          const BorderSide(color: Colors.pink),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    hintText: "User Name",
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter username';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            //**********For Phone
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          const BorderSide(color: Colors.pink),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    hintText: "Phone",
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      color: Colors.grey,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Phone number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            //*********** */ For Email
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          const BorderSide(color: Colors.pink),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    hintText: "Email",
                                    // labelText: "Email",

                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.grey,
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
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: TextFormField(
                                obscureText: hiddePassword,
                                decoration: InputDecoration(
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          const BorderSide(color: Colors.pink),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    hintText: "Password",
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hiddePassword = !hiddePassword;
                                        });
                                      },
                                      icon: Icon(
                                        hiddePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.pink.withOpacity(0.54),
                                      ),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: TextFormField(
                                obscureText: hiddeForgetPassword,
                                decoration: InputDecoration(
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          const BorderSide(color: Colors.pink),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    hintText: "Confirm Password",
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          hiddeForgetPassword =
                                              !hiddeForgetPassword;
                                        });
                                      },
                                      icon: Icon(
                                        hiddePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.pink.withOpacity(0.54),
                                      ),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Confirm your password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    child: Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          "Signup",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 95, left: 50),
              child: Row(
                children: [
                  const Text(
                    "Already have an account?",
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
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      " Login",
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
