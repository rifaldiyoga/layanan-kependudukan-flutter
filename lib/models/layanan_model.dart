class LayananModel {
  int id = -1;
  String code = "";
  String name = "";
  String type = "";

  LayananModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.type});

  LayananModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}
