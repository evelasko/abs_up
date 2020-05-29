import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:flutter/material.dart';

class ListSmallItemWrapper extends StatelessWidget {
  final Widget child;
  const ListSmallItemWrapper({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints.expand(height: 60),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.greyDarkest))),
        child: child,
      );
}

class ListItemWrapper extends StatelessWidget {
  final Widget child;
  const ListItemWrapper({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints.expand(height: 100),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.greyDark))),
        child: child,
      );
}
