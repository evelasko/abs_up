import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:flutter/material.dart';

class SwipableActionBackground extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  /// Primary action aligns to left, secondary aligns to right
  final bool primary;
  const SwipableActionBackground(
      {Key key,
      @required this.icon,
      @required this.text,
      @required this.primary,
      @required this.color})
      : super(key: key);

  const SwipableActionBackground.addToFavorites(
      {Key key,
      this.icon = Icons.favorite,
      this.text = 'add to\nfavorites',
      this.primary = true,
      this.color = Colors.green})
      : super(key: key);
  const SwipableActionBackground.addToBlacklist(
      {Key key,
      this.icon = Icons.not_interested,
      this.text = 'add to\nblacklist',
      this.primary = false,
      this.color = Colors.red})
      : super(key: key);
  const SwipableActionBackground.removeFromFavorites(
      {Key key,
      this.icon = Icons.favorite_border,
      this.text = 'remove from\nfavorites',
      this.primary = false,
      this.color = AppColors.brandeis})
      : super(key: key);
  const SwipableActionBackground.removeFromBlacklist(
      {Key key,
      this.icon = Icons.thumb_up,
      this.text = 'remove from\nblacklist',
      this.primary = false,
      this.color = AppColors.brandeis})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: primary ? Alignment.centerLeft : Alignment.centerRight,
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 22, color: Colors.white),
              Text(
                text.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      );
}
