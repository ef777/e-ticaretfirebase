import 'dart:async';
import 'dart:math';

import 'package:ankprj/components/carosel.dart';
import 'package:ankprj/components/grid.dart';
import 'package:ankprj/components/searchbar.dart';
import 'package:ankprj/components/urun.dart';
import 'package:ankprj/components/urungrup_title.dart';
import 'package:ankprj/config/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  home_page({
    Key? key,
  }) : super(key: key);

  @override
  State<home_page> createState() => _Home_pageState();
}

// ignore: camel_case_types
class _Home_pageState extends State<home_page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  @override
  var c = Get.put(getconfig());
  late PageController _pageController;
  int pageview = 0;
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (pageview < 10 - 1) {
        pageview++;
      } else {
        pageview = 0;
      }

      _pageController.animateToPage(
        pageview,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    geturungrup(urungruptip);
    super.initState();
    _pageController =
        PageController(initialPage: pageview, viewportFraction: 0.6);
  }

  geturungrup(String tip) {
    print("get urun başladi");
    // _urungruplari = []
//    print(_urungruplari.whenComplete(() => print("urun grup geldiiiii")));
    // _banner = [];
    //   print(_banner.whenComplete(() => print("banner geldiiii")));

    // _vitringup = [];
    //  print(_vitringup.whenComplete(() => print("vitrin urunleri geldiiii")));
    setState(() {
      print("ozel");
      print(tip.toString());
      secimrenk = tip;
      urungruptip = tip;
    });
  }

  int urungrupakitf = 0;
  String urungruptip = "firsat_urunleri";
  String secimrenk = "";
  String secili = "";
  @override
  Widget build(BuildContext context) {
    var _gridItems = [
      "Kuruyemişler",
      "Çiğ Yemişler",
      "Kuru Meyveler",
      "Lokumlar & Sucuklar",
      "Şekerler",
      "Cezerye & Krokanlar",
      "Kahve",
      "Diğer Ürünler"
    ];
    var _gridimage = [
      "https://cerezpinari.com/UserFiles/Fotograflar/91-01-png-01.png",
      "https://cerezpinari.com/UserFiles/Fotograflar/92-02-png-02.png",
      "https://cerezpinari.com/UserFiles/Fotograflar/93-03-png-03.png",
      "https://cerezpinari.com/UserFiles/Fotograflar/94-04-png-04.png",
      "https://cerezpinari.com/UserFiles/Fotograflar/103-akide-seker-akide.png",
      "https://cerezpinari.com/UserFiles/Fotograflar/96-06-png-06.png",
      "https://cerezpinari.com/UserFiles/Fotograflar/97-07-png-07.png",
      "https://cerezpinari.com/UserFiles/Fotograflar/90-08-png-08.png"
    ];
    Future<List> _banner;
    Future<List> _urungruplari;
    Future<List> _vitringup;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 80) / 2.2;
    final double itemWidth = size.width / 5;
    var veri;
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text('Page 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.train,
                ),
                title: const Text('Page 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        key: _scaffoldKey,
        body: Obx(() => Stack(children: [
              Text(c.konumdegisti.value.toString()),
              FutureBuilder(
                  future: Future.wait([]),
                  builder: (context, AsyncSnapshot<List<dynamic>> snaphost) {
                    if (snaphost.hasData) {
                      //  var veri = snaphost.data?[0];
                      // var banner = snaphost.data![0];
                      var urungruplari = [
                        "1",
                        "2",
                        "3",
                        "4",
                        "5",
                        "6",
                        "7"
                      ]; // var vitringrup = snaphost.data![2];
                      return CustomScrollView(slivers: [
                        SliverAppBar(
                          bottom: AppBar(
                              elevation: 1,
                              automaticallyImplyLeading: false,
                              title: Container(
                                  width: double.infinity,
                                  height: 40,
                                  color: Colors.white,
                                  child: const Center(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        hintText: 'Aramak İstediğiniz Ürün?',
                                        suffixIcon: Icon(Icons.search),
                                      ),
                                    ),
                                  ))),
                          expandedHeight: 280.0,
                          floating: true,
                          backgroundColor: Colors.red,
                          leading: IconButton(
                            icon: Icon(
                              Icons.info,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          actions: [
                            IconButton(
                              icon: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ],
                          centerTitle: true,
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: Image.asset("assets/indir.png")),
                                Text('Pınar kuruyemiş',
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold))),
                              ]),
                          pinned: true,
                          snap: false,
                          flexibleSpace: FlexibleSpaceBar(
                            centerTitle: true,
                            background: Container(
                                height: itemHeight - 120,
                                margin:
                                    new EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
                                padding: EdgeInsets.fromLTRB(0, 85, 0, 40),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Carousel()),
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: Visibility(
                          visible: (1 > 0) ? true : false,
                          child: Container(
                              height: itemHeight - 200,
                              margin:
                                  new EdgeInsets.fromLTRB(5.0, 10, 10.0, 5.0),
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: view(
                                  gridImage: _gridimage,
                                  gridItems: _gridItems)),
                        )),
                        SliverToBoxAdapter(
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Urungrup_title(
                                  tiklandi: secimrenk,
                                  title: "Fırsat Ürünleri",
                                  tip: "firsat_urunleri",
                                  onpress: () {
                                    geturungrup("firsat_urunleri");
                                  },
                                ),
                                Urungrup_title(
                                  tip: "one_cikan_urunler",
                                  tiklandi: secimrenk,
                                  title: "En Çok Satanlar",
                                  onpress: () {
                                    geturungrup("one_cikan_urunler");
                                  },
                                ),
                                Urungrup_title(
                                  tip: "cok_satilanlar",
                                  tiklandi: secimrenk,
                                  title: "Yeni Ürünler",
                                  onpress: () {
                                    geturungrup("cok_satilanlar");
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Visibility(
                            visible: (urungruplari.length > 0) ? true : false,
                            child: Container(
                              width: itemWidth,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              height: itemHeight,
                              child: PageView.builder(
                                padEnds: false,
                                controller: _pageController,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                      child: Urun_Blog(
                                    aciklama:
                                        " Klasik çerez lezzetlerinden vazgeçemiyor musunuz? O halde sizlere önerimiz tuzlu fıstık!",
                                    indirim: "var",
                                    title: "Lüks karışık kuruyemiş",
                                    img:
                                        "https://www.cerezpinari.com/UserFiles/Fotograflar/698-kabuklu-badem-cig-410-kabuklu-badem-cig-235-jpg-kabuklu-badem-cig-235-jpg-410-kabuklu-badem-cig-235-jpg-kabuklu-badem-cig-235.jpg",
                                    kargo: "10",
                                    fiyat: "20",
                                    urunkodu: "0",
                                    tip: "100",
                                    birimdeger: "22",
                                    degerlendirme: "4",
                                    yorumadet: "2",
                                    id: "1",
                                  ));
                                },
                                itemCount: urungruplari.length,
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: Visibility(
                          visible: (1 > 0) ? true : false,
                          child: Container(
                            height: itemHeight - 200,
                            margin: new EdgeInsets.fromLTRB(5.0, 10, 10.0, 5.0),
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        )),
                      ]);
                    } else {
                      return const Center(
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                  })
            ])));
  }
}
