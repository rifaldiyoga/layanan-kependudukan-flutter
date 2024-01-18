import 'package:layanan_kependudukan/models/belum_menikah_model.dart';

class BelumMenikahResponseModel {
  String? message;
  int? code;
  String? status;
  BelumMenikahModel? data;

  BelumMenikahResponseModel({this.message, this.code, this.status, this.data});

  BelumMenikahResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data =
        json['data'] != null ? BelumMenikahModel.fromJson(json['data']) : null;
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
