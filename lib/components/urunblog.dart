// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:ankprj/components/adetinput.dart';
import 'package:ankprj/config/config.dart';
import 'package:ankprj/pages/urundetay.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// ignore: camel_case_types
class Urun_Blog extends StatefulWidget {
  final String id,
      adi,
      aciklama,
      fiyat,
      resimler,
      coksatilen,
      yeni,
      yayinda,
      indirimorani,
      kargoaciklama,
      kargotip,
      kategori,
      kdv,
      satisadeti,
      stokadeti,
      birim,
      tipurunbirim,
      genelpuan,
      yorumsayisi,
      firsat,
      kod;

  Urun_Blog({
    Key? key,
    required this.id,
    required this.adi,
    required this.aciklama,
    required this.fiyat,
    required this.resimler,
    required this.coksatilen,
    required this.yeni,
    required this.yayinda,
    required this.indirimorani,
    required this.kargoaciklama,
    required this.kargotip,
    required this.kategori,
    required this.kdv,
    required this.satisadeti,
    required this.stokadeti,
    required this.birim,
    required this.tipurunbirim,
    required this.genelpuan,
    required this.yorumsayisi,
    required this.firsat,
    required this.kod,
  }) : super(key: key);

  @override
  State<Urun_Blog> createState() => _Urun_BlogState();
}

class _Urun_BlogState extends State<Urun_Blog> {
  // late final Urundetay? datam;

  late int adet = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => Duyurular()));
          Get.to(() => urundetay(urunid: widget.id));
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          margin: const EdgeInsets.all(7),
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.1, color: Colors.red),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  widget.resimler,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  height: 120,
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
                  height: 2,
                ),
                SizedBox(
                  child: Text(
                    widget.adi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                  ),
                  height: 15,
                ),
                SizedBox(
                  child: Text.rich(
                    TextSpan(
                      text: widget.fiyat.toString() + '.00 TL',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ), // default text style
                      children: <TextSpan>[],
                    ),
                  ),
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      child: Adetinput(
                        ilkadet: adet,
                        maxadet: 100,
                        minadet: 1,
                        adetgetir: (val) {
                          adet = int.parse(val.toString());
                        },
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    MaterialButton(
                      minWidth: 35,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.red,
                      onPressed: () {},
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                        size: 15,
                      ),

                      /*MaterialButton(
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
                        )*/
                    ),
                  ],
                ),
              ]),
        ));
  }
}
