import 'package:flutter/material.dart';

class DemoClass1 extends StatefulWidget{
  const DemoClass1({super.key});
  @override
  State<StatefulWidget> createState() {
    return DemoClass1State();
  }
}

class DemoClass1State extends State<DemoClass1> {

  demofunc(size, String title){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: size.height/5,
          width: size.width/2,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.people, color: Colors.white, size: 50,),
              Text("Demo PCPS", style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold, fontSize: 15),)
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          demofunc(size, "Row1"),
          SizedBox(
            height: 10,
          ),
          demofunc(size, "Row2"),
          SizedBox(
            height: 10,
          ),
          demofunc(size, "Row3"),
        ],
      ),
    );
  }
}