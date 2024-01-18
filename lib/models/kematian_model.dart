import 'dart:io';

import 'package:dio/dio.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/models/penduduk_model.dart';

class KematianModel {
  int? id;
  String? nik;
  String? nikJenazah;
  String? kodeSurat;
  String? keterangan;
  DateTime? tglKematian;
  String? jam;
  String? sebab;
  String? tempat;
  bool? status;
  String? saksi1;
  String? saksi2;
  File? lampiranKetRs;
  String? lampiranKetRsPath;
  int? createdBy;
  String? createdAt;
  PendudukModel? jenazah;

  KematianModel(
      {this.id,
      this.nik,
      this.nikJenazah,
      this.kodeSurat,
      this.keterangan,
      this.tglKematian,
      this.jam,
      this.sebab,
      this.tempat,
      this.status,
      this.saksi1,
      this.saksi2,
      this.lampiranKetRs,
      this.createdBy,
      this.createdAt});

  KematianModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    nikJenazah = json['nik_jenazah'];
    kodeSurat = json['kode_surat'];
    keterangan = json['keterangan'];
    tglKematian =
        DateFormater.stringToDateTime(json['tgl_kematian'], "yyyy-MM-dd");
    jam = json['jam'];
    sebab = json['sebab'];
    tempat = json['tempat'];
    status = json['status'];
    saksi1 = json['saksi1'];
    saksi2 = json['saksi2'];
    lampiranKetRsPath = json['lampiran_ket_rs'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    jenazah = json['jenazah'] != null
        ? PendudukModel.fromJson(json['jenazah'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nik'] = nik;
    data['nik_jenazah'] = nikJenazah;
    data['kode_surat'] = kodeSurat;
    data['keterangan'] = keterangan;
    data['tgl_kematian'] =
        DateFormater.dateTimeToString(tglKematian!, "yyyy-MM-dd");
    data['jam'] = jam;
    data['sebab'] = sebab;
    data['tempat'] = tempat;
    data['status'] = status;
    data['saksi1'] = saksi1;
    data['saksi2'] = saksi2;
    data['lampiran_ket_rs'] = lampiranKetRs;
    if (lampiranKetRs != null) {
      data['lampiran_ket_rs'] = MultipartFile.fromFileSync(lampiranKetRs!.path,
          filename: lampiranKetRs!.path.split('/').last);
    }
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    return data;
  }
}
