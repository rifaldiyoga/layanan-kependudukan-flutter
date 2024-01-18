class KecamatanResponseModel {
  String? message;
  int? code;
  String? status;
  Data? data;

  KecamatanResponseModel({this.message, this.code, this.status, this.data});

  KecamatanResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<KecamatanModel>? data;

  Data({this.limit, this.page, this.totalDatas, this.totalPages, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    page = json['page'];
    totalDatas = json['total_datas'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <KecamatanModel>[];
      json['data'].forEach((v) {
        data!.add(KecamatanModel.fromJson(v));
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

class KecamatanModel {
  int? id;
  String? code;
  String? name;
  int? kotaId;

  KecamatanModel({this.id, this.code, this.name, this.kotaId});

  KecamatanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    kotaId = json['kota_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['kota_id'] = kotaId;
    return data;
  }
}
