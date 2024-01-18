import 'dart:io';

import 'package:dio/dio.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/models/penduduk_model.dart';

class KelahiranModel {
  int? id;
  String? nama;
  String? nik;
  String? kodeSurat;
  DateTime? birthDate;
  String? birthPlace;
  String? jam;
  String? jk;
  String? nikAyah;
  String? nikIbu;
  File? lampiranBukuNikah;
  String? lampiranBukuNikahPath;
  File? lampiranKetRs;
  String? lampiranKetRsPath;
  int? subdistrictId;
  int? districtId;
  int? provinceId;
  String? keterangan;
  bool? status;
  int? createdBy;
  String? createdAt;
  PendudukModel? ayah;
  PendudukModel? ibu;

  KelahiranModel(
      {this.id,
      this.nama,
      this.nik,
      this.kodeSurat,
      this.birthDate,
      this.birthPlace,
      this.jam,
      this.jk,
      this.nikAyah,
      this.nikIbu,
      this.lampiranBukuNikah,
      this.lampiranKetRs,
      this.subdistrictId,
      this.districtId,
      this.provinceId,
      this.keterangan,
      this.status,
      this.createdBy,
      this.createdAt});

  KelahiranModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    nik = json['nik'];
    kodeSurat = json['kode_surat'];
    birthDate = DateFormater.stringToDateTime(json['birth_date'], "yyyy-MM-dd");
    birthPlace = json['birth_place'];
    jam = json['jam'];
    jk = json['jk'];
    nikAyah = json['nik_ayah'];
    nikIbu = json['nik_ibu'];
    lampiranBukuNikahPath = json['lampiran_buku_nikah'];
    lampiranKetRsPath = json['lampiran_ket_rs'];
    subdistrictId = json['subdistrict_id'];
    districtId = json['district_id'];
    provinceId = json['province_id'];
    keterangan = json['keterangan'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    ayah = json['ayah'] != null ? PendudukModel.fromJson(json['ayah']) : null;
    ibu = json['ibu'] != null ? PendudukModel.fromJson(json['ibu']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['nik'] = nik;
    data['kode_surat'] = kodeSurat;
    data['birth_date'] =
        DateFormater.dateTimeToString(birthDate!, "yyyy-MM-dd");
    data['birth_place'] = birthPlace;
    data['jam'] = jam;
    data['jk'] = jk;
    data['nik_ayah'] = nikAyah;
    data['nik_ibu'] = nikIbu;
    if (lampiranBukuNikah != null) {
      data['lampiran_buku_nikah'] = MultipartFile.fromFileSync(
          lampiranBukuNikah!.path,
          filename: lampiranBukuNikah!.path.split('/').last);
    }
    if (lampiranKetRs != null) {
      data['lampiran_ket_rs'] = MultipartFile.fromFileSync(lampiranKetRs!.path,
          filename: lampiranKetRs!.path.split('/').last);
    }
    data['subdistrict_id'] = subdistrictId;
    data['district_id'] = districtId;
    data['province_id'] = provinceId;
    data['keterangan'] = keterangan;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    return data;
  }
}
