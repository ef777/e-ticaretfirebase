import 'package:ankprj/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'package:get/get.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  home_page({
    Key? key,
  }) : super(key: key);

  @override
  State<home_page> createState() => _Home_pageState();
}

// ignore: camel_case_types
class _Home_pageState extends State<home_page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  @override
  var c = Get.put(getconfig());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 80) / 2.2;
    final double itemWidth = size.width / 2;
    var veri;
    return Scaffold(
        key: _scaffoldKey,
        body: Obx(() => Stack(children: [
              Text(c.konumdegisti.value.toString()),
              FutureBuilder(
                  future: Future.wait([]),
                  builder: (context, AsyncSnapshot<List<dynamic>> snaphost) {
                    if (snaphost.hasData) {
                      //  var veri = snaphost.data?[0];

                      return CustomScrollView(slivers: [
                        SliverAppBar(
                          backgroundColor: Colors.white,
                          pinned: true,
                          expandedHeight: 100.0,
                          flexibleSpace: FlexibleSpaceBar(
                            centerTitle: true,
                            title: Text(
                              'test',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: Visibility(
                                visible: (1 > 0) ? true : false,
                                child: SizedBox(
                                    height: 70,
                                    child: Container(
                                        margin: new EdgeInsets.fromLTRB(
                                            20.0, 20, 20.0, 5.0),
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 5, 0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: []))))),
                      ]);
                    } else {
                      return const Center(
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        ),
                      );
                    }
                  })
            ])));
  }
}
