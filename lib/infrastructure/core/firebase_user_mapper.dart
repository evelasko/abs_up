import 'package:abs_up/domain/core/value_objects.dart';
import 'package:abs_up/domain/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserdomainX on FirebaseUser {
  User toDomain() {
    return User(id: UniqueId.fromUniqueString(uid));
  }
}
