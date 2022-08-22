import 'dart:io';

import 'package:ankprj/config/config.dart';
import 'package:ankprj/pages/categories.dart';
import 'package:ankprj/pages/home_page.dart';
import 'package:ankprj/pages/itemlist.dart';
import 'package:ankprj/pages/user/mycart.dart';
import 'package:ankprj/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _HomeState();
}

class _HomeState extends State<home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late bool logindurum = false;

  List pagekey = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    if (Config.login == 0) {
      Navigator.pushNamed(
        context,
        '/welcome',
      );
    }
    Config.checkInternet();

    super.initState();
  }

// internet check

  @override
  Widget build(BuildContext context) {
    List<Widget> sayfalar = [
      home_page(),
      item_list(),
      categories(),
      mycart(),
      //(Config.logindurum == true) ? const Hesap() : const Login(),
    ];
    return WillPopScope(
        onWillPop: () async {
          var durum =
              await await pagekey[Config.selectedIndex].currentState.maybePop();
          if (durum) {
            return false;
          } else {
            if (Config.selectedIndex == 0) {
              return true;
            } else {
              setState(() {
                Config.selectedIndex = 0;
              });
              return false;
            }
          }
        },
        child: Scaffold(
          key: _scaffoldKey,
          body: Navigator(
            key: pagekey[Config.selectedIndex],
            onGenerateRoute: (routeSettings) {
              return MaterialPageRoute(
                builder: (context) {
                  return sayfalar[Config.selectedIndex];
                },
              );
            },
          ),
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              //boxShadow: [boxShadow],
              borderRadius: BorderRadius.only(
                  // topRight: Radius.circular(20),
                  // topLeft: Radius.circular(20),
                  ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              iconSize: 30,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesome.home,
                    size: 20,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesome.circle_empty,
                    size: 20,
                  ),
                  label: "Items",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesome.circle_empty,
                    size: 20,
                  ),
                  label: "Categories",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesome.circle_empty,
                    size: 20,
                  ),
                  label: "Cart",
                ),
              ],
              currentIndex: Config.selectedIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                setState(() {
                  Config.selectedIndex = index;
                });
              },
            ),
          ),
        ));
  }
}
