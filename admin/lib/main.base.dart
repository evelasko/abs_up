import 'package:auto_route/auto_route.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart' hide Router;
import 'package:stacked_services/stacked_services.dart';

import 'app/init.dart';
import 'app/locator.dart';
import 'app/router.gr.dart';

void main([String env = 'prod']) => runApp(AbsUpManager(env: env));

class AbsUpManager extends StatelessWidget {
  final String env;

  const AbsUpManager({Key key, this.env = 'dev'}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder<bool>(
      future: initializeApp(),
      builder: (context, AsyncSnapshot<bool> snapshot) => !snapshot.hasData
          ? busyIndicator
          : snapshot.data
              ? NeumorphicApp(
                  title: 'AbsUp Management',
                  builder: ExtendedNavigator.builder<Router>(
                    router: Router(),
                    initialRoute: '/',
                  ),
                  onGenerateRoute: Router(),
                  navigatorKey: getIt<NavigationService>().navigatorKey,
                )
              : errorIndicator);
}

final busyIndicator = bareApp(const CircularProgressIndicator());
final errorIndicator = bareApp(const Text('Error while initializing the app'));

Widget bareApp(Widget child) => NeumorphicApp(
      home: Scaffold(body: Center(child: child)),
    );
