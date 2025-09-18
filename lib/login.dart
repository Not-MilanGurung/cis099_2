import 'package:flutter/material.dart';
import 'dart:core';

import 'package:my_app/dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  static const titleSize = 80.0;
  static const heading2 = 56.0;
  static const textSize = 16.0;
  static bool? rememberMe = false;
  createLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.build, color: Colors.red, size: titleSize),
        Text(
          "BILDR",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: titleSize,
          ),
        ),
      ],
    );
  }

  createTextBox(width, height, String text, double textSize) {
    return Container(
      alignment: Alignment.centerLeft,
      width: width,
      height: height,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Text(text, style: TextStyle(fontSize: textSize)),
      ),
    );
  }

  createContainer(size) {
    var containerWidth = size.width / 1.2;

    return Container(
      height: size.height / 2,
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: heading2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: createTextBox(
                containerWidth,
                36.0,
                "Email / Phone number",
                textSize,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: createTextBox(containerWidth, 36.0, "Password", textSize),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: rememberMe,
                  activeColor: Colors.red,
                  visualDensity: VisualDensity(horizontal: -4.0),
                  onChanged: (bool? newValue) {
                    setState(() {
                      rememberMe = newValue;
                    });
                  },
                ),
                Text("Remember me", style: TextStyle(fontSize: textSize)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      print("Forgot password");
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: textSize, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(builder: (context) => Dashboard()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(containerWidth, 0.0),
                ),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: textSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: textSize),
                  ),
                  TextButton(
                    onPressed: () {
                      print("SignUP");
                    },
                    style: TextButton.styleFrom(
                      fixedSize: Size(0.0, 0.0),
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      minimumSize: Size(containerWidth, 36.0),
                    ),
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: textSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [createLogo(), createContainer(size)],
      ),
    );
  }
}
