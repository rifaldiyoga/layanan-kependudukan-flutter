import 'package:layanan_kependudukan/models/kelahiran_model.dart';

class KelahiranResponseModel {
  String? message;
  int? code;
  String? status;
  KelahiranModel? data;

  KelahiranResponseModel({this.message, this.code, this.status, this.data});

  KelahiranResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? KelahiranModel.fromJson(json['data']) : null;
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
