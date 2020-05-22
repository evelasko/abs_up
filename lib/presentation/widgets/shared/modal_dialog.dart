import 'package:flutter/material.dart';

import '../../theme/colors.t.dart';
import '../../theme/icons.t.dart';

class AbsAppModalDialog extends StatelessWidget {
  final String title;
  final String message;
  final List<Widget> buttons;
  final Color overlayColor;
  final BoxDecoration decoration;

  const AbsAppModalDialog({
    Key key,
    this.title,
    this.message,
    this.buttons,
    this.overlayColor,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      backgroundColor: overlayColor ?? const Color.fromARGB(200, 32, 33, 37),
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 10),
        height: double.infinity,
        width: double.infinity,
        decoration:
            decoration ?? const BoxDecoration(color: Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // = Header and Message
            Column(
              children: <Widget>[
                const Icon(
                  AbsAppIcons.logo_fill,
                  size: 70,
                  color: AppColors.greyLightest,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Text(title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 38,
                        color: Colors.white,
                        fontWeight: FontWeight.w900)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
            ),
            // = Actions
            Column(
              children: <Widget>[
                for (final button in buttons)
                  Container(
                      margin: const EdgeInsets.only(bottom: 20), child: button)
              ],
            )
          ],
        ),
      ),
    );
  }
}
