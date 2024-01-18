class SignInModel {
  String email;
  String password;
  String type = "MOBILE";
  String token = "";

  SignInModel({required this.email, required this.password, this.token = ""});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["type"] = type;
    data["token"] = token;
    return data;
  }
}
