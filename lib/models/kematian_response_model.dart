import 'package:layanan_kependudukan/models/kematian_model.dart';

class KematianResponseModel {
  String? message;
  int? code;
  String? status;
  KematianModel? data;

  KematianResponseModel({this.message, this.code, this.status, this.data});

  KematianResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? KematianModel.fromJson(json['data']) : null;
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
