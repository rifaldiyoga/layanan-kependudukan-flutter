import 'dart:io';

import 'package:dio/dio.dart';

class SKUModel {
  int? id;
  String? nik;
  String? kodeSurat;
  String? usaha;
  String? keterangan;
  String? lampiranPath;
  File? lampiran;
  bool? status;
  String? createdAt;
  int? createdBy;

  SKUModel(
      {this.id,
      this.nik,
      this.kodeSurat,
      this.usaha,
      this.keterangan,
      this.status,
      this.lampiran,
      this.createdAt,
      this.createdBy});

  SKUModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    kodeSurat = json['kode_surat'];
    usaha = json['usaha'];
    keterangan = json['keterangan'];
    status = json['status'];
    lampiranPath = json['lampiran'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nik'] = nik;
    data['kode_surat'] = kodeSurat;
    data['usaha'] = usaha;
    data['keterangan'] = keterangan;
    if (lampiran != null) {
      data['lampiran'] = MultipartFile.fromFileSync(lampiran!.path,
          filename: lampiran!.path.split('/').last);
    }
    data['status'] = status;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    return data;
  }
}
