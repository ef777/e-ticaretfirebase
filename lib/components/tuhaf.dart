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
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      _scrollController.animateTo(_scrollController.position.viewportDimension,
          duration: Duration(seconds: widget.gridItems!.length * 10),
          curve: Curves.linear);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      height: 100,
      child: GridView.builder(
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
      ),
    ));
  }
}
