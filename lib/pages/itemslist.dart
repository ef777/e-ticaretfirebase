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
  final String kategorim;

  const item_list({super.key, required this.kategorim});
  @override
  State<item_list> createState() => item_liststate();
}

// ignore: camel_case_types
class item_liststate extends State<item_list> {
  CollectionReference items = FirebaseFirestore.instance.collection('items');
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();
  bool scroldurum = true;
  int adet = 0;
  void _onscrol() {
    if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels &&
        scroldurum) {
      adet = adet + 10;
      print("aşağı geldi");

      getUrunliste(widget.kategorim, adet);
      print("urunler çekildi");
    }
  }

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

  final List<DocumentSnapshot> urunlsitem = [];
  final StreamController<List<DocumentSnapshot>> _streamController =
      StreamController();

  @override
  void initState() {
    print("initState");
    getUrunliste(widget.kategorim, adet);
    _scrollController.addListener(_onscrol);
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
    String katId = "44";

    bool isChecked = false;

    bool _isRadioSelected = false;

    String icerik = "a";

    String degerlen = 'a';
    String kucret = 'a';
    String ksure = 'a';

    String uretim = 'a';
    String statu = 'a';
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
            child: StreamBuilder<List<DocumentSnapshot>>(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // <3> Retrieve `List<DocumentSnapshot>` from snapshot
                    var documents =
                        snapshot.data!.map((doc) => doc.data()).toList();

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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.black,
                                      alignment: Alignment.center,
                                    ),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(FontAwesome.sliders),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("Filtrele "),
                                        ]),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        //  isScrollControlled: true,
                                        builder: (context) {
                                          return StatefulBuilder(
                                            builder: (BuildContext context,
                                                StateSetter
                                                    setState /*You can rename this!*/) {
                                              return Stack(children: [
                                                Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Column(children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      SizedBox(
                                                        width: 50,
                                                        child: Divider(
                                                            height: 3,
                                                            thickness: 3,
                                                            color: Colors.grey),
                                                      )
                                                    ])),
                                                ListView(
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    children: <Widget>[
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      ExpansionTile(
                                                          leading: SizedBox(
                                                              width: 20),
                                                          title: Text(
                                                              "Değerlendirme"),
                                                          children: <Widget>[
                                                            ListTile(
                                                              leading:
                                                                  Radio<String>(
                                                                value: 'hepsi',
                                                                groupValue:
                                                                    degerlen,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    Config.degerlendirme =
                                                                        "0";
                                                                    print(Config
                                                                        .degerlendirme);
                                                                    degerlen =
                                                                        value!;
                                                                  });
                                                                },
                                                              ),
                                                              title: const Text(
                                                                  'Hepsi'),
                                                            ),
                                                            ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value: 'bir',
                                                                  groupValue:
                                                                      degerlen,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.degerlendirme =
                                                                          "1";
                                                                      print(Config
                                                                          .degerlendirme);
                                                                      degerlen =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title: Row(
                                                                    children: [
                                                                      Icon(Icons
                                                                          .star),
                                                                    ])),
                                                            ListTile(
                                                              leading:
                                                                  Radio<String>(
                                                                value: 'iki',
                                                                groupValue:
                                                                    degerlen,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    Config.degerlendirme =
                                                                        "2";
                                                                    print(Config
                                                                        .degerlendirme);
                                                                    degerlen =
                                                                        value!;
                                                                  });
                                                                },
                                                              ),
                                                              title: Row(
                                                                  children: [
                                                                    Icon(Icons
                                                                        .star),
                                                                    Icon(Icons
                                                                        .star),
                                                                  ]),
                                                            ),
                                                            ListTile(
                                                              leading:
                                                                  Radio<String>(
                                                                value: 'uc',
                                                                groupValue:
                                                                    degerlen,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    Config.degerlendirme =
                                                                        "3";
                                                                    print(Config
                                                                        .degerlendirme);
                                                                    degerlen =
                                                                        value!;
                                                                  });
                                                                },
                                                              ),
                                                              title: Row(
                                                                  children: [
                                                                    Icon(Icons
                                                                        .star),
                                                                    Icon(Icons
                                                                        .star),
                                                                    Icon(Icons
                                                                        .star),
                                                                  ]),
                                                            ),
                                                            Container(
                                                                child: ListTile(
                                                              leading:
                                                                  Radio<String>(
                                                                value: 'dort',
                                                                groupValue:
                                                                    degerlen,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    Config.degerlendirme =
                                                                        "4";
                                                                    print(Config
                                                                        .degerlendirme);
                                                                    degerlen =
                                                                        value!;
                                                                  });
                                                                },
                                                              ),
                                                              title: Row(
                                                                  children: [
                                                                    Icon(Icons
                                                                        .star),
                                                                    Icon(Icons
                                                                        .star),
                                                                    Icon(Icons
                                                                        .star),
                                                                    Icon(Icons
                                                                        .star),
                                                                  ]),
                                                            )),
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value: 'bes',
                                                                  groupValue:
                                                                      degerlen,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.degerlendirme =
                                                                          "5";
                                                                      print(Config
                                                                          .degerlendirme);
                                                                      degerlen =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title: Row(
                                                                    children: [
                                                                      Icon(Icons
                                                                          .star),
                                                                      Icon(Icons
                                                                          .star),
                                                                      Icon(Icons
                                                                          .star),
                                                                      Icon(Icons
                                                                          .star),
                                                                      Icon(Icons
                                                                          .star),
                                                                    ]),
                                                              ),
                                                            ),
                                                          ]),
                                                      ExpansionTile(
                                                          leading: SizedBox(
                                                              width: 20),
                                                          title: Text(
                                                              "Kargo Ücreti"),
                                                          children: <Widget>[
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value:
                                                                      'hepsi',
                                                                  groupValue:
                                                                      kucret,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.kargoucret =
                                                                          "0";
                                                                      print(Config
                                                                          .kargoucret);
                                                                      kucret =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title:
                                                                    const Text(
                                                                        'Hepsi'),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value:
                                                                      'alici',
                                                                  groupValue:
                                                                      kucret,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.kargoucret =
                                                                          "2";
                                                                      print(Config
                                                                          .kargoucret);
                                                                      kucret =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title: const Text(
                                                                    'Alıcı Ödemeli Kargo'),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value:
                                                                      'ucretsiz',
                                                                  groupValue:
                                                                      kucret,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.kargoucret =
                                                                          "1";
                                                                      print(Config
                                                                          .kargoucret);
                                                                      kucret =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title: const Text(
                                                                    'Ücretsiz Kargo'),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value:
                                                                      'sartli',
                                                                  groupValue:
                                                                      kucret,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.kargoucret =
                                                                          "3";
                                                                      print(Config
                                                                          .kargoucret);
                                                                      kucret =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title: const Text(
                                                                    'Şartlı Ücretsiz Kargo'),
                                                              ),
                                                            ),
                                                          ]),
                                                      ExpansionTile(
                                                          leading: SizedBox(
                                                              width: 20),
                                                          title: Text(
                                                              "Kargolama Süresi"),
                                                          children: <Widget>[
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value:
                                                                      'hepsi',
                                                                  groupValue:
                                                                      ksure,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.kargosure =
                                                                          "0";
                                                                      print(Config
                                                                          .kargosure);
                                                                      ksure =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title:
                                                                    const Text(
                                                                        'Hepsi'),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value:
                                                                      'aynıgun',
                                                                  groupValue:
                                                                      ksure,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.kargosure =
                                                                          "1";
                                                                      print(Config
                                                                          .kargosure);
                                                                      ksure =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title: const Text(
                                                                    'Aynı Gün'),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value:
                                                                      'biruc',
                                                                  groupValue:
                                                                      ksure,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.kargosure =
                                                                          "2";
                                                                      print(Config
                                                                          .kargosure);
                                                                      ksure =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title: const Text(
                                                                    '1-3 iş Günü içerisinde'),
                                                              ),
                                                            ),
                                                            ListTile(
                                                              leading:
                                                                  Radio<String>(
                                                                value:
                                                                    'birsaat',
                                                                groupValue:
                                                                    ksure,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    Config.kargosure =
                                                                        "3";
                                                                    print(Config
                                                                        .kargosure);
                                                                    ksure =
                                                                        value!;
                                                                  });
                                                                },
                                                              ),
                                                              title: const Text(
                                                                  '1 Saat içerisinde'),
                                                            ),
                                                            ListTile(
                                                              leading:
                                                                  Radio<String>(
                                                                value: 'gunici',
                                                                groupValue:
                                                                    ksure,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    Config.kargosure =
                                                                        "4";
                                                                    print(Config
                                                                        .kargosure);
                                                                    ksure =
                                                                        value!;
                                                                  });
                                                                },
                                                              ),
                                                              title: const Text(
                                                                  'Gün içerisinde'),
                                                            ),
                                                          ]),
                                                      ExpansionTile(
                                                          leading: SizedBox(
                                                              width: 20),
                                                          title: Text("Fiyat"),
                                                          children: <Widget>[
                                                            Container(
                                                                height: 120,
                                                                child: range()),
                                                          ]),
                                                      ExpansionTile(
                                                          leading: SizedBox(
                                                              width: 20),
                                                          title: Text("Statü"),
                                                          children: <Widget>[
                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Checkbox(
                                                                        value: Config
                                                                            .bahceden,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            Config.bahceden =
                                                                                value!;
                                                                            print(Config.bahceden);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                          "Bahçeden"),
                                                                    ),
                                                                    Expanded(
                                                                      child: Icon(
                                                                          Icons
                                                                              .list),
                                                                    )
                                                                  ]),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Checkbox(
                                                                        value: Config
                                                                            .yoresel,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            Config.yoresel =
                                                                                value!;
                                                                            print(Config.yoresel);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                          "Yöresel"),
                                                                    ),
                                                                    Expanded(
                                                                      child: Icon(
                                                                          Icons
                                                                              .list),
                                                                    )
                                                                  ]),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Checkbox(
                                                                        value: Config
                                                                            .dogal,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            Config.dogal =
                                                                                value!;
                                                                            print(Config.dogal);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                          "Doğal"),
                                                                    ),
                                                                    Expanded(
                                                                      child: Icon(
                                                                          Icons
                                                                              .list),
                                                                    )
                                                                  ]),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Checkbox(
                                                                        value: Config
                                                                            .organik,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            Config.organik =
                                                                                value!;
                                                                            print(Config.organik);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                          "Organik"),
                                                                    ),
                                                                    Expanded(
                                                                      child: Icon(
                                                                          Icons
                                                                              .list),
                                                                    )
                                                                  ]),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Checkbox(
                                                                        value: Config
                                                                            .tasarim,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            Config.tasarim =
                                                                                value!;
                                                                            print(Config.tasarim);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                          "Tasarım"),
                                                                    ),
                                                                    Expanded(
                                                                      child: Icon(
                                                                          Icons
                                                                              .list),
                                                                    )
                                                                  ]),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Checkbox(
                                                                        value: Config
                                                                            .endust,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            Config.endust =
                                                                                value!;
                                                                            print(Config.endust);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                          "Endüstriyel"),
                                                                    ),
                                                                    Expanded(
                                                                      child: Icon(
                                                                          Icons
                                                                              .list),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ]),
                                                      ExpansionTile(
                                                          leading: SizedBox(
                                                              width: 20),
                                                          title: Text("Kimden"),
                                                          children: <Widget>[
                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Checkbox(
                                                                        value: Config
                                                                            .uretici,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            Config.uretici =
                                                                                value!;
                                                                            print(Config.uretici);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                          "Üretici"),
                                                                    ),
                                                                    Expanded(
                                                                      child: Icon(
                                                                          Icons
                                                                              .list),
                                                                    )
                                                                  ]),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Checkbox(
                                                                        value: Config
                                                                            .koopera,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            Config.koopera =
                                                                                value!;
                                                                            print(Config.koopera);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                          "Kooperatif"),
                                                                    ),
                                                                    Expanded(
                                                                      child: Icon(
                                                                          Icons
                                                                              .list),
                                                                    )
                                                                  ]),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Checkbox(
                                                                        value: Config
                                                                            .magaza,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            Config.magaza =
                                                                                value!;
                                                                            print(Config.magaza);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                          "Mağaza"),
                                                                    ),
                                                                    Expanded(
                                                                      child: Icon(
                                                                          Icons
                                                                              .list),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ]),
                                                      ExpansionTile(
                                                          leading: SizedBox(
                                                              width: 20),
                                                          title: Text("Üretim"),
                                                          children: <Widget>[
                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Checkbox(
                                                                        value: Config
                                                                            .yerli,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            Config.yerli =
                                                                                value!;
                                                                            print(Config.yerli);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                          "Yerli Üretim"),
                                                                    ),
                                                                    Expanded(
                                                                      child: Icon(
                                                                          Icons
                                                                              .list),
                                                                    )
                                                                  ]),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Checkbox(
                                                                        value: Config
                                                                            .ithal,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            Config.ithal =
                                                                                value!;
                                                                            print(Config.ithal);
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                          "İthal"),
                                                                    ),
                                                                    Expanded(
                                                                      child: Icon(
                                                                          Icons
                                                                              .list),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ]),
                                                      ExpansionTile(
                                                          leading: SizedBox(
                                                              width: 20),
                                                          title: Text("İçerik"),
                                                          children: <Widget>[
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value:
                                                                      'hepsi',
                                                                  groupValue:
                                                                      icerik,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.iceriku =
                                                                          "0";
                                                                      print(Config
                                                                          .iceriku);
                                                                      icerik =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title:
                                                                    const Text(
                                                                        'Hepsi'),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value:
                                                                      'vegan',
                                                                  groupValue:
                                                                      icerik,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.iceriku =
                                                                          "1";
                                                                      print(Config
                                                                          .iceriku);
                                                                      icerik =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title:
                                                                    const Text(
                                                                        'Vegan'),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value:
                                                                      'gluten',
                                                                  groupValue:
                                                                      icerik,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.iceriku =
                                                                          "2";
                                                                      print(Config
                                                                          .iceriku);
                                                                      icerik =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title: const Text(
                                                                    'Glütensiz'),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: ListTile(
                                                                leading: Radio<
                                                                    String>(
                                                                  value:
                                                                      'diyet',
                                                                  groupValue:
                                                                      icerik,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      Config.iceriku =
                                                                          "5";
                                                                      print(Config
                                                                          .iceriku);
                                                                      icerik =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                                title:
                                                                    const Text(
                                                                        'Diyet'),
                                                              ),
                                                            ),
                                                          ]),
                                                      SizedBox(
                                                        height: 60,
                                                      )
                                                    ]),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                urunlsitem
                                                                    .clear();
                                                                setState(() {});
                                                                getUrunliste(
                                                                    widget
                                                                        .kategorim,
                                                                    0);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Icon(
                                                                  Icons.check)),
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                Config.kanal =
                                                                    "perakende";
                                                                Config.kargosure =
                                                                    "0";
                                                                Config.kargoucret =
                                                                    "0";
                                                                Config.minfiyat =
                                                                    0;
                                                                Config.iceriku =
                                                                    "0";
                                                                Config.statu =
                                                                    "0";
                                                                Config.kimden =
                                                                    "0";
                                                                Config.uretim =
                                                                    "0";
                                                                Config.tezgah =
                                                                    "0";
                                                                Config.degerlendirme =
                                                                    "0";
                                                                //statu
                                                                Config.bahceden =
                                                                    false;
                                                                Config.yoresel =
                                                                    false;
                                                                Config.dogal =
                                                                    false;
                                                                Config.organik =
                                                                    false;
                                                                Config.tasarim =
                                                                    false;
                                                                Config.endust =
                                                                    false;
// kimden
                                                                Config.uretici =
                                                                    false;
                                                                Config.koopera =
                                                                    false;
                                                                Config.magaza =
                                                                    false;

                                                                //uretim
                                                                Config.yerli =
                                                                    false;
                                                                Config.ithal =
                                                                    false;
                                                                urunlsitem
                                                                    .clear();
                                                                setState(() {});
                                                                getUrunliste(
                                                                    widget
                                                                        .kategorim,
                                                                    0);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Icon(Icons
                                                                  .restart_alt))
                                                        ])),
                                              ]);
                                            },
                                          );

                                          print("tıklanmadı");
                                        },
                                      );
                                    }),
                                Text(
                                  "Sırala",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
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
                            var body = urunlsitem[index];

                            return Urun_Blog(
                              id: body["id"].toString(),
                              aciklama: body["aciklama"].toString(),
                              adi: body["adi"],
                              fiyat: body["fiyat"].toString(),
                              resimler: body["resimler"][0].toString(),
                              coksatilen: body["coksatilen"].toString(),
                              firsat: body["fırsat"].toString(),
                              yeni: body["yeni"].toString(),
                              yayinda: body["yayinda"].toString(),
                              indirimorani: body["indirimorani"].toString(),
                              kargoaciklama: body["kargoaciklama"].toString(),
                              kargotip: body["kargotip"].toString(),
                              kategori: body["kategori"].toString(),
                              kdv: body["kdv"].toString(),
                              satisadeti: body["satisadeti"].toString(),
                              stokadeti: body["stokadeti"].toString(),
                              kod: body["kod"].toString(),
                              birim: body["birim"].toString(),
                              tipurunbirim: body["tipurunbirim"].toString(),
                              genelpuan: body["genelpuan"].toString(),
                              yorumsayisi: body["yorumsayisi"].toString(),
                            );
                          }, childCount: urunlsitem.length),
                        ),
                        SliverToBoxAdapter(
                          child: (scroldurum)
                              ? const Center(
                                  child: SizedBox(
                                    child: CircularProgressIndicator(),
                                    width: 32,
                                    height: 32,
                                  ),
                                )
                              : const Text(""),
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

  Future<void> getUrunliste(String kategorim, int adet) async {
    // Urunliste_model urunliste_model = new Urunliste_model();
    var data0 = {
      "tezgahId": "",
      "type": "",
      "durum": "",
      "ydurum": "",
    };
    print("getUrunliste");
    var snapshot1 =
        await FirebaseFirestore.instance.collection('urunler').get();

    print(snapshot1.docs.length);

    // <3> Retrieve `List<DocumentSnapshot>` from snapshot
    final List<DocumentSnapshot> body = snapshot1.docs;
    print("body");
    print(body);
    List<DocumentSnapshot> geturunliste = body;
    urunlsitem.addAll(geturunliste);
    if (geturunliste.isNotEmpty) {
      _streamController.add(urunlsitem);
      if (geturunliste.length < 10) {
        setState(() {
          scroldurum = false;
        });
      } else {
        setState(() {
          scroldurum = true;
        });
      }
    } else {
      setState(() {
        scroldurum = false;
      });
    }
  }
}

class range extends StatelessWidget {
  const range({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const range2(),
      ),
    );
  }
}

class range2 extends StatefulWidget {
  const range2({Key? key}) : super(key: key);

  @override
  State<range2> createState() => range2state();
}

class range2state extends State<range2> {
  RangeValues _currentRangeValues =
      RangeValues(Config.minfiyat, Config.maxfiyat);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      max: 1000,
      divisions: 50,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}
