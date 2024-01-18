import 'dart:io';

import 'package:dio/dio.dart';

class RumahModel {
  int? id;
  String? nik;
  String? kodeSurat;
  File? lampiran;
  String? keterangan;
  bool? status;
  String? createdAt;
  int? createdBy;

  RumahModel(
      {this.id,
      this.nik,
      this.kodeSurat,
      this.lampiran,
      this.keterangan,
      this.status,
      this.createdAt,
      this.createdBy});

  RumahModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    kodeSurat = json['kode_surat'];
    lampiran = json['lampiran'];
    keterangan = json['keterangan'];
    status = json['status'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nik'] = this.nik;
    data['kode_surat'] = this.kodeSurat;
    if (lampiran != null) {
      data['lampiran'] = MultipartFile.fromFileSync(lampiran!.path,
          filename: lampiran!.path.split('/').last);
    }
    data['keterangan'] = this.keterangan;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    return data;
  }
}
