import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../core/value_objects.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @required UniqueId id,
    @required Option<String> displayName,
  }) = _User;
}
