import 'package:auto_route/auto_route_annotations.dart';

import '../ui/views/home/home.vw.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView, name: 'home', initial: true),
  ],
)
class $Router {}
