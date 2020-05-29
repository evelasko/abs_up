import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RateDataChip extends StatelessWidget {
  final IconData icon;
  final Color colorActive;
  final Color colorInactive;
  final int total;
  final int actual;
  final double size;

  const RateDataChip({
    Key key,
    @required this.icon,
    @required this.colorActive,
    @required this.colorInactive,
    @required this.total,
    @required this.actual,
    @required this.size,
  }) : super(key: key);

  const RateDataChip.circle5(
    this.actual, {
    this.icon = FontAwesomeIcons.solidCircle,
    this.colorActive = AppColors.grey,
    this.colorInactive = AppColors.greyDark,
    this.total = 5,
    this.size = 9,
  });

  const RateDataChip.square5(
    this.actual, {
    this.icon = FontAwesomeIcons.solidSquare,
    this.colorActive = AppColors.grey,
    this.colorInactive = AppColors.greyDark,
    this.total = 5,
    this.size = 9,
  });

  Widget generator(int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Icon(
          icon,
          color: index <= (actual - 1) ? colorActive : colorInactive,
          size: size,
        ),
      );

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(total, generator),
      );
}
