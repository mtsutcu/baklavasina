class AuthUser {
  final String? userEmail;
  final String? userID;

  AuthUser({required this.userEmail, required this.userID});

  Map<String, dynamic> toMap() {
    return {"userEmail:": userEmail, "userID": userID};
  }

  AuthUser.fromMap(Map<String, dynamic> map)
      : userEmail = map["userEmail"],
        userID = map["userID"];
}
