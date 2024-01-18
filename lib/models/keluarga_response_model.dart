import 'package:layanan_kependudukan/models/penduduk_model.dart';

class KeluargaResponseModel {
  String? message;
  int? code;
  String? status;
  KeluargaModel? data;

  KeluargaResponseModel({this.message, this.code, this.status, this.data});

  KeluargaResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? KeluargaModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class KeluargaModel {
  int? id;
  String? noKk;
  String? nikKepalaKeluarga;
  String? kepalaKeluarga;
  String? alamat;
  int? rtId;
  int? rwId;
  int? kelurahanId;
  int? subdistrictId;
  int? districtId;
  int? provinceId;
  String? createdAt;
  String? updatedAt;
  List<PendudukModel>? penduduk;

  KeluargaModel(
      {this.id,
      this.noKk,
      this.nikKepalaKeluarga,
      this.kepalaKeluarga,
      this.alamat,
      this.rtId,
      this.rwId,
      this.kelurahanId,
      this.subdistrictId,
      this.districtId,
      this.provinceId,
      this.createdAt,
      this.updatedAt,
      this.penduduk});

  KeluargaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noKk = json['no_kk'];
    nikKepalaKeluarga = json['nik_kepala_keluarga'];
    kepalaKeluarga = json['kepala_keluarga'];
    alamat = json['alamat'];
    rtId = json['rt_id'];
    rwId = json['rw_id'];
    kelurahanId = json['kelurahan_id'];
    subdistrictId = json['subdistrict_id'];
    districtId = json['district_id'];
    provinceId = json['province_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['penduduk'] != null) {
      penduduk = <PendudukModel>[];
      json['penduduk'].forEach((v) {
        penduduk!.add(PendudukModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['no_kk'] = noKk;
    data['nik_kepala_keluarga'] = nikKepalaKeluarga;
    data['kepala_keluarga'] = kepalaKeluarga;
    data['alamat'] = alamat;
    data['rt_id'] = rtId;
    data['rw_id'] = rwId;
    data['kelurahan_id'] = kelurahanId;
    data['subdistrict_id'] = subdistrictId;
    data['district_id'] = districtId;
    data['province_id'] = provinceId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (penduduk != null) {
      data['penduduk'] = penduduk!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
