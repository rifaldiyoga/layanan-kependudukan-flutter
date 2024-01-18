import 'dart:io';

import 'package:dio/dio.dart';

class TanahModel {
  int? id;
  String? nik;
  String? kodeSurat;
  File? lampiran;
  String? lampiranPath;
  String? keterangan;
  String? type;
  String? lokasi;
  String? luasTanah;
  int? panjang;
  int? lebar;
  String? batasBarat;
  String? batasTimur;
  String? batasUtara;
  String? batasSelatan;
  String? saksi1;
  String? saksi2;
  bool? status;
  int? createdBy;
  String? createdAt;

  TanahModel(
      {this.id,
      this.nik,
      this.kodeSurat,
      this.lampiran,
      this.keterangan,
      this.lokasi,
      this.type,
      this.luasTanah,
      this.panjang,
      this.lebar,
      this.batasBarat,
      this.batasTimur,
      this.batasUtara,
      this.batasSelatan,
      this.saksi1,
      this.saksi2,
      this.status,
      this.createdBy,
      this.createdAt});

  TanahModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    kodeSurat = json['kode_surat'];
    lampiranPath = json['lampiran'];
    keterangan = json['keterangan'];
    type = json['type'];
    lokasi = json['lokasi'];
    luasTanah = json['luas_tanah'];
    panjang = json['panjang'];
    lebar = json['lebar'];
    batasBarat = json['batas_barat'];
    batasTimur = json['batas_timur'];
    batasUtara = json['batas_utara'];
    batasSelatan = json['batas_selatan'];
    saksi1 = json['saksi1'];
    saksi2 = json['saksi2'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
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
    data['type'] = type;
    data['lokasi'] = lokasi;
    data['luas_tanah'] = luasTanah;
    data['panjang'] = panjang;
    data['lebar'] = lebar;
    data['batas_barat'] = batasBarat;
    data['batas_timur'] = batasTimur;
    data['batas_utara'] = batasUtara;
    data['batas_selatan'] = batasSelatan;
    data['saksi1'] = saksi1;
    data['saksi2'] = saksi2;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    return data;
  }
}
