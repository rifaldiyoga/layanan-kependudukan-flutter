import 'layanan_model.dart';

class LayananResponseModel {
  String? message;
  int? code;
  String? status;
  List<TypeModel> data = [];

  LayananResponseModel(
      {this.message, this.code, this.status, required this.data});

  LayananResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = <TypeModel>[];
      json['data'].forEach((v) {
        data.add(TypeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['status'] = status;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class TypeModel {
  String type = "";
  List<LayananModel> data = [];

  TypeModel({required this.type, required this.data});

  TypeModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      data = <LayananModel>[];
      json['data'].forEach((v) {
        data.add(LayananModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}
