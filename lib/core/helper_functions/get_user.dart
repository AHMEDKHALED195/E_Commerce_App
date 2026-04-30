import 'dart:convert';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/services/shared_prefrences_singelton.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var user = UserModel.fromJson(jsonDecode(jsonString));
  return user;
}
