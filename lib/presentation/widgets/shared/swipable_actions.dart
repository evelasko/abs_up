import 'package:flutter/material.dart';

class SwipableActions {
  static Widget actionButton(IconData icon, String text) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 22, color: Colors.white),
            Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      );
  static Widget background(Color color, IconData icon, String text) =>
      Container(
        alignment: Alignment.centerLeft,
        color: color,
        child: actionButton(icon, text),
      );
  static Widget secondaryBackground(Color color, IconData icon, String text) =>
      Container(
        alignment: Alignment.centerRight,
        color: color,
        child: actionButton(icon, text),
      );
}
