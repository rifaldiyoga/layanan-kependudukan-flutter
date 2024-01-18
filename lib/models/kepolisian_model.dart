import 'dart:io';

import 'package:dio/dio.dart';

class KepolisianModel {
  int? id;
  String? nik;
  String? kodeSurat;
  File? lampiran;
  String? lampiranPath;
  String? keterangan;
  bool? status;
  String? createdAt;
  int? createdBy;

  KepolisianModel(
      {this.id,
      this.nik,
      this.kodeSurat,
      this.lampiran,
      this.keterangan,
      this.status,
      this.createdAt,
      this.createdBy});

  KepolisianModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    kodeSurat = json['kode_surat'];
    lampiranPath = json['lampiran'];
    keterangan = json['keterangan'];
    status = json['status'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nik'] = nik;
    data['kode_surat'] = kodeSurat;
    if (lampiran != null) {
      data['lampiran'] = MultipartFile.fromFileSync(lampiran!.path,
          filename: lampiran!.path.split('/').last);
    }
    data['keterangan'] = keterangan;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    return data;
  }
}
