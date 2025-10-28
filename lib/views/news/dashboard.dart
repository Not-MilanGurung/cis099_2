import 'package:flutter/material.dart';
import 'package:my_app/core/newsapi.dart';
import 'package:my_app/model/newsapi.dart';
import 'package:my_app/views/news/detailPage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<NewsApi?> futureNewsApiHorizontal;
  late Future<NewsApi?> futureNewsApiVertical;

  @override
  void initState() {
    super.initState();
    futureNewsApiHorizontal = NewsApiCall().getnewsdata('Tesla');
    futureNewsApiVertical = NewsApiCall().getnewsdata('Nepal');
  }

  horizontalCard(size, heading, date, String? imageURL) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => const DetailPage(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: size.height / 5,
            width: size.width / 1.5,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageURL ??
                    "https://thumbs.dreamstime.com/b/no-image-available-icon-isolated-dark-background-simple-vector-logo-no-image-available-icon-isolated-dark-background-275079095.jpg",
                fit: BoxFit.fill,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    // Appropriate logging or analytics, e.g.
                    // myAnalytics.recordError(
                    //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                    //   exception,
                    //   stackTrace,
                    // );
                    return Image.network(
                        "https://thumbs.dreamstime.com/b/no-image-available-icon-isolated-dark-background-simple-vector-logo-no-image-available-icon-isolated-dark-background-275079095.jpg",
                        fit: BoxFit.fill);
                  },
                opacity: const AlwaysStoppedAnimation(.7),
              ),
            ),
          ),
          Container(
            height: size.height / 5,
            width: size.width / 1.5,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [Colors.black, Colors.transparent],
              ),
            ),
          ),

          Positioned(
            bottom: 15,
            left: 15,
            child: Column(
              children: [
                Text(
                  heading,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 5,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 15,
            bottom: 15,
            child: Icon(Icons.play_circle, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }

  getHorozintalCards(NewsApi newsApi, size) {
    List<GestureDetector> cards = List<GestureDetector>.empty(growable: true);
    int total = newsApi.articles?.length ?? 0;
    for (int i = 0; i < total; i++) {
      if (newsApi.articles == null) break;
      cards.add(
        horizontalCard(
          size,
          newsApi.articles![i].title,
          newsApi.articles![i].publishedAt,
          newsApi.articles![i].urlToImage,
        ),
      );
    }
    return Row(children: cards);
  }

  getVerticalCards(NewsApi newsApi, size) {
    List<Padding> cards = List<Padding>.empty(growable: true);
    int total = newsApi.articles?.length ?? 0;
    for (int i = 0; i < total; i++){
      if (newsApi.articles == null) break;
      cards.add(
      verticalCard(
        size,
        newsApi.articles![i].title ?? '',
        newsApi.articles![i].publishedAt ?? '',
        'Click For More',
        newsApi.articles![i].urlToImage,
      )
      );
    }
    return Column(

      children: cards,
    );

  }

  verticalCard(size, heading, date, buttonText, imageURL) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const DetailPage(),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 100,
                  width: 120,
                  margin: EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageURL ??
                          "https://thumbs.dreamstime.com/b/no-image-available-icon-isolated-dark-background-simple-vector-logo-no-image-available-icon-isolated-dark-background-275079095.jpg",
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        // Appropriate logging or analytics, e.g.
                        // myAnalytics.recordError(
                        //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                        //   exception,
                        //   stackTrace,
                        // );
                        return Image.network("https://thumbs.dreamstime.com/b/no-image-available-icon-isolated-dark-background-simple-vector-logo-no-image-available-icon-isolated-dark-background-275079095.jpg",
                        fit: BoxFit.fill);
                  },
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 120,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(Icons.play_circle, color: Colors.red, size: 40),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width / 1.8,
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
                width: size.width / 1.8,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                    Expanded(
                      child: Text(
                        date,
                        style: TextStyle(color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<NewsApi?>(
                future: futureNewsApiHorizontal,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return getHorozintalCards(snapshot.data!, size);
                  } else if (!snapshot.hasData) {
                    return Text("${snapshot.error}");
                  }

                  return const CircularProgressIndicator();
                },
                // [
                // horizontalCard(size, "This is PCPS", "sept 5 2025"),
                // horizontalCard(size, "NEWS 245", "sept 6 2025"),
                // horizontalCard(size, "HI HOW ARE YOU", "sept 7 2025"),
                // horizontalCard(size, "Happy holidays", "sept 8 2025"),
                // ],
              ),
            ),
        

              FutureBuilder<NewsApi?>(
                  future: futureNewsApiVertical,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return getVerticalCards(snapshot.data!, size);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
          ],
        ),
      ),
    );
  }
}
