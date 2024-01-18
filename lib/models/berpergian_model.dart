import 'dart:io';

import 'package:dio/dio.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';

class BerpergianModel {
  int? id;
  String? nik;
  String? kodeSurat;
  File? lampiran;
  String? lampiranPath;
  String? keterangan;
  String? tujuan;
  DateTime? tglBerangkat;
  DateTime? tglKembali;
  bool? status;
  String? createdAt;
  int? createdBy;
  List<BerpergianDetail>? berpergianDetail;

  BerpergianModel(
      {this.id,
      this.nik,
      this.kodeSurat,
      this.lampiran,
      this.keterangan,
      this.tujuan,
      this.tglBerangkat,
      this.tglKembali,
      this.status,
      this.berpergianDetail,
      this.createdAt,
      this.createdBy});

  BerpergianModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    kodeSurat = json['kode_surat'];
    lampiranPath = json['lampiran'];
    keterangan = json['keterangan'];
    tglBerangkat = DateFormater.stringToDateTime(
        json['tgl_berangkat'], DateFormater.DATE_TIME_FORMAT);
    tglKembali = DateFormater.stringToDateTime(
        json['tgl_kembali'], DateFormater.DATE_TIME_FORMAT);
    tujuan = json['tujuan'];
    status = json['status'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    if (json['berpergian_detail'] != null) {
      berpergianDetail = <BerpergianDetail>[];
      json['berpergian_detail'].forEach((v) {
        berpergianDetail!.add(new BerpergianDetail.fromJson(v));
      });
    }
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
    data['tujuan'] = tujuan;
    data['tgl_kembali'] =
        DateFormater.dateTimeToString(tglKembali!, "yyyy-MM-dd");
    data['tgl_berangkat'] =
        DateFormater.dateTimeToString(tglBerangkat!, "yyyy-MM-dd");
    data['status'] = status;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    if (berpergianDetail != null) {
      data['berpergian_detail'] =
          berpergianDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BerpergianDetail {
  int? id;
  String? nik;
  String? nama;
  String? statusFamily;
  int? berpergianId;
  String? createdAt;
  int? createdBy;

  BerpergianDetail(
      {this.id,
      this.nik,
      this.nama,
      this.statusFamily,
      this.berpergianId,
      this.createdAt,
      this.createdBy});

  BerpergianDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    nama = json['nama'];
    statusFamily = json['status_family'];
    berpergianId = json['berpergian_id'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nik'] = nik;
    data['nama'] = nama;
    data['status_family'] = statusFamily;
    data['berpergian_id'] = berpergianId;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    return data;
  }
}
