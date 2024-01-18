import 'package:layanan_kependudukan/models/sku_model.dart';

class SKUResponseModel {
  String? message;
  int? code;
  String? status;
  SKUModel? data;

  SKUResponseModel({this.message, this.code, this.status, this.data});

  SKUResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? SKUModel.fromJson(json['data']) : null;
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
