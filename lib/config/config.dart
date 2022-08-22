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
