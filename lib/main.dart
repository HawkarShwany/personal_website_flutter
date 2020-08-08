import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hawkar Shwany',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
        accentColor: kButtonColor,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  List<Widget> pages = [
    Container(
      height: double.infinity,
      color: Colors.amber,
      margin: EdgeInsets.all(40),
      padding: EdgeInsets.all(20),
      child: Text('data 1'),
    ),
    Container(
      height: 500,
      // color: Colors.blue,
      padding: EdgeInsets.all(20),
      child: Text('data 2'),
    ),
    Container(
      height: 500,
      // color: Colors.blue,
      padding: EdgeInsets.all(20),
      child: Text('data 2'),
    ),
    Container(
      height: 500,
      // color: Colors.blue,
      padding: EdgeInsets.all(20),
      child: Text('data 2'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: CarouselSlider(
              items: pages,
              options: CarouselOptions(
                scrollDirection: Axis.vertical,
                enableInfiniteScroll: false,
                // enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                // enlargeStrategy: CenterPageEnlargeStrategy.height
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            // top: double.infinity/2,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: AnimatedSmoothIndicator(
                activeIndex: _current,
                count: pages.length,
                axisDirection: Axis.vertical,
                effect: SwapEffect(
                  activeDotColor: Color(0xffff8f00),
                  dotColor: Color.fromRGBO(0, 0, 0, 0.4),
                ),
              ),
            ),
            // child: Column(
            //   children: pages.map((page) {
            //     int index = pages.indexOf(page);
            //     return Container(
            //       width: 20,
            //       height: 20,
            //       decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: _current == index
            //         ? Color(0xffff8f00)
            //         : Color.fromRGBO(0, 0, 0, 0.4),
            //     ),
            //       margin: EdgeInsets.all(10),
            //     );
            //   }).toList(),
            // ),
          )
        ],
      ),
    );
  }
}
