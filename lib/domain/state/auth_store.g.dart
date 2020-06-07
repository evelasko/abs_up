// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
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

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
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
  String toString() {
    final string =
        'authFormState: ${authFormState.toString()},user: ${user.toString()}';
    return '{$string}';
  }
}
