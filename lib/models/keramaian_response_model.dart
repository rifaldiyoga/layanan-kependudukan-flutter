import 'package:layanan_kependudukan/models/keramaian_model.dart';

class KeramaianResponseModel {
  String? message;
  int? code;
  String? status;
  KeramaianModel? data;

  KeramaianResponseModel({this.message, this.code, this.status, this.data});

  KeramaianResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? KeramaianModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
