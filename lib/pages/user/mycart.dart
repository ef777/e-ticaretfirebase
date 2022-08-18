import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

// ignore: camel_case_types
class mycart extends StatefulWidget {
  const mycart({Key? key}) : super(key: key);

  @override
  State<mycart> createState() => mycartState();
}

// ignore: camel_case_types
class mycartState extends State<mycart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int pageview = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();

    _pageController =
        PageController(initialPage: pageview, viewportFraction: 0.6);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 80) / 2.2;
    final double itemWidth = size.width / 2;
    return Scaffold(key: _scaffoldKey, appBar: AppBar(), body: Container());
  }
}
