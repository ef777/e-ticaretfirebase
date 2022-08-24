import 'dart:math';

import 'package:ankprj/components/carosel.dart';
import 'package:ankprj/components/tuhaf.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _gridItems = ["şu", "bu", "şu", "buu", ""];
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 80) / 2.2;
    final double itemWidth = size.width / 2;
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

                      return CustomScrollView(slivers: [
                        SliverAppBar(
                          backgroundColor: Colors.green,
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
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.settings,
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
                          expandedHeight: 10.0,
                          flexibleSpace: FlexibleSpaceBar(
                            centerTitle: true,
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: Visibility(
                                visible: (1 > 0) ? true : false,
                                child: Container(
                                    height: itemHeight - 100,
                                    margin: new EdgeInsets.fromLTRB(
                                        5.0, 10, 10.0, 5.0),
                                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Carousel()))),
                        SliverToBoxAdapter(
                            child: Visibility(
                          visible: (1 > 0) ? true : false,
                          child: Container(
                            height: 200,
                            margin: new EdgeInsets.fromLTRB(5.0, 10, 10.0, 5.0),
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: view(gridItems: _gridItems),
                          ),
                        )),
                      ]);
                    } else {
                      return const Center(
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        ),
                      );
                    }
                  })
            ])));
  }
}
