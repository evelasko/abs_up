import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final getIt = GetIt.instance;

/// Register dependency instances for injection
@injectableInit
Future<void> setupLocator(String env) async {
  await $initGetIt(getIt, environment: env);
}
