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
class item_list extends StatefulWidget {
  @override
  State<item_list> createState() => item_liststate();
}

// ignore: camel_case_types
class item_liststate extends State<item_list> {
  CollectionReference items = FirebaseFirestore.instance.collection('items');
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();

  urunekle() {
    //firebase function with connection insert document to collection
    FirebaseFirestore.instance.collection('urunler').add({
      'aciklama': 'testaciklama',
      'adi': 'fıstıktest',
      'fiyat': '100',
      'kategori': '1',
      'birim': '1',
      'resimler': [
        'https://st.myideasoft.com/shop/bb/53/myassets/products/019/antep-fistik-anacitlak-500-gr-1.jpeg?revision=1669714804'
      ],
      'coksatilen': '1',
      'fırsat': '1',
      'genelpuan': '1',
      'id': '00',
      'indirimorani': '1',
      'kdv': '1',
      'kargoaciklama': 'kaciklama',
      'kargotip': '1',
      'kod': 'kod',
      'satisadeti': '1',
      'stokadeti': '1000',
      'tipurunbirim': 'kg',
      'yayinda': '1',
      'yeni': '1',
      'yorumsayisi': '1',
      'yorumlar': [
        {
          'kullaniciadi': 'kull1',
          'kullanicıid': '1',
          'puan': '1',
          'title': 'yorum'
        },
        {
          'kullaniciadi': 'kull1',
          'kullanicıid': '1',
          'puan': '1',
          'title': 'yorum'
        }
      ],
    });
  }

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

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            urunekle();
            SnackBar snackBar = SnackBar(
              content: Text('Ürün Eklendi'),
              duration: Duration(seconds: 2),
            );
          },
          child: Icon(Icons.add),
        ),
        body: Center(
            child: FutureBuilder<QuerySnapshot>(
                // <2> Pass `Future<QuerySnapshot>` to future
                future: FirebaseFirestore.instance.collection('urunler').get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // <3> Retrieve `List<DocumentSnapshot>` from snapshot
                    final List<DocumentSnapshot> documents =
                        snapshot.data!.docs;
                    print("length");
                    print(documents.length);
                    return CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverAppBar(
                          centerTitle: true,
                          title: SizedBox(
                              height: 200,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    SizedBox(
                                        height: 120,
                                        child: TextFormField(
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                  left: 15,
                                                  bottom: 5,
                                                  top: 22,
                                                  right: 15),
                                              suffixIcon: Icon(Icons.search),
                                              hintText: "Ne aramıştınız?"),
                                        )),
                                  ])),
                          bottom: AppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: Colors.red,
                            title: SizedBox(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Kategoriler",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Filtrele",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                          ),
                          pinned: true,
                          floating: true,
                          snap: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: (itemWidth / itemHeight),
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              var body = snapshot.data!.docs[index];

                              return Urun_Blog(
                                aciklama: body!.toString(),
                                indirim: "var",
                                title: body["aciklama"],
                                img:
                                    "https://www.cerezpinari.com/UserFiles/Fotograflar/698-kabuklu-badem-cig-410-kabuklu-badem-cig-235-jpg-kabuklu-badem-cig-235-jpg-410-kabuklu-badem-cig-235-jpg-kabuklu-badem-cig-235.jpg",
                                kargo: "10",
                                fiyat: "20",
                                urunkodu: "0",
                                tip: "100",
                                birimdeger: "22",
                                degerlendirme: "4",
                                yorumadet: "2",
                                id: body["id"].toString(),
                              );
                            },
                            childCount: snapshot.data!.docs.length,
                          ),
                        )
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
