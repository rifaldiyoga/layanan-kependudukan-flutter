class SignInModel {
  String email;
  String password;
  String type = "MOBILE";

  SignInModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["type"] = type;
    return data;
  }
}
