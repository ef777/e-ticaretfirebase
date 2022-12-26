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
  var category = {
    'Kuruyemiş': '1',
    'Çiğ Yemişler': '2',
    'Kuru Meyveler': '3',
    'Lokumlar Ve Sucuklar': '4',
    'Cezerye Ve Krokan': '5',
    'Kahve': '6',
    'Yılbaşı Paketi': '7'
  };
  // map inside map for subcategories
  var subcategory = {
    'Kuruyemiş': {
      'Antep Fıstığı': '8',
      'Ayçekirdeği': '9',
      'Badem': '10',
      'Fındık': '11',
      'Ceviz': '12',
      'Fıstık': '13',
      'Kabak Çekirdeği': '14',
      'Kaju': '15',
      'Karışık Kuruyemiş': '16',
      'Leblebi': '17',
      'Mısır': '18'
    },
    'Çiğ Yemişler': {
      'Yemişler': '19',
    },
    'Kuru Meyveler': {'Kuru Meyveler': '20'},
    'Lokumlar Ve Sucuklar': {'Lokumlar Ve Sucuklar': '21'},
    'Cezerye Ve Krokan': {
      'Cezerye Ve Krokan': '22',
    },
    'Kahve': {
      'Kahve': '23',
    },
    'Yılbaşı Paketi': {'Yılbaşı Paketi': '24'}
  };

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

            //grid view with all cateogries and subcategories with items iamges clickable to item details page
            child: Column(
          children: [
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Card(
                        child: Container(
                          width: 100,
                          child: Center(
                              child: Text(
                            category.keys.elementAt(index),
                            style: TextStyle(fontSize: 20),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    pageview = value;
                  });
                },
                controller: _pageController,
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: (itemWidth / itemHeight)),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Card(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Ankara',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                },
              ),
            ),
          ],
        )));
  }
}
