import 'package:e_commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.displayName,
    required super.email,
    required super.uId,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      displayName: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      displayName: json['displayName'] ?? '',
      email: json['email'] ?? '',
      uId: json['uId'] ?? '',
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      displayName: user.displayName,
      email: user.email,
      uId: user.uId,
    );
  }

  toMap() {
    return {'displayName': displayName, 'email': email, 'uId': uId};
  }
}
