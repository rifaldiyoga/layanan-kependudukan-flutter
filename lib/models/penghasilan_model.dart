import 'dart:io';

import 'package:dio/dio.dart';

class PenghasilanModel {
  int? id;
  String? nik;
  String? kodeSurat;
  File? lampiran;
  String? lampiranPath;
  String? keterangan;
  String? penghasilan;
  bool? status;
  String? createdAt;
  int? createdBy;

  PenghasilanModel(
      {this.id,
      this.nik,
      this.kodeSurat,
      this.lampiran,
      this.keterangan,
      this.status,
      this.createdAt,
      this.penghasilan,
      this.createdBy});

  PenghasilanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    kodeSurat = json['kode_surat'];
    lampiranPath = json['lampiran'];
    keterangan = json['keterangan'];
    penghasilan = json['penghasilan'];
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
    data['penghasilan'] = penghasilan;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    return data;
  }
}
