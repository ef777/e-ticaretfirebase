import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

// ignore: camel_case_types
class categories extends StatefulWidget {
  const categories({Key? key}) : super(key: key);

  @override
  State<categories> createState() => categoriespageState();
}

// ignore: camel_case_types
class categoriespageState extends State<categories> {
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
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(),
        body: Container(

            //grid view with all cateogries and subcategories with items iamges clickable to item details
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
                padding: const EdgeInsets.all(10),
                children: <Widget>[
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      pageview = 0;
                    });
                    _pageController.animateToPage(pageview,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        FontAwesome.leaf,
                        size: 50,
                        color: Colors.green,
                      ),
                      const Text('Kuruyemiş'),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      pageview = 1;
                    });
                    _pageController.animateToPage(pageview,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        FontAwesome.leaf,
                        size: 50,
                        color: Colors.green,
                      ),
                      const Text('Meyve'),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      pageview = 2;
                    });
                    _pageController.animateToPage(pageview,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        FontAwesome.leaf,
                        size: 50,
                        color: Colors.green,
                      ),
                      const Text('Sebze'),
                    ],
                  ),
                ),
              ),
              Card(
                  elevation: 10,
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          pageview = 3;
                        });
                        _pageController.animateToPage(pageview,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              FontAwesome.leaf,
                              size: 50,
                              color: Colors.green,
                            ),
                          ])))
            ])));
  }
}
