import 'package:layanan_kependudukan/models/kepolisian_model.dart';

class KepolisianResponseModel {
  String? message;
  int? code;
  String? status;
  KepolisianModel? data;

  KepolisianResponseModel({this.message, this.code, this.status, this.data});

  KepolisianResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? KepolisianModel.fromJson(json['data']) : null;
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
