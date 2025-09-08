
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class Login extends StatefulWidget{
  const Login({super.key});
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login>{

  createLogo(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.build, color: Colors.red, size: 50,),
          Text("BILDR", style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),)
        ]
    );
  }
  createTextBox(size, String text, double textSize){
    return Container(
      width: size.width/1.4,
      margin: EdgeInsets.only(top: 10, left: 10),
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Text(text, style: TextStyle(fontSize: textSize)),
    );
  }

  pressedButtoon(){
    print("Hello");
  }
  createContainer(size){
    return Container(
      height: size.height/2,
      width: size.width/1.2,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sign In", style: TextStyle(color: Colors.black,
            fontSize: 36, fontWeight: FontWeight.bold),),
          createTextBox(size, "Email / Phone number", 24),
          createTextBox(size, "Password", 24),
          TextButton(onPressed: pressedButtoon,
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                ),
              child: Text("Sign In")
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          createLogo(),
          createContainer(size),
        ],
      ),
    );
  }
}