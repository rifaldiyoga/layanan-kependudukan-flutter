import 'dart:io';

import 'package:dio/dio.dart';
import 'package:layanan_kependudukan/models/penduduk_model.dart';

class PernahMenikahModel {
  int? id;
  String? nik;
  String? kodeSurat;
  File? lampiran;
  String? lampiranPath;
  String? keterangan;
  String? type;
  bool? status;
  String? createdAt;
  int? createdBy;
  PendudukModel? suami;
  PendudukModel? istri;

  PernahMenikahModel(
      {this.id,
      this.nik,
      this.kodeSurat,
      this.lampiran,
      this.keterangan,
      this.type,
      this.status,
      this.createdAt,
      this.createdBy});

  PernahMenikahModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    kodeSurat = json['kode_surat'];
    lampiranPath = json['lampiran'];
    keterangan = json['keterangan'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    suami =
        json['suami'] != null ? PendudukModel.fromJson(json['suami']) : null;
    istri =
        json['istri'] != null ? PendudukModel.fromJson(json['istri']) : null;
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
    data['type'] = this.type;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    return data;
  }
}
