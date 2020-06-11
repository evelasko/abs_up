import 'package:abs_up/domain/core/value_objects.dart';
import 'package:abs_up/domain/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Extension to convert the Firebase user id
/// to this domain's value objet UniqueId
extension FirebaseUserdomainX on FirebaseUser {
  User toDomain() {
    return User(id: UniqueId.fromUniqueString(uid));
  }
}
