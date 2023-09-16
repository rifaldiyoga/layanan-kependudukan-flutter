import 'layanan_model.dart';

class LayananRekomResponseModel {
  String? message;
  int? code;
  String? status;
  List<LayananModel> data = [];

  LayananRekomResponseModel(
      {this.message, this.code, this.status, required this.data});

  LayananRekomResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = <LayananModel>[];
      json['data'].forEach((v) {
        data.add(LayananModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['status'] = status;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}
