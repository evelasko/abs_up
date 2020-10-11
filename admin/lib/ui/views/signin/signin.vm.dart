import 'package:abs_up_admin/services/auth/auth.i.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends ReactiveViewModel {
  final AuthInterface _authService;

  SignInViewModel(this._authService) : assert(_authService != null);

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _authService as ReactiveServiceMixin,
      ];

  bool get authenticated => _authService.authenticated;

  Future<void> singIn() => _authService.handleSignIn();
}
