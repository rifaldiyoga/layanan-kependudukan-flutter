import 'package:layanan_kependudukan/models/pernah_menikah_model.dart';

class PernahMenikahResponseModel {
  String? message;
  int? code;
  String? status;
  PernahMenikahModel? data;

  PernahMenikahResponseModel({this.message, this.code, this.status, this.data});

  PernahMenikahResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data =
        json['data'] != null ? PernahMenikahModel.fromJson(json['data']) : null;
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
