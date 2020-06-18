// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  InvalidEmail<T> invalidEmail<T>({@required T failedValue, int maxAllowed}) {
    return InvalidEmail<T>(
      failedValue: failedValue,
      maxAllowed: maxAllowed,
    );
  }

  EmptyLine<T> emptyLine<T>({@required T failedValue}) {
    return EmptyLine<T>(
      failedValue: failedValue,
    );
  }

  InsecurePassword<T> insecurePassword<T>({@required T fieldValue}) {
    return InsecurePassword<T>(
      fieldValue: fieldValue,
    );
  }

  TextTooLong<T> textTooLong<T>({@required T fieldValue}) {
    return TextTooLong<T>(
      fieldValue: fieldValue,
    );
  }
}

// ignore: unused_element
const $ValueFailure = _$ValueFailureTearOff();

mixin _$ValueFailure<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(T failedValue, int maxAllowed),
    @required Result emptyLine(T failedValue),
    @required Result insecurePassword(T fieldValue),
    @required Result textTooLong(T fieldValue),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(T failedValue, int maxAllowed),
    Result emptyLine(T failedValue),
    Result insecurePassword(T fieldValue),
    Result textTooLong(T fieldValue),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result emptyLine(EmptyLine<T> value),
    @required Result insecurePassword(InsecurePassword<T> value),
    @required Result textTooLong(TextTooLong<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result emptyLine(EmptyLine<T> value),
    Result insecurePassword(InsecurePassword<T> value),
    Result textTooLong(TextTooLong<T> value),
    @required Result orElse(),
  });
}

abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
}

class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;
}

abstract class $InvalidEmailCopyWith<T, $Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail<T> value, $Res Function(InvalidEmail<T>) then) =
      _$InvalidEmailCopyWithImpl<T, $Res>;
  $Res call({T failedValue, int maxAllowed});
}

class _$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidEmailCopyWith<T, $Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail<T> _value, $Res Function(InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as InvalidEmail<T>));

  @override
  InvalidEmail<T> get _value => super._value as InvalidEmail<T>;

  @override
  $Res call({
    Object failedValue = freezed,
    Object maxAllowed = freezed,
  }) {
    return _then(InvalidEmail<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
      maxAllowed: maxAllowed == freezed ? _value.maxAllowed : maxAllowed as int,
    ));
  }
}

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({@required this.failedValue, this.maxAllowed})
      : assert(failedValue != null);

  @override
  final T failedValue;
  @override
  final int maxAllowed;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue, maxAllowed: $maxAllowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEmail<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)) &&
            (identical(other.maxAllowed, maxAllowed) ||
                const DeepCollectionEquality()
                    .equals(other.maxAllowed, maxAllowed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedValue) ^
      const DeepCollectionEquality().hash(maxAllowed);

  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      _$InvalidEmailCopyWithImpl<T, InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(T failedValue, int maxAllowed),
    @required Result emptyLine(T failedValue),
    @required Result insecurePassword(T fieldValue),
    @required Result textTooLong(T fieldValue),
  }) {
    assert(invalidEmail != null);
    assert(emptyLine != null);
    assert(insecurePassword != null);
    assert(textTooLong != null);
    return invalidEmail(failedValue, maxAllowed);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(T failedValue, int maxAllowed),
    Result emptyLine(T failedValue),
    Result insecurePassword(T fieldValue),
    Result textTooLong(T fieldValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(failedValue, maxAllowed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result emptyLine(EmptyLine<T> value),
    @required Result insecurePassword(InsecurePassword<T> value),
    @required Result textTooLong(TextTooLong<T> value),
  }) {
    assert(invalidEmail != null);
    assert(emptyLine != null);
    assert(insecurePassword != null);
    assert(textTooLong != null);
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result emptyLine(EmptyLine<T> value),
    Result insecurePassword(InsecurePassword<T> value),
    Result textTooLong(TextTooLong<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({@required T failedValue, int maxAllowed}) =
      _$InvalidEmail<T>;

  T get failedValue;
  int get maxAllowed;
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith;
}

abstract class $EmptyLineCopyWith<T, $Res> {
  factory $EmptyLineCopyWith(
          EmptyLine<T> value, $Res Function(EmptyLine<T>) then) =
      _$EmptyLineCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

class _$EmptyLineCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $EmptyLineCopyWith<T, $Res> {
  _$EmptyLineCopyWithImpl(
      EmptyLine<T> _value, $Res Function(EmptyLine<T>) _then)
      : super(_value, (v) => _then(v as EmptyLine<T>));

  @override
  EmptyLine<T> get _value => super._value as EmptyLine<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(EmptyLine<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$EmptyLine<T> implements EmptyLine<T> {
  const _$EmptyLine({@required this.failedValue}) : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.emptyLine(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmptyLine<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $EmptyLineCopyWith<T, EmptyLine<T>> get copyWith =>
      _$EmptyLineCopyWithImpl<T, EmptyLine<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(T failedValue, int maxAllowed),
    @required Result emptyLine(T failedValue),
    @required Result insecurePassword(T fieldValue),
    @required Result textTooLong(T fieldValue),
  }) {
    assert(invalidEmail != null);
    assert(emptyLine != null);
    assert(insecurePassword != null);
    assert(textTooLong != null);
    return emptyLine(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(T failedValue, int maxAllowed),
    Result emptyLine(T failedValue),
    Result insecurePassword(T fieldValue),
    Result textTooLong(T fieldValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emptyLine != null) {
      return emptyLine(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result emptyLine(EmptyLine<T> value),
    @required Result insecurePassword(InsecurePassword<T> value),
    @required Result textTooLong(TextTooLong<T> value),
  }) {
    assert(invalidEmail != null);
    assert(emptyLine != null);
    assert(insecurePassword != null);
    assert(textTooLong != null);
    return emptyLine(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result emptyLine(EmptyLine<T> value),
    Result insecurePassword(InsecurePassword<T> value),
    Result textTooLong(TextTooLong<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emptyLine != null) {
      return emptyLine(this);
    }
    return orElse();
  }
}

abstract class EmptyLine<T> implements ValueFailure<T> {
  const factory EmptyLine({@required T failedValue}) = _$EmptyLine<T>;

  T get failedValue;
  $EmptyLineCopyWith<T, EmptyLine<T>> get copyWith;
}

abstract class $InsecurePasswordCopyWith<T, $Res> {
  factory $InsecurePasswordCopyWith(
          InsecurePassword<T> value, $Res Function(InsecurePassword<T>) then) =
      _$InsecurePasswordCopyWithImpl<T, $Res>;
  $Res call({T fieldValue});
}

class _$InsecurePasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InsecurePasswordCopyWith<T, $Res> {
  _$InsecurePasswordCopyWithImpl(
      InsecurePassword<T> _value, $Res Function(InsecurePassword<T>) _then)
      : super(_value, (v) => _then(v as InsecurePassword<T>));

  @override
  InsecurePassword<T> get _value => super._value as InsecurePassword<T>;

  @override
  $Res call({
    Object fieldValue = freezed,
  }) {
    return _then(InsecurePassword<T>(
      fieldValue: fieldValue == freezed ? _value.fieldValue : fieldValue as T,
    ));
  }
}

class _$InsecurePassword<T> implements InsecurePassword<T> {
  const _$InsecurePassword({@required this.fieldValue})
      : assert(fieldValue != null);

  @override
  final T fieldValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.insecurePassword(fieldValue: $fieldValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InsecurePassword<T> &&
            (identical(other.fieldValue, fieldValue) ||
                const DeepCollectionEquality()
                    .equals(other.fieldValue, fieldValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(fieldValue);

  @override
  $InsecurePasswordCopyWith<T, InsecurePassword<T>> get copyWith =>
      _$InsecurePasswordCopyWithImpl<T, InsecurePassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(T failedValue, int maxAllowed),
    @required Result emptyLine(T failedValue),
    @required Result insecurePassword(T fieldValue),
    @required Result textTooLong(T fieldValue),
  }) {
    assert(invalidEmail != null);
    assert(emptyLine != null);
    assert(insecurePassword != null);
    assert(textTooLong != null);
    return insecurePassword(fieldValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(T failedValue, int maxAllowed),
    Result emptyLine(T failedValue),
    Result insecurePassword(T fieldValue),
    Result textTooLong(T fieldValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (insecurePassword != null) {
      return insecurePassword(fieldValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result emptyLine(EmptyLine<T> value),
    @required Result insecurePassword(InsecurePassword<T> value),
    @required Result textTooLong(TextTooLong<T> value),
  }) {
    assert(invalidEmail != null);
    assert(emptyLine != null);
    assert(insecurePassword != null);
    assert(textTooLong != null);
    return insecurePassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result emptyLine(EmptyLine<T> value),
    Result insecurePassword(InsecurePassword<T> value),
    Result textTooLong(TextTooLong<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (insecurePassword != null) {
      return insecurePassword(this);
    }
    return orElse();
  }
}

abstract class InsecurePassword<T> implements ValueFailure<T> {
  const factory InsecurePassword({@required T fieldValue}) =
      _$InsecurePassword<T>;

  T get fieldValue;
  $InsecurePasswordCopyWith<T, InsecurePassword<T>> get copyWith;
}

abstract class $TextTooLongCopyWith<T, $Res> {
  factory $TextTooLongCopyWith(
          TextTooLong<T> value, $Res Function(TextTooLong<T>) then) =
      _$TextTooLongCopyWithImpl<T, $Res>;
  $Res call({T fieldValue});
}

class _$TextTooLongCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $TextTooLongCopyWith<T, $Res> {
  _$TextTooLongCopyWithImpl(
      TextTooLong<T> _value, $Res Function(TextTooLong<T>) _then)
      : super(_value, (v) => _then(v as TextTooLong<T>));

  @override
  TextTooLong<T> get _value => super._value as TextTooLong<T>;

  @override
  $Res call({
    Object fieldValue = freezed,
  }) {
    return _then(TextTooLong<T>(
      fieldValue: fieldValue == freezed ? _value.fieldValue : fieldValue as T,
    ));
  }
}

class _$TextTooLong<T> implements TextTooLong<T> {
  const _$TextTooLong({@required this.fieldValue}) : assert(fieldValue != null);

  @override
  final T fieldValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.textTooLong(fieldValue: $fieldValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TextTooLong<T> &&
            (identical(other.fieldValue, fieldValue) ||
                const DeepCollectionEquality()
                    .equals(other.fieldValue, fieldValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(fieldValue);

  @override
  $TextTooLongCopyWith<T, TextTooLong<T>> get copyWith =>
      _$TextTooLongCopyWithImpl<T, TextTooLong<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidEmail(T failedValue, int maxAllowed),
    @required Result emptyLine(T failedValue),
    @required Result insecurePassword(T fieldValue),
    @required Result textTooLong(T fieldValue),
  }) {
    assert(invalidEmail != null);
    assert(emptyLine != null);
    assert(insecurePassword != null);
    assert(textTooLong != null);
    return textTooLong(fieldValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidEmail(T failedValue, int maxAllowed),
    Result emptyLine(T failedValue),
    Result insecurePassword(T fieldValue),
    Result textTooLong(T fieldValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (textTooLong != null) {
      return textTooLong(fieldValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result emptyLine(EmptyLine<T> value),
    @required Result insecurePassword(InsecurePassword<T> value),
    @required Result textTooLong(TextTooLong<T> value),
  }) {
    assert(invalidEmail != null);
    assert(emptyLine != null);
    assert(insecurePassword != null);
    assert(textTooLong != null);
    return textTooLong(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidEmail(InvalidEmail<T> value),
    Result emptyLine(EmptyLine<T> value),
    Result insecurePassword(InsecurePassword<T> value),
    Result textTooLong(TextTooLong<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (textTooLong != null) {
      return textTooLong(this);
    }
    return orElse();
  }
}

abstract class TextTooLong<T> implements ValueFailure<T> {
  const factory TextTooLong({@required T fieldValue}) = _$TextTooLong<T>;

  T get fieldValue;
  $TextTooLongCopyWith<T, TextTooLong<T>> get copyWith;
}

class _$CoreFailureTearOff {
  const _$CoreFailureTearOff();

  InternalError<T> internalError<T>({@required T message}) {
    return InternalError<T>(
      message: message,
    );
  }
}

// ignore: unused_element
const $CoreFailure = _$CoreFailureTearOff();

mixin _$CoreFailure<T> {
  T get message;

  $CoreFailureCopyWith<T, CoreFailure<T>> get copyWith;
}

abstract class $CoreFailureCopyWith<T, $Res> {
  factory $CoreFailureCopyWith(
          CoreFailure<T> value, $Res Function(CoreFailure<T>) then) =
      _$CoreFailureCopyWithImpl<T, $Res>;
  $Res call({T message});
}

class _$CoreFailureCopyWithImpl<T, $Res>
    implements $CoreFailureCopyWith<T, $Res> {
  _$CoreFailureCopyWithImpl(this._value, this._then);

  final CoreFailure<T> _value;
  // ignore: unused_field
  final $Res Function(CoreFailure<T>) _then;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as T,
    ));
  }
}

abstract class $InternalErrorCopyWith<T, $Res>
    implements $CoreFailureCopyWith<T, $Res> {
  factory $InternalErrorCopyWith(
          InternalError<T> value, $Res Function(InternalError<T>) then) =
      _$InternalErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({T message});
}

class _$InternalErrorCopyWithImpl<T, $Res>
    extends _$CoreFailureCopyWithImpl<T, $Res>
    implements $InternalErrorCopyWith<T, $Res> {
  _$InternalErrorCopyWithImpl(
      InternalError<T> _value, $Res Function(InternalError<T>) _then)
      : super(_value, (v) => _then(v as InternalError<T>));

  @override
  InternalError<T> get _value => super._value as InternalError<T>;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(InternalError<T>(
      message: message == freezed ? _value.message : message as T,
    ));
  }
}

class _$InternalError<T> implements InternalError<T> {
  const _$InternalError({@required this.message}) : assert(message != null);

  @override
  final T message;

  @override
  String toString() {
    return 'CoreFailure<$T>.internalError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InternalError<T> &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $InternalErrorCopyWith<T, InternalError<T>> get copyWith =>
      _$InternalErrorCopyWithImpl<T, InternalError<T>>(this, _$identity);
}

abstract class InternalError<T> implements CoreFailure<T> {
  const factory InternalError({@required T message}) = _$InternalError<T>;

  @override
  T get message;
  @override
  $InternalErrorCopyWith<T, InternalError<T>> get copyWith;
}

class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  CancelledByUser cancelledByUser() {
    return const CancelledByUser();
  }

  ServerError serverError() {
    return const ServerError();
  }

  EmailAlreadyInUse emailAlreadyInUse() {
    return const EmailAlreadyInUse();
  }

  InvalidCredentials invalidCredentials() {
    return const InvalidCredentials();
  }

  AppleSignInNotAvailable appleSignInNotAvailable() {
    return const AppleSignInNotAvailable();
  }
}

// ignore: unused_element
const $AuthFailure = _$AuthFailureTearOff();

mixin _$AuthFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cancelledByUser(),
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result invalidCredentials(),
    @required Result appleSignInNotAvailable(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cancelledByUser(),
    Result serverError(),
    Result emailAlreadyInUse(),
    Result invalidCredentials(),
    Result appleSignInNotAvailable(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cancelledByUser(CancelledByUser value),
    @required Result serverError(ServerError value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse value),
    @required Result invalidCredentials(InvalidCredentials value),
    @required Result appleSignInNotAvailable(AppleSignInNotAvailable value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cancelledByUser(CancelledByUser value),
    Result serverError(ServerError value),
    Result emailAlreadyInUse(EmailAlreadyInUse value),
    Result invalidCredentials(InvalidCredentials value),
    Result appleSignInNotAvailable(AppleSignInNotAvailable value),
    @required Result orElse(),
  });
}

abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

abstract class $CancelledByUserCopyWith<$Res> {
  factory $CancelledByUserCopyWith(
          CancelledByUser value, $Res Function(CancelledByUser) then) =
      _$CancelledByUserCopyWithImpl<$Res>;
}

class _$CancelledByUserCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $CancelledByUserCopyWith<$Res> {
  _$CancelledByUserCopyWithImpl(
      CancelledByUser _value, $Res Function(CancelledByUser) _then)
      : super(_value, (v) => _then(v as CancelledByUser));

  @override
  CancelledByUser get _value => super._value as CancelledByUser;
}

class _$CancelledByUser implements CancelledByUser {
  const _$CancelledByUser();

  @override
  String toString() {
    return 'AuthFailure.cancelledByUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CancelledByUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cancelledByUser(),
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result invalidCredentials(),
    @required Result appleSignInNotAvailable(),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidCredentials != null);
    assert(appleSignInNotAvailable != null);
    return cancelledByUser();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cancelledByUser(),
    Result serverError(),
    Result emailAlreadyInUse(),
    Result invalidCredentials(),
    Result appleSignInNotAvailable(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cancelledByUser != null) {
      return cancelledByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cancelledByUser(CancelledByUser value),
    @required Result serverError(ServerError value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse value),
    @required Result invalidCredentials(InvalidCredentials value),
    @required Result appleSignInNotAvailable(AppleSignInNotAvailable value),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidCredentials != null);
    assert(appleSignInNotAvailable != null);
    return cancelledByUser(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cancelledByUser(CancelledByUser value),
    Result serverError(ServerError value),
    Result emailAlreadyInUse(EmailAlreadyInUse value),
    Result invalidCredentials(InvalidCredentials value),
    Result appleSignInNotAvailable(AppleSignInNotAvailable value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cancelledByUser != null) {
      return cancelledByUser(this);
    }
    return orElse();
  }
}

abstract class CancelledByUser implements AuthFailure {
  const factory CancelledByUser() = _$CancelledByUser;
}

abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

class _$ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cancelledByUser(),
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result invalidCredentials(),
    @required Result appleSignInNotAvailable(),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidCredentials != null);
    assert(appleSignInNotAvailable != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cancelledByUser(),
    Result serverError(),
    Result emailAlreadyInUse(),
    Result invalidCredentials(),
    Result appleSignInNotAvailable(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cancelledByUser(CancelledByUser value),
    @required Result serverError(ServerError value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse value),
    @required Result invalidCredentials(InvalidCredentials value),
    @required Result appleSignInNotAvailable(AppleSignInNotAvailable value),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidCredentials != null);
    assert(appleSignInNotAvailable != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cancelledByUser(CancelledByUser value),
    Result serverError(ServerError value),
    Result emailAlreadyInUse(EmailAlreadyInUse value),
    Result invalidCredentials(InvalidCredentials value),
    Result appleSignInNotAvailable(AppleSignInNotAvailable value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AuthFailure {
  const factory ServerError() = _$ServerError;
}

abstract class $EmailAlreadyInUseCopyWith<$Res> {
  factory $EmailAlreadyInUseCopyWith(
          EmailAlreadyInUse value, $Res Function(EmailAlreadyInUse) then) =
      _$EmailAlreadyInUseCopyWithImpl<$Res>;
}

class _$EmailAlreadyInUseCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $EmailAlreadyInUseCopyWith<$Res> {
  _$EmailAlreadyInUseCopyWithImpl(
      EmailAlreadyInUse _value, $Res Function(EmailAlreadyInUse) _then)
      : super(_value, (v) => _then(v as EmailAlreadyInUse));

  @override
  EmailAlreadyInUse get _value => super._value as EmailAlreadyInUse;
}

class _$EmailAlreadyInUse implements EmailAlreadyInUse {
  const _$EmailAlreadyInUse();

  @override
  String toString() {
    return 'AuthFailure.emailAlreadyInUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmailAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cancelledByUser(),
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result invalidCredentials(),
    @required Result appleSignInNotAvailable(),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidCredentials != null);
    assert(appleSignInNotAvailable != null);
    return emailAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cancelledByUser(),
    Result serverError(),
    Result emailAlreadyInUse(),
    Result invalidCredentials(),
    Result appleSignInNotAvailable(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cancelledByUser(CancelledByUser value),
    @required Result serverError(ServerError value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse value),
    @required Result invalidCredentials(InvalidCredentials value),
    @required Result appleSignInNotAvailable(AppleSignInNotAvailable value),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidCredentials != null);
    assert(appleSignInNotAvailable != null);
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cancelledByUser(CancelledByUser value),
    Result serverError(ServerError value),
    Result emailAlreadyInUse(EmailAlreadyInUse value),
    Result invalidCredentials(InvalidCredentials value),
    Result appleSignInNotAvailable(AppleSignInNotAvailable value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUse implements AuthFailure {
  const factory EmailAlreadyInUse() = _$EmailAlreadyInUse;
}

abstract class $InvalidCredentialsCopyWith<$Res> {
  factory $InvalidCredentialsCopyWith(
          InvalidCredentials value, $Res Function(InvalidCredentials) then) =
      _$InvalidCredentialsCopyWithImpl<$Res>;
}

class _$InvalidCredentialsCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $InvalidCredentialsCopyWith<$Res> {
  _$InvalidCredentialsCopyWithImpl(
      InvalidCredentials _value, $Res Function(InvalidCredentials) _then)
      : super(_value, (v) => _then(v as InvalidCredentials));

  @override
  InvalidCredentials get _value => super._value as InvalidCredentials;
}

class _$InvalidCredentials implements InvalidCredentials {
  const _$InvalidCredentials();

  @override
  String toString() {
    return 'AuthFailure.invalidCredentials()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidCredentials);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cancelledByUser(),
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result invalidCredentials(),
    @required Result appleSignInNotAvailable(),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidCredentials != null);
    assert(appleSignInNotAvailable != null);
    return invalidCredentials();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cancelledByUser(),
    Result serverError(),
    Result emailAlreadyInUse(),
    Result invalidCredentials(),
    Result appleSignInNotAvailable(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidCredentials != null) {
      return invalidCredentials();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cancelledByUser(CancelledByUser value),
    @required Result serverError(ServerError value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse value),
    @required Result invalidCredentials(InvalidCredentials value),
    @required Result appleSignInNotAvailable(AppleSignInNotAvailable value),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidCredentials != null);
    assert(appleSignInNotAvailable != null);
    return invalidCredentials(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cancelledByUser(CancelledByUser value),
    Result serverError(ServerError value),
    Result emailAlreadyInUse(EmailAlreadyInUse value),
    Result invalidCredentials(InvalidCredentials value),
    Result appleSignInNotAvailable(AppleSignInNotAvailable value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class InvalidCredentials implements AuthFailure {
  const factory InvalidCredentials() = _$InvalidCredentials;
}

abstract class $AppleSignInNotAvailableCopyWith<$Res> {
  factory $AppleSignInNotAvailableCopyWith(AppleSignInNotAvailable value,
          $Res Function(AppleSignInNotAvailable) then) =
      _$AppleSignInNotAvailableCopyWithImpl<$Res>;
}

class _$AppleSignInNotAvailableCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $AppleSignInNotAvailableCopyWith<$Res> {
  _$AppleSignInNotAvailableCopyWithImpl(AppleSignInNotAvailable _value,
      $Res Function(AppleSignInNotAvailable) _then)
      : super(_value, (v) => _then(v as AppleSignInNotAvailable));

  @override
  AppleSignInNotAvailable get _value => super._value as AppleSignInNotAvailable;
}

class _$AppleSignInNotAvailable implements AppleSignInNotAvailable {
  const _$AppleSignInNotAvailable();

  @override
  String toString() {
    return 'AuthFailure.appleSignInNotAvailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AppleSignInNotAvailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cancelledByUser(),
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result invalidCredentials(),
    @required Result appleSignInNotAvailable(),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidCredentials != null);
    assert(appleSignInNotAvailable != null);
    return appleSignInNotAvailable();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cancelledByUser(),
    Result serverError(),
    Result emailAlreadyInUse(),
    Result invalidCredentials(),
    Result appleSignInNotAvailable(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (appleSignInNotAvailable != null) {
      return appleSignInNotAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cancelledByUser(CancelledByUser value),
    @required Result serverError(ServerError value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse value),
    @required Result invalidCredentials(InvalidCredentials value),
    @required Result appleSignInNotAvailable(AppleSignInNotAvailable value),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidCredentials != null);
    assert(appleSignInNotAvailable != null);
    return appleSignInNotAvailable(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cancelledByUser(CancelledByUser value),
    Result serverError(ServerError value),
    Result emailAlreadyInUse(EmailAlreadyInUse value),
    Result invalidCredentials(InvalidCredentials value),
    Result appleSignInNotAvailable(AppleSignInNotAvailable value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (appleSignInNotAvailable != null) {
      return appleSignInNotAvailable(this);
    }
    return orElse();
  }
}

abstract class AppleSignInNotAvailable implements AuthFailure {
  const factory AppleSignInNotAvailable() = _$AppleSignInNotAvailable;
}
