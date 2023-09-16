class SignUpModel {
  int? id;
  String name = "";
  String email = "";
  String nik = "";
  String? token;
  String? password;

  SignUpModel(
      {this.id,
      required this.name,
      required this.email,
      required this.nik,
      this.password,
      this.token});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    nik = json['nik'];
    token = json['token'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['nik'] = nik;
    data['token'] = token;
    data['password'] = password;
    return data;
  }
}
