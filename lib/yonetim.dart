import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ankprj/components/thema.dart';
import 'package:ankprj/pages/categories.dart';
import 'package:ankprj/pages/error_page.dart';
import 'package:ankprj/pages/home.dart';
import 'package:ankprj/pages/home_page.dart';
import 'package:ankprj/pages/itemslist.dart';
import 'package:ankprj/pages/urundetay.dart';
import 'package:ankprj/pages/user/mycart.dart';
import 'package:ankprj/pages/welcome/we_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/config.dart';
import 'firebase_options.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
//import OneSignal
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

class yonetim extends StatelessWidget {
  const yonetim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pınar Kuruyemiş',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: Config.login == 1 ? '/welcome' : '/home',
      routes: {
        '/': (context) => const home(),
        '/welcome': (context) => WelcomeScreen(),
        '/homepage': (context) => home_page(),
        '/urun_detay': (context) => urundetay(
              urunid: '',
            ),
        '/itemlist': (context) => item_list(
              kategorim: '1',
            ),
        '/cart': (context) => MyCart(),
        '/categories': (context) => categories(),
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const home(),
            );
          case '/homepage':
            return MaterialPageRoute(
              builder: (context) => home_page(),
            );
          case '/itemlist':
            return MaterialPageRoute(
              builder: (context) => item_list(
                kategorim: '1',
              ),
            );
          case '/cart':
            return MaterialPageRoute(
              builder: (context) => MyCart(),
            );
          case '/categories':
            return MaterialPageRoute(
              builder: (context) => categories(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => home(),
            );
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => const Errorpage());
      },
    );
  }
}
