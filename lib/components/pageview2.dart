import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final int index;
  final String url;
  final double width;
  static const String name = '';
  static const String price = '';

  const PageViewItem({
    Key? key,
    required this.index,
    required this.width,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(index),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          width: width,
        ),
      ),
    );
  }
}
