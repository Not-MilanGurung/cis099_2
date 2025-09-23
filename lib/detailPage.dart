import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  verticalCard(size, heading, date, buttonText) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 100,
                width: 120,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Icons.play_circle, color: Colors.white, size: 40),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width / 2,
                child: Text(
                  heading,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: size.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        buttonText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Text(date, style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  headingCar(size) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: size.height / 3,
              width: size.width,
              decoration: BoxDecoration(color: Colors.green),
              child: Center(
                child: Icon(Icons.play_circle, color: Colors.white, size: 50),
              ),
            ),
            Positioned(
              left: 15,
              top: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back, color: Colors.white, size: 32),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                "This is Dashain at PCPS college and we are leaving for home."
                        "All the residents of KTM valley are hurrying to go home"
                    .toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Author Name"), Text("25th Sept 2025")],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                "This is Dashain at PCPS college and we are leaving for home."
                        "All the residents of KTM valley are hurrying to go home"
                    .toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                "This is Dashain at PCPS college and we are leaving for home."
                        "All the residents of KTM valley are hurrying to go home"
                    .toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                "This is Dashain at PCPS college and we are leaving for home."
                        "All the residents of KTM valley are hurrying to go home"
                    .toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 45),
              headingCar(size),
              verticalCard(
                size,
                "Today is holiday Today is sunday Today is sunday",
                "10th sept 2025",
                "Click here",
              ),
              verticalCard(
                size,
                "Today is sunday",
                "10th sept 2025",
                "Click here",
              ),
              verticalCard(
                size,
                "Today is monday",
                "10th sept 2025",
                "Click here",
              ),
              verticalCard(
                size,
                "Today is tuesday",
                "10th sept 2025",
                "Click here",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
