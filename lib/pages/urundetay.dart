import 'dart:async';
import 'dart:convert';

import 'package:ankprj/components/urunblog.dart';
import 'package:ankprj/config/config.dart';
import 'package:ankprj/pages/itemdetails.dart';
import 'package:flutter/material.dart';

import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class urundetay extends StatefulWidget {
  final String urunid;

  const urundetay({super.key, required this.urunid});
  @override
  State<urundetay> createState() => urundetaystate();
}

// ignore: camel_case_types
class urundetaystate extends State<urundetay> {
  CollectionReference items = FirebaseFirestore.instance.collection('items');
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  //final c = Get.put(getc());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 80) / 2.2;
    final double itemWidth = size.width / 2;
    int pageIndex = 0;

    return Scaffold(
        body: Center(
            child: FutureBuilder<QuerySnapshot>(
                // <2> Pass `Future<QuerySnapshot>` to future
                future: FirebaseFirestore.instance
                    .collection('urunler')
                    .where("id", isEqualTo: widget.urunid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // <3> Retrieve `List<DocumentSnapshot>` from snapshot
                    final List<DocumentSnapshot> document = snapshot.data!.docs;
                    var resimler = document[0]['resimler'] as List;
                    print("length");
                    print(document.length);
                    return CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Stack(children: [
                            Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.width / 3 * 2,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    onPageChanged: (index) {
                                      setState(() {
                                        pageIndex = index;
                                      });
                                    },
                                    itemCount: resimler!.length,
                                    itemBuilder:
                                        (BuildContext context, int itemIndex) {
                                      var resimitem = resimler![itemIndex];
                                      return Image.network(
                                        resimitem,
                                        fit: BoxFit.contain,
                                      );
                                    },
                                  ),
                                  Positioned(
                                    child: SizedBox(
                                      height: 15,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      10 -
                                                  10,
                                              height: 10,
                                              margin: const EdgeInsets.all(5),
                                              color: (pageIndex == index)
                                                  ? Colors.red
                                                  : Colors.grey,
                                            );
                                          },
                                          itemCount: resimler?.length,
                                        ),
                                      ),
                                    ),
                                    bottom: 10,
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    var error = snapshot.error;
                    return Text('Its Error! $error');
                  }
                  return CircularProgressIndicator();
                })));
  }
}
