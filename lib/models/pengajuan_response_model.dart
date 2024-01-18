import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/models/penduduk_model.dart';

class PengajuanResponseModel {
  String? message;
  int? code;
  String? status;
  Data? data;

  PengajuanResponseModel({this.message, this.code, this.status, this.data});

  PengajuanResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  int? limit;
  int? page;
  int? totalDatas;
  int? totalPages;
  List<PengajuanModel>? data;

  Data({this.limit, this.page, this.totalDatas, this.totalPages, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    page = json['page'];
    totalDatas = json['total_datas'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <PengajuanModel>[];
      json['data'].forEach((v) {
        data!.add(PengajuanModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['page'] = page;
    data['total_datas'] = totalDatas;
    data['total_pages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PengajuanModel {
  int? id;
  String? code;
  String? name;
  String? layanan;
  int? layananId;
  String? status;
  String? keterangan;
  String? note;
  int? refId;
  int? createdBy;
  DateTime? createdAt;
  List<DetailPengajuanModel>? detail;
  PendudukModel? penduduk;

  PengajuanModel(
      {this.id,
      this.code,
      this.name,
      this.layanan,
      this.layananId,
      this.status,
      this.refId,
      this.note,
      this.keterangan,
      this.createdBy,
      this.createdAt,
      this.detail,
      this.penduduk});

  PengajuanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    layanan = json['layanan'];
    note = json['note'];
    layananId = json['layanan_id'];
    status = json['status'];
    refId = json['ref_id'];
    keterangan = json['keterangan'];
    createdBy = json['created_by'];
    createdAt = DateFormater.stringToDateTime(
        json['created_at'], DateFormater.DATE_TIME_FORMAT);
    if (json['detail'] != null) {
      detail = <DetailPengajuanModel>[];
      json['detail'].forEach((v) {
        detail!.add(DetailPengajuanModel.fromJson(v));
      });
    }
    penduduk = json['penduduk'] != null
        ? PendudukModel.fromJson(json['penduduk'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['layanan'] = layanan;
    data['note'] = note;
    data['layanan_id'] = layananId;
    data['status'] = status;
    data['ref_id'] = refId;
    data['keterangan'] = keterangan;
    data['created_by'] = createdBy;
    data['created_at'] = DateFormater.dateTimeToString(
        createdAt ?? DateTime.now(), DateFormater.DATE_TIME_FORMAT);
    if (detail != null) {
      data['detail'] = detail!.map((v) => v.toJson()).toList();
    }
    if (penduduk != null) {
      data['penduduk'] = penduduk!.toJson();
    }
    return data;
  }
}

class DetailPengajuanModel {
  int? id;
  int? pengajuanId;
  String? status;
  String? name;
  String? note;
  int? createdBy;
  DateTime? createdAt;

  DetailPengajuanModel(
      {this.id,
      this.pengajuanId,
      this.status,
      this.name,
      this.note,
      this.createdBy,
      this.createdAt});

  DetailPengajuanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pengajuanId = json['pengajuan_id'];
    status = json['status'];
    name = json['name'];
    note = json['note'];
    createdBy = json['created_by'];
    createdAt = DateFormater.stringToDateTime(
        json['created_at'], DateFormater.DATE_TIME_FORMAT);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pengajuan_id'] = pengajuanId;
    data['status'] = status;
    data['name'] = name;
    data['note'] = note;
    data['created_by'] = createdBy;
    data['created_at'] = DateFormater.dateTimeToString(
        createdAt ?? DateTime.now(), DateFormater.DATE_TIME_FORMAT);
    return data;
  }
}
