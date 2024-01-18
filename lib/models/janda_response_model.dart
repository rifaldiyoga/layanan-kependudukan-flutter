import 'package:layanan_kependudukan/models/janda_model.dart';

class JandaResponseModel {
  String? message;
  int? code;
  String? status;
  JandaModel? data;

  JandaResponseModel({this.message, this.code, this.status, this.data});

  JandaResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? JandaModel.fromJson(json['data']) : null;
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
