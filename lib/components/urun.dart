// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:ankprj/config/config.dart';
import 'package:ankprj/models/urunmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// ignore: camel_case_types
class Urun_Blog extends StatefulWidget {
  final String indirim,
      title,
      img,
      kargo,
      fiyat,
      urunkodu,
      tip,
      birimdeger,
      degerlendirme,
      yorumadet,
      id;

  Urun_Blog({
    Key? key,
    required this.indirim,
    required this.id,
    required this.urunkodu,
    required this.title,
    required this.img,
    required this.kargo,
    required this.fiyat,
    required this.tip,
    required this.birimdeger,
    required this.degerlendirme,
    required this.yorumadet,
  }) : super(key: key);

  @override
  State<Urun_Blog> createState() => _Urun_BlogState();
}

class _Urun_BlogState extends State<Urun_Blog> {
  // late final Urundetay? datam;

  late int adet = 1;
  late final Future<List<Urunliste_model>> urundetayy;
  Future<List<Urunliste_model>> urunGetir(String id) async {
    var veriler = await Config().getMethod(id, id);
    var body = json.decode(veriler) as List;
    print(body);
    return body.map((e) => Urunliste_model.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => Duyurular()));
          Get.toNamed("/urun_detay", arguments: widget.id);
        },
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(7),
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.1, color: Colors.purple),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  widget.img,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                  ),
                  height: 38,
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: '₺' + widget.fiyat.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ), // default text style
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                ' / ${widget.tip} ${widget.birimdeger.toString()}',
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: MaterialButton(
                          shape: CircleBorder(
                            side: BorderSide(
                                color: Colors.purple,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                          height: 30.0,
                          minWidth: 30.0,
                          textColor: Colors.purple,
                          color: Colors.white,
                          child: Icon(
                            Icons.add,
                            size: 14,
                          ),
                          onPressed: () async {
                            //taze
                            if (1 == 1) {
                              final urundetayy = await urunGetir("");

                              var datam = urundetayy[0];

                              List urun = [
                                {
                                  "title": datam.urunAdi.toString(),
                                  "urunId": datam.id.toString(),
                                  "resim": datam.vitrinResim.toString(),
                                  "kargo": "Taze Kargo",
                                  "adet": adet,
                                }
                              ];
                              Config().sepetekle(urun, 1);
                              Get.snackbar(
                                "Sepete Eklendi",
                                "${datam.urunAdi} ",
                                duration: Duration(seconds: 1),
                                icon: Icon(Icons.shopping_bag,
                                    color: Colors.white),
                                snackPosition: SnackPosition.TOP,
                              );
                            }
                          },
                          splashColor: Colors.green,
                        )),
                  ],
                ),
              ]),
        ));
  }
}
