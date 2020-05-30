import 'package:flutter/material.dart';

class ExtremeRow extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget left;
  final Widget right;
  const ExtremeRow({
    Key key,
    @required this.left,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.right = const SizedBox(width: 0, height: 0),
  }) : super(key: key);

  ExtremeRow.symmetric({
    double h = 0,
    double v = 0,
    this.left,
    this.right = const SizedBox(width: 0, height: 0),
  })  : margin = EdgeInsets.symmetric(horizontal: h, vertical: v),
        padding = const EdgeInsets.all(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [left, right],
      ),
    );
  }
}
