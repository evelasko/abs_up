import 'package:stacked/stacked.dart';

import '../../../services/auth/auth.i.dart';

class HomeViewModel extends ReactiveViewModel {
  final AuthInterface _authService;

  HomeViewModel(this._authService) : assert(_authService != null);

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _authService as ReactiveServiceMixin,
      ];

  bool get authenticated => _authService.authenticated;
}
