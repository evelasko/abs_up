// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  Computed<Option<String>> _$displayNameComputed;

  @override
  Option<String> get displayName => (_$displayNameComputed ??=
          Computed<Option<String>>(() => super.displayName,
              name: '_AuthStore.displayName'))
      .value;

  final _$authFormStateAtom = Atom(name: '_AuthStore.authFormState');

  @override
  AuthFormState get authFormState {
    _$authFormStateAtom.reportRead();
    return super.authFormState;
  }

  @override
  set authFormState(AuthFormState value) {
    _$authFormStateAtom.reportWrite(value, super.authFormState, () {
      super.authFormState = value;
    });
  }

  final _$userAtom = Atom(name: '_AuthStore.user');

  @override
  Option<User> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Option<User> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$authStateAtom = Atom(name: '_AuthStore.authState');

  @override
  AuthState get authState {
    _$authStateAtom.reportRead();
    return super.authState;
  }

  @override
  set authState(AuthState value) {
    _$authStateAtom.reportWrite(value, super.authState, () {
      super.authState = value;
    });
  }

  final _$signInWithAppleAvailableAtom =
      Atom(name: '_AuthStore.signInWithAppleAvailable');

  @override
  bool get signInWithAppleAvailable {
    _$signInWithAppleAvailableAtom.reportRead();
    return super.signInWithAppleAvailable;
  }

  @override
  set signInWithAppleAvailable(bool value) {
    _$signInWithAppleAvailableAtom
        .reportWrite(value, super.signInWithAppleAvailable, () {
      super.signInWithAppleAvailable = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_AuthStore.getUser');

  @override
  Future<Option<User>> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$checkSignInWithAppleAvailabilityAsyncAction =
      AsyncAction('_AuthStore.checkSignInWithAppleAvailability');

  @override
  Future<void> checkSignInWithAppleAvailability() {
    return _$checkSignInWithAppleAvailabilityAsyncAction
        .run(() => super.checkSignInWithAppleAvailability());
  }

  final _$authCheckAsyncAction = AsyncAction('_AuthStore.authCheck');

  @override
  Future<bool> authCheck() {
    return _$authCheckAsyncAction.run(() => super.authCheck());
  }

  final _$getUserDisplayNameAsyncAction =
      AsyncAction('_AuthStore.getUserDisplayName');

  @override
  Future<Option<String>> getUserDisplayName() {
    return _$getUserDisplayNameAsyncAction
        .run(() => super.getUserDisplayName());
  }

  final _$registerWithEmailAndPasswordAsyncAction =
      AsyncAction('_AuthStore.registerWithEmailAndPassword');

  @override
  Future<void> registerWithEmailAndPassword() {
    return _$registerWithEmailAndPasswordAsyncAction
        .run(() => super.registerWithEmailAndPassword());
  }

  final _$logInWithEmailAndPasswordAsyncAction =
      AsyncAction('_AuthStore.logInWithEmailAndPassword');

  @override
  Future<void> logInWithEmailAndPassword() {
    return _$logInWithEmailAndPasswordAsyncAction
        .run(() => super.logInWithEmailAndPassword());
  }

  final _$signInWithGooglePressedAsyncAction =
      AsyncAction('_AuthStore.signInWithGooglePressed');

  @override
  Future<void> signInWithGooglePressed() {
    return _$signInWithGooglePressedAsyncAction
        .run(() => super.signInWithGooglePressed());
  }

  final _$signInWithApplePressedAsyncAction =
      AsyncAction('_AuthStore.signInWithApplePressed');

  @override
  Future<void> signInWithApplePressed() {
    return _$signInWithApplePressedAsyncAction
        .run(() => super.signInWithApplePressed());
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  void initAuthForm() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.initAuthForm');
    try {
      return super.initAuthForm();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emailChanged(String email) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.emailChanged');
    try {
      return super.emailChanged(email);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passwordChanged(String password) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.passwordChanged');
    try {
      return super.passwordChanged(password);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logOutUser() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.logOutUser');
    try {
      return super.logOutUser();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authFormState: ${authFormState},
user: ${user},
authState: ${authState},
signInWithAppleAvailable: ${signInWithAppleAvailable},
displayName: ${displayName}
    ''';
  }
}
