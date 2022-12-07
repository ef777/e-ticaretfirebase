import 'dart:async';
import 'dart:convert';

import 'package:ankprj/components/urunblog.dart';
import 'package:ankprj/config/config.dart';
import 'package:ankprj/pages/itemdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/adet.dart';

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
    late int adet = 1;
    final c = Get.put(getconfig());

    bool taze = true, toptan = false, jet = false;
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
                    var body = document[0];
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
                        SliverToBoxAdapter(
                          child: Text(
                            body["adi"].toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text("${body["aciklama"]}"),
                                ),
                                RatingBarIndicator(
                                  rating: double.parse(
                                      body["genelpuan"].toString()),
                                  itemCount: 5,
                                  itemSize: 16,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Satış: ${body["satisadeti"]} ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: SizedBox(
                          height: 10,
                        )),
                        SliverToBoxAdapter(
                            child: Visibility(
                          visible: true,
                          child: Column(
                            children: [
                              Visibility(
                                  child: Text(
                                    "Bu ürün ₺100 tl altı ucretsiz",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  ),
                                  visible: true),
                              Visibility(
                                child: Text(
                                  "Bu ürün Ücretsiz Kargo olarak, kargoda.",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.red),
                                ),
                                visible: true,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RichText(
                                        maxLines: 3,
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '${body["fiyat"]}.00 ₺',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 22,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  ' / ${"adet"} ${body["birim"]}',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Adetinput(
                                      ilkadet: adet,
                                      maxadet: 10,
                                      minadet: 1,
                                      adetgetir: (val) {
                                        adet = int.parse(val.toString());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(FontAwesome.truck,
                                        color: Colors.green, size: 15),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      body["kargoaciklama"],
                                      textAlign: TextAlign.center,
                                    )
                                  ]),
                              SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          child: const Text("Sepete Ekle"),
                                          onPressed: () {
                                            List urun = [{}];
                                            var durun =
                                                Config().sepetekle(urun, adet);
                                          },
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.arrow_back,
                                              color: Colors.black,
                                            )),
                                        Obx(() => Row(children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.white),
                                                onPressed: () {
                                                  c.favorile();
                                                },
                                                child: c.favori.value == false
                                                    ? Icon(
                                                        FontAwesome.heart_empty,
                                                        color: Colors.black,
                                                        size: 22,
                                                      )
                                                    : Icon(
                                                        FontAwesome.heart,
                                                        color: Colors.red,
                                                        size: 22,
                                                      ),
                                              )
                                            ])),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white),
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.question_mark,
                                              color: Colors.white,
                                            )),
                                      ]))
                            ],
                          ),
                        ))
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
