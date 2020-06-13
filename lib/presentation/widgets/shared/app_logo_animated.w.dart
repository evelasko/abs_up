import 'dart:async';

import 'package:abs_up/presentation/theme/icons.t.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  final double logoSize;
  final Color initialColor;
  final Color finalColor;
  const AnimatedLogo({
    Key key,
    this.logoSize = 120,
    this.initialColor = Colors.white24,
    this.finalColor = Colors.white,
  }) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  int step = 0;

  @override
  void initState() {
    super.initState();
    step = 0;
    startAnimation();
  }

  void startAnimation() {
    Timer.periodic(const Duration(seconds: 1),
        (timer) => step == 5 ? timer.cancel() : setState(() => step += 1));
  }

  @override
  Widget build(BuildContext context) => Stack(
          children: [
        AbsAppIcons.logo_fill,
        AbsAppIcons.logo_step_0,
        AbsAppIcons.logo_step_1,
        AbsAppIcons.logo_step_2,
        AbsAppIcons.logo_step_3,
        AbsAppIcons.logo_step_4
      ]
              .asMap()
              .map<int, AnimatedOpacity>(
                (key, icon) => MapEntry(
                  key,
                  AnimatedOpacity(
                    opacity: key <= step ? 1 : 0,
                    duration: Duration(
                      milliseconds:
                          (const Duration(seconds: 1).inMilliseconds / 6)
                              .round(),
                    ),
                    child: Icon(
                      icon,
                      size: widget.logoSize,
                      color: icon == AbsAppIcons.logo_fill
                          ? widget.initialColor
                          : widget.finalColor,
                    ),
                  ),
                ),
              )
              .values
              .toList());
}
