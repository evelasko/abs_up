import 'package:abs_up/presentation/theme/icons.dart';
import 'package:flutter/material.dart';

class AppFullLogo extends StatelessWidget {
  const AppFullLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            AbsAppIcons.logo_fill,
            color: Colors.white54,
            size: 64,
          ),
          const SizedBox(
            width: 10,
          ),
          RichText(
              textAlign: TextAlign.left,
              text: const TextSpan(children: [
                TextSpan(
                    text: "Misfit Coach 's\n",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Montserrat')),
                TextSpan(
                    text: 'AbsUp',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'))
              ]))
        ],
      ),
    );
  }
}
