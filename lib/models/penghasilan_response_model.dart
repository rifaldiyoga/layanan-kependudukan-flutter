import 'package:layanan_kependudukan/models/penghasilan_model.dart';

class PenghasilanResponseModel {
  String? message;
  int? code;
  String? status;
  PenghasilanModel? data;

  PenghasilanResponseModel({this.message, this.code, this.status, this.data});

  PenghasilanResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data =
        json['data'] != null ? PenghasilanModel.fromJson(json['data']) : null;
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
