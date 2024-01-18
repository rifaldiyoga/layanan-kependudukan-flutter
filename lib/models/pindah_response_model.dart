import 'package:layanan_kependudukan/models/pindah_model.dart';

class PindahResponseModel {
  String? message;
  int? code;
  String? status;
  PindahModel? data;

  PindahResponseModel({this.message, this.code, this.status, this.data});

  PindahResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? PindahModel.fromJson(json['data']) : null;
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
