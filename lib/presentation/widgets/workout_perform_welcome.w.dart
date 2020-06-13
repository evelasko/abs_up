import 'package:flutter/material.dart';

import 'shared/app_logo_animated.w.dart';

class WorkoutPerformWelcome extends StatelessWidget {
  final List<IconData> equipmentIcons;
  final String duration;
  const WorkoutPerformWelcome({
    Key key,
    this.equipmentIcons,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/app_images/torso_1_hq-min.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(color: Colors.black54),
        FittedBox(
          child: Column(
            children: [
              const AnimatedLogo(),
              //= Overall duration
              const Padding(
                padding: EdgeInsets.only(top: 60, bottom: 10),
                child: Text('DURATION', style: headerStyle),
              ),
              Text(
                duration ?? '?...',
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 64,
                    fontWeight: FontWeight.w300,
                    color: Colors.white70,
                    decoration: TextDecoration.none),
              ),
              //= Required equipment
              equipmentIcons.isEmpty
                  ? Container()
                  : Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 60),
                          child: Text(
                            'EQUIPMENT',
                            style: headerStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                            top: 20,
                          ),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 20,
                            children: equipmentIcons
                                .map((icon) => Icon(
                                      icon,
                                      size: 64,
                                      color: Colors.white70,
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

const TextStyle headerStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 24,
  letterSpacing: 2,
  fontWeight: FontWeight.w800,
  color: Colors.white38,
  decoration: TextDecoration.none,
);
