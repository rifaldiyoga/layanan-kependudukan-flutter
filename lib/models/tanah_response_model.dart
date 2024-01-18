import 'package:layanan_kependudukan/models/tanah_model.dart';

class TanahResponseModel {
  String? message;
  int? code;
  String? status;
  TanahModel? data;

  TanahResponseModel({this.message, this.code, this.status, this.data});

  TanahResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? TanahModel.fromJson(json['data']) : null;
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
