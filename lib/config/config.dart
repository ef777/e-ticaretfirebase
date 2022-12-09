import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class getconfig extends GetxController {
  static final active = false.obs;
  final konumdegisti = false.obs;
  final favori = false.obs;
  favorile() {
    favori(!favori.value);
  }

  konumla() {
    konumdegisti(!konumdegisti.value);
  }

  test() {
    active(!active.value);
  }
}

class Config extends ChangeNotifier {
  static int login = 0;

  static String siralama = "0";

  static int selectedIndex = 0;
  static bool konumsecildi = false;
  static String anapagesecilen = "";
  static String? il = "İl Seçin";
  static String plaka = "";
  static String ilce = "ilçe Seçin";
  static String ilcekey = "";
  static String mahalle = "Mahalle Seçin";
  static String mahallekey = "";
  static double lang = 0;
  static double long = 0;
  static String kanal = "perakende";
  static String kargosure = "0";
  static String kargoucret = "0";
  static double minfiyat = 0;
  static double maxfiyat = 1500;
  static String iceriku = "0";
  static String statu = "0";
  static String kimden = "0";
  static String uretim = "0";
  static String tezgah = "0";
  static String degerlendirme = "0";
  //statu
  static bool bahceden = false;
  static bool yoresel = false;
  static bool dogal = false;
  static bool organik = false;
  static bool tasarim = false;
  static bool endust = false;
// kimden
  static bool uretici = false;
  static bool koopera = false;
  static bool magaza = false;

  //uretim
  static bool yerli = false;
  static bool ithal = false;

  static bool logindurum = false;
  static String kullaniciid = "0";
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
