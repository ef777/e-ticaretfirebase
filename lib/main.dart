import 'dart:io';
import 'package:ankprj/components/thema.dart';
import 'package:ankprj/pages/categories.dart';
import 'package:ankprj/pages/error_page.dart';
import 'package:ankprj/pages/home.dart';
import 'package:ankprj/pages/home_page.dart';
import 'package:ankprj/pages/itemlist.dart';
import 'package:ankprj/pages/user/mycart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'pnr',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const home(),
        '/homepage': (context) => home_page(),
        '/homepage': (context) => item_list(),
        '/cart': (context) => const mycart(),
        '/categories': (context) => categories(),
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const home(),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const home(),
            );
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => const Errorpage());
      },
    );
  }
}
