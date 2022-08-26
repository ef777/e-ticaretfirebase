import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class getconfig extends GetxController {
  static final active = false.obs;
  final konumdegisti = false.obs;

  konumla() {
    konumdegisti(!konumdegisti.value);
  }

  test() {
    active(!active.value);
  }
}

class Config extends ChangeNotifier {
  static int login = 0;

  getMethod(String urlm, Object data) async {
    try {
      var sonuc = await http.get(Uri.parse(urlm), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Basic bXVyYXRiYXozNEBnbWFpbC5jb206MTIz'
      });
      if (sonuc.statusCode == 200) {
        return sonuc.body;
      } else {
        return "";
      }
    } catch (error) {
      return "";
    }
  }

  static List sepetliste = [];
  sepetekle(List urunbilgi, adet) {
    for (int i = 0; i < sepetliste.length; i++) {
      if (urunbilgi[0]["urunId"] == sepetliste[i]["urunId"] &&
          urunbilgi[0]["kargo"] == sepetliste[i]["kargo"]) {
        sepetliste[i]["adet"] = sepetliste[i]["adet"] + adet;
        return true;
      }
    }

    if (urunbilgi[0]["adet"] > 0) {
      sepetliste.addAll(urunbilgi);
      return true;
    } else {
      return false;
    }
  }

  static String url = "https:?";
  static final apiKey = "";
  static int selectedIndex = 0;

  static Future<bool> checkInternet() async {
    try {
      print("internet kontrol ediliyor");
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected internet');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected internet');

      return false;
    }
    print("internet kontrol edildi başarısız");
    return false;
  }
}
/*   
                                      */
