class ProvinsiResponseModel {
  String? message;
  int? code;
  String? status;
  Data? data;

  ProvinsiResponseModel({this.message, this.code, this.status, this.data});

  ProvinsiResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<ProvinsiModel>? data;

  Data({this.limit, this.page, this.totalDatas, this.totalPages, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    page = json['page'];
    totalDatas = json['total_datas'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <ProvinsiModel>[];
      json['data'].forEach((v) {
        data!.add(ProvinsiModel.fromJson(v));
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

class ProvinsiModel {
  int? id;
  String? code;
  String? name;

  ProvinsiModel({this.id, this.code, this.name});

  ProvinsiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}
