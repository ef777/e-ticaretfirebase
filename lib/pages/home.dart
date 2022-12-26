import 'dart:io';

import 'package:ankprj/config/config.dart';
import 'package:ankprj/pages/categories.dart';
import 'package:ankprj/pages/home_page.dart';
import 'package:ankprj/pages/itemslist.dart';
import 'package:ankprj/pages/user/mycart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:fluttericon/zocial_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  ];

  @override
  void initState() {
    if (Config.login == 0) {}
    Config.checkInternet();

    super.initState();
  }

// internet check

  @override
  Widget build(BuildContext context) {
    List<Widget> sayfalar = [
      home_page(),
      item_list(
        kategorim: '1',
      ),
      categories(),
      MyCart(),
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
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesome.home,
                    size: 20,
                  ),
                  label: "Vitrin",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/pea.svg",
                    width: 20,
                  ),
                  label: "Ürünler",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesome5.list,
                    size: 20,
                  ),
                  label: "Kategoriler",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesome.shopping_basket,
                    size: 20,
                  ),
                  label: "Sepet",
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
