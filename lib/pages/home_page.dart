import 'dart:async';
import 'dart:math';

import 'package:ankprj/components/carosel.dart';
import 'package:ankprj/components/grid.dart';
import 'package:ankprj/components/pageview2.dart';
import 'package:ankprj/components/searchbar.dart';
import 'package:ankprj/components/urungrup_title.dart';
import 'package:ankprj/config/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/urunblog.dart';
import '../models/altpageviewmodel.dart';

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
  final _controller2 = PageController(
    viewportFraction: 1,
  );
  int pageview = 0;
  late final _itemWidth =
      MediaQuery.of(context).size.width * _controller2.viewportFraction;
  late Timer _timer;
  double _page = 0;
  int get _firstItemIndex => _page.toInt();

  @override
  void initState() {
    _controller2.addListener(() => setState(() {
          _page = _controller2.page!;
        }));
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
        PageController(initialPage: pageview, viewportFraction: 0.5);
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
              FutureBuilder<QuerySnapshot>(
                  // <2> Pass `Future<QuerySnapshot>` to future
                  future:
                      FirebaseFirestore.instance.collection('urunler').get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<DocumentSnapshot> documents =
                          snapshot.data!.docs;
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
                                  color: Colors.white10,
                                  width: double.infinity,
                                  height: 40,
                                  child: const Center(
                                    child: TextField(
                                      cursorColor: Colors.red,
                                      decoration: InputDecoration(
                                        focusColor: Colors.red,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.all(10),
                                        hintText: 'Aramak İstediğiniz Ürün?',
                                        suffixIcon: Icon(Icons.search),
                                      ),
                                    ),
                                  ))),
                          expandedHeight: 280.0,
                          floating: true,
                          backgroundColor: Colors.white,
                          leading: IconButton(
                            icon: Icon(
                              Icons.info,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          actions: [
                            IconButton(
                              icon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ],
                          centerTitle: true,
                          title: SizedBox(
                              width: 100,
                              height: 50,
                              child:
                                  Image.asset("assets/48-logo-png-logo.png")),
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
                                child: Carousel(option: "ustmenu")),
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: Visibility(
                          visible: (1 > 0) ? true : false,
                          child: Container(
                              height: itemHeight - 190,
                              margin: new EdgeInsets.fromLTRB(5.0, 2, 5.0, 2.0),
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
                            padding: EdgeInsets.fromLTRB(10.0, 0, 0.0, 10.0),
                            margin: const EdgeInsets.only(top: 10, bottom: 0),
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
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              margin: const EdgeInsets.only(top: 0, bottom: 5),
                              height: itemHeight - 40,
                              child: PageView.builder(
                                padEnds: false,
                                controller: _pageController,
                                itemBuilder: (context, index) {
                                  var body = snapshot.data!.docs[index];
                                  return SizedBox(
                                      child: Urun_Blog(
                                    id: body["id"].toString(),
                                    aciklama: body["aciklama"].toString(),
                                    adi: body["adi"],
                                    fiyat: body["fiyat"].toString(),
                                    resimler: body["resimler"][0].toString(),
                                    coksatilen: body["coksatilen"].toString(),
                                    firsat: body["fırsat"].toString(),
                                    yeni: body["yeni"].toString(),
                                    yayinda: body["yayinda"].toString(),
                                    indirimorani:
                                        body["indirimorani"].toString(),
                                    kargoaciklama:
                                        body["kargoaciklama"].toString(),
                                    kargotip: body["kargotip"].toString(),
                                    kategori: body["kategori"].toString(),
                                    kdv: body["kdv"].toString(),
                                    satisadeti: body["satisadeti"].toString(),
                                    stokadeti: body["stokadeti"].toString(),
                                    kod: body["kod"].toString(),
                                    birim: body["birim"].toString(),
                                    tipurunbirim:
                                        body["tipurunbirim"].toString(),
                                    genelpuan: body["genelpuan"].toString(),
                                    yorumsayisi: body["yorumsayisi"].toString(),
                                  ));
                                },
                                itemCount: snapshot.data!.docs.length,
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Visibility(
                            visible: (1 > 0) ? true : false,
                            child: Container(
                              height: itemHeight - 100,
                              margin: new EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        width: _itemWidth,
                                        child: FractionallySizedBox(
                                          child: PageViewItem(
                                            index: _firstItemIndex,
                                            width: _itemWidth,
                                            url: images2[_firstItemIndex],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100,
                                    child: PageView.builder(
                                      padEnds: false,
                                      controller: _controller2,
                                      itemBuilder: (context, index) {
                                        return Opacity(
                                          opacity:
                                              index <= _firstItemIndex ? 0 : 1,
                                          child: PageViewItem(
                                            index: index,
                                            width: _itemWidth,
                                            url: images2[index],
                                          ),
                                        );
                                      },
                                      itemCount: images2.length,
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 30, 0, 0),
                                        child: SizedBox(
                                            width: 60,
                                            height: 60,
                                            child: Image.network(
                                                "https://www.cerezpinari.com/UserFiles/Fotograflar/thumbs/30-pinar-kuruyemis-png-pinar-kuruyemis.png")),
                                      )),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red.withOpacity(0.8),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            border: Border.all(
                                                width: 1, color: Colors.red)),
                                        height: 62,
                                        width: 200,
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 30, 20),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Text.rich(
                                          TextSpan(
                                            text:
                                                "Lokum ve Cezeryelerimiz PANCAR şekerinden üretilmiştir",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12,
                                              color: Colors.white,
                                            ), // default text style
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '  Mısır şurubu ve GLİKOZ içermez',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: Visibility(
                                visible: (1 > 0) ? true : false,
                                child: Container(
                                    height: itemHeight - 200,
                                    margin: new EdgeInsets.fromLTRB(
                                        0.0, 0, 0.0, 0.0),
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20)),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 10),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 5),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text("Müşteri Hizmetleri"),
                                                  Text(
                                                    "444 75 42",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ),
                                        Expanded(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20)),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 10),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 5),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text("250 TL ve Üzeri"),
                                                  Text(
                                                    "Ücretsiz Kargo",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                    ),
                                                  )
                                                ],
                                              )),
                                        )
                                      ],
                                    ))))),
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
