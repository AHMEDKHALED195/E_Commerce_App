class UserEntity {
  final String email;
  final String uId;
  final String displayName;
  UserEntity({
    required this.email,
    required this.uId,
    required this.displayName,
  });

  toMap() {
    return {'email': email, 'uId': uId, 'displayName': displayName};
  }
}
