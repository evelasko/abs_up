import 'package:flutter/widgets.dart';

Widget choiceWidget(bool predicate, Widget right, [Widget left]) =>
    predicate ? right : left ?? const SizedBox.shrink();
