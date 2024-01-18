import 'package:layanan_kependudukan/models/domisili_model.dart';

class DomisiliResponseModel {
  String? message;
  int? code;
  String? status;
  DomisiliModel? data;

  DomisiliResponseModel({this.message, this.code, this.status, this.data});

  DomisiliResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? DomisiliModel.fromJson(json['data']) : null;
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
