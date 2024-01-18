import 'dart:io';

import 'package:dio/dio.dart';

class PindahModel {
  int? id;
  String? nik;
  String? nikKepalaKeluarga;
  String? kodeSurat;
  String? type;
  String? alasanPindah;
  String? alamatTujuan;
  String? rt;
  String? rw;
  String? kelurahan;
  int? subdistrictId;
  int? districtId;
  int? provinceId;
  String? kodePos;
  String? telepon;
  String? jenisKepindahan;
  String? statusTidakPindah;
  String? statusPindah;
  bool? status;
  File? lampiran;
  String? lampiranPath;
  String? createdAt;
  int? createdBy;
  Kecamatan? kecamatan;
  Kota? kota;
  Provinsi? provinsi;

  PindahModel({
    this.id,
    this.nik,
    this.nikKepalaKeluarga,
    this.kodeSurat,
    this.type,
    this.alasanPindah,
    this.alamatTujuan,
    this.rt,
    this.rw,
    this.kelurahan,
    this.subdistrictId,
    this.districtId,
    this.provinceId,
    this.kodePos,
    this.telepon,
    this.jenisKepindahan,
    this.statusTidakPindah,
    this.statusPindah,
    this.status,
    this.lampiran,
    this.createdAt,
    this.createdBy,
  });

  PindahModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    nikKepalaKeluarga = json['nik_kepala_keluarga'];
    kodeSurat = json['kode_surat'];
    type = json['type'];
    alasanPindah = json['alasan_pindah'];
    alamatTujuan = json['alamat_tujuan'];
    rt = json['rt'];
    rw = json['rw'];
    kelurahan = json['kelurahan'];
    subdistrictId = json['subdistrict_id'];
    districtId = json['district_id'];
    provinceId = json['province_id'];
    kodePos = json['kode_pos'];
    telepon = json['telepon'];
    jenisKepindahan = json['jenis_kepindahan'];
    statusTidakPindah = json['status_tidak_pindah'];
    statusPindah = json['status_pindah'];
    status = json['status'];
    lampiranPath = json['lampiran'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    kecamatan = json['kecamatan'] != null
        ? Kecamatan.fromJson(json['kecamatan'])
        : null;
    kota = json['kota'] != null ? Kota.fromJson(json['kota']) : null;
    provinsi =
        json['provinsi'] != null ? Provinsi.fromJson(json['provinsi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nik'] = nik;
    data['nik_kepala_keluarga'] = nikKepalaKeluarga;
    data['kode_surat'] = kodeSurat;
    data['type'] = type;
    data['alasan_pindah'] = alasanPindah;
    data['alamat_tujuan'] = alamatTujuan;
    data['rt'] = rt;
    data['rw'] = rw;
    data['kelurahan'] = kelurahan;
    data['subdistrict_id'] = subdistrictId;
    data['district_id'] = districtId;
    data['province_id'] = provinceId;
    data['kode_pos'] = kodePos;
    data['telepon'] = telepon;
    data['jenis_kepindahan'] = jenisKepindahan;
    data['status_tidak_pindah'] = statusTidakPindah;
    data['status_pindah'] = statusPindah;
    data['status'] = status;
    if (lampiran != null) {
      data['lampiran'] = MultipartFile.fromFileSync(lampiran!.path,
          filename: lampiran!.path.split('/').last);
    }
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;

    return data;
  }
}

class Kecamatan {
  int? id;
  String? code;
  String? name;
  String? createdAt;
  int? kotaId;
  Kota? kota;

  Kecamatan(
      {this.id, this.code, this.name, this.createdAt, this.kotaId, this.kota});

  Kecamatan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    createdAt = json['created_at'];
    kotaId = json['kota_id'];
    kota = json['kota'] != null ? Kota.fromJson(json['kota']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['kota_id'] = this.kotaId;
    if (this.kota != null) {
      data['kota'] = this.kota!.toJson();
    }
    return data;
  }
}

class Provinsi {
  int? id;
  String? code;
  String? name;
  String? createdAt;

  Provinsi({this.id, this.code, this.name, this.createdAt});

  Provinsi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Kota {
  int? id;
  String? code;
  String? name;
  int? provinceId;
  String? createdAt;
  Provinsi? provinsi;

  Kota(
      {this.id,
      this.code,
      this.name,
      this.provinceId,
      this.createdAt,
      this.provinsi});

  Kota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    provinceId = json['province_id'];
    createdAt = json['created_at'];
    provinsi =
        json['provinsi'] != null ? Provinsi.fromJson(json['provinsi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['province_id'] = this.provinceId;
    data['created_at'] = this.createdAt;
    if (this.provinsi != null) {
      data['provinsi'] = this.provinsi!.toJson();
    }
    return data;
  }
}
