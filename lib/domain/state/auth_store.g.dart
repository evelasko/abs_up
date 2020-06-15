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
          Computed<Option<String>>(() => super.displayName))
      .value;
  Computed<Option<List<WorkoutLog>>> _$userLogsComputed;

  @override
  Option<List<WorkoutLog>> get userLogs => (_$userLogsComputed ??=
          Computed<Option<List<WorkoutLog>>>(() => super.userLogs))
      .value;
  Computed<Option<List<String>>> _$userActivityComputed;

  @override
  Option<List<String>> get userActivity => (_$userActivityComputed ??=
          Computed<Option<List<String>>>(() => super.userActivity))
      .value;

  final _$authFormStateAtom = Atom(name: '_AuthStore.authFormState');

  @override
  AuthFormState get authFormState {
    _$authFormStateAtom.context.enforceReadPolicy(_$authFormStateAtom);
    _$authFormStateAtom.reportObserved();
    return super.authFormState;
  }

  @override
  set authFormState(AuthFormState value) {
    _$authFormStateAtom.context.conditionallyRunInAction(() {
      super.authFormState = value;
      _$authFormStateAtom.reportChanged();
    }, _$authFormStateAtom, name: '${_$authFormStateAtom.name}_set');
  }

  final _$userAtom = Atom(name: '_AuthStore.user');

  @override
  Option<User> get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(Option<User> value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$authStateAtom = Atom(name: '_AuthStore.authState');

  @override
  AuthState get authState {
    _$authStateAtom.context.enforceReadPolicy(_$authStateAtom);
    _$authStateAtom.reportObserved();
    return super.authState;
  }

  @override
  set authState(AuthState value) {
    _$authStateAtom.context.conditionallyRunInAction(() {
      super.authState = value;
      _$authStateAtom.reportChanged();
    }, _$authStateAtom, name: '${_$authStateAtom.name}_set');
  }

  final _$signInWithAppleAvailableAtom =
      Atom(name: '_AuthStore.signInWithAppleAvailable');

  @override
  bool get signInWithAppleAvailable {
    _$signInWithAppleAvailableAtom.context
        .enforceReadPolicy(_$signInWithAppleAvailableAtom);
    _$signInWithAppleAvailableAtom.reportObserved();
    return super.signInWithAppleAvailable;
  }

  @override
  set signInWithAppleAvailable(bool value) {
    _$signInWithAppleAvailableAtom.context.conditionallyRunInAction(() {
      super.signInWithAppleAvailable = value;
      _$signInWithAppleAvailableAtom.reportChanged();
    }, _$signInWithAppleAvailableAtom,
        name: '${_$signInWithAppleAvailableAtom.name}_set');
  }

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future<Option<User>> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$checkSignInWithAppleAvailabilityAsyncAction =
      AsyncAction('checkSignInWithAppleAvailability');

  @override
  Future<void> checkSignInWithAppleAvailability() {
    return _$checkSignInWithAppleAvailabilityAsyncAction
        .run(() => super.checkSignInWithAppleAvailability());
  }

  final _$authCheckAsyncAction = AsyncAction('authCheck');

  @override
  Future<bool> authCheck() {
    return _$authCheckAsyncAction.run(() => super.authCheck());
  }

  final _$getUserDisplayNameAsyncAction = AsyncAction('getUserDisplayName');

  @override
  Future<Option<String>> getUserDisplayName() {
    return _$getUserDisplayNameAsyncAction
        .run(() => super.getUserDisplayName());
  }

  final _$registerWithEmailAndPasswordAsyncAction =
      AsyncAction('registerWithEmailAndPassword');

  @override
  Future<void> registerWithEmailAndPassword() {
    return _$registerWithEmailAndPasswordAsyncAction
        .run(() => super.registerWithEmailAndPassword());
  }

  final _$logInWithEmailAndPasswordAsyncAction =
      AsyncAction('logInWithEmailAndPassword');

  @override
  Future<void> logInWithEmailAndPassword() {
    return _$logInWithEmailAndPasswordAsyncAction
        .run(() => super.logInWithEmailAndPassword());
  }

  final _$signInWithGooglePressedAsyncAction =
      AsyncAction('signInWithGooglePressed');

  @override
  Future<void> signInWithGooglePressed() {
    return _$signInWithGooglePressedAsyncAction
        .run(() => super.signInWithGooglePressed());
  }

  final _$signInWithApplePressedAsyncAction =
      AsyncAction('signInWithApplePressed');

  @override
  Future<void> signInWithApplePressed() {
    return _$signInWithApplePressedAsyncAction
        .run(() => super.signInWithApplePressed());
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  void initAuthForm() {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.initAuthForm();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emailChanged(String email) {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.emailChanged(email);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passwordChanged(String password) {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.passwordChanged(password);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logOutUser() {
    final _$actionInfo = _$_AuthStoreActionController.startAction();
    try {
      return super.logOutUser();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'authFormState: ${authFormState.toString()},user: ${user.toString()},authState: ${authState.toString()},signInWithAppleAvailable: ${signInWithAppleAvailable.toString()},displayName: ${displayName.toString()},userLogs: ${userLogs.toString()},userActivity: ${userActivity.toString()}';
    return '{$string}';
  }
}
