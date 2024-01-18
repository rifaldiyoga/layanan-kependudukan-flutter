import 'package:layanan_kependudukan/models/berpergian_model.dart';

class BerpergianResponseModel {
  String? message;
  int? code;
  String? status;
  BerpergianModel? data;

  BerpergianResponseModel({this.message, this.code, this.status, this.data});

  BerpergianResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? BerpergianModel.fromJson(json['data']) : null;
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
