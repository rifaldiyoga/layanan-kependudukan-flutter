import 'package:layanan_kependudukan/helpers/date_formaters.dart';

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
    data['limit'] = this.limit;
    data['page'] = this.page;
    data['total_datas'] = this.totalDatas;
    data['total_pages'] = this.totalPages;
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
  int? createdBy;
  DateTime? createdAt;
  List<DetailPengajuanModel>? detail;

  PengajuanModel(
      {this.id,
      this.code,
      this.name,
      this.layanan,
      this.layananId,
      this.status,
      this.keterangan,
      this.createdBy,
      this.createdAt,
      this.detail});

  PengajuanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    layanan = json['layanan'];
    layananId = json['layanan_id'];
    status = json['status'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['layanan'] = layanan;
    data['layanan_id'] = layananId;
    data['status'] = status;
    data['keterangan'] = keterangan;
    data['created_by'] = createdBy;
    data['created_at'] = DateFormater.dateTimeToString(
        createdAt ?? DateTime.now(), DateFormater.DATE_TIME_FORMAT);
    if (detail != null) {
      data['detail'] = detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailPengajuanModel {
  int? id;
  int? pengajuanId;
  String? status;
  String? name;
  int? createdBy;
  String? createdAt;

  DetailPengajuanModel(
      {this.id,
      this.pengajuanId,
      this.status,
      this.name,
      this.createdBy,
      this.createdAt});

  DetailPengajuanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pengajuanId = json['pengajuan_id'];
    status = json['status'];
    name = json['name'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pengajuan_id'] = pengajuanId;
    data['status'] = status;
    data['name'] = name;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    return data;
  }
}
