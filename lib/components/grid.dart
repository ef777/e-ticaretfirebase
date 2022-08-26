import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class view extends StatefulWidget {
  List<String>? gridItems;
  view({
    Key? key,
    required this.gridItems,
  }) : super(
          key: key,
        );

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollAnimated(500));
  }

  void scrollAnimated(double position) {
    _controller.animateTo(
      position,
      duration: Duration(seconds: 100),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: SingleChildScrollView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        child: Container(
            height: 100,
            width: 700,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.gridItems!.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return GridTile(
                    child: Container(
                        color: Colors.blue[200],
                        alignment: Alignment.center,
                        child: Text(widget.gridItems![index])));
              },
            )),
      ),
    );
  }
}
