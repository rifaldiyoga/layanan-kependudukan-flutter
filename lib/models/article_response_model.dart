import 'package:layanan_kependudukan/helpers/date_formaters.dart';

class ArticleReponseModel {
  String? message;
  int? code;
  String? status;
  Data data = Data();

  ArticleReponseModel(
      {this.message, this.code, this.status, required this.data});

  ArticleReponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    status = json['status'];
    data = Data.fromJson(json['data']);
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
  List<ArticleModel>? data = [];

  Data({this.limit, this.page, this.totalDatas, this.totalPages, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    page = json['page'];
    totalDatas = json['total_datas'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <ArticleModel>[];
      json['data'].forEach((v) {
        data!.add(ArticleModel.fromJson(v));
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

class ArticleModel {
  int? id;
  String title = "";
  String author = "";
  String content = "";
  String? imageUrl = "";
  String tag = "";
  DateTime createdAt = DateTime.now();

  ArticleModel(
      {this.id,
      required this.title,
      required this.author,
      required this.content,
      this.imageUrl,
      required this.tag,
      required this.createdAt});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    content = json['content'];
    imageUrl = json['image_path'];
    tag = json['tag'];
    createdAt = DateFormater.stringToDateTime(
        json['created_at'], DateFormater.DATE_TIME_FORMAT);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['author'] = author;
    data['content'] = content;
    data['image_path'] = imageUrl;
    data['tag'] = tag;
    data['created_at'] =
        DateFormater.dateTimeToString(createdAt, DateFormater.DATE_TIME_FORMAT);
    return data;
  }
}
