import 'dart:io';

import 'package:dio/dio.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';

class KeramaianModel {
  int? id;
  String? nik;
  String? kodeSurat;
  String? namaAcara;
  DateTime? tanggal;
  String? waktu;
  String? tempat;
  String? alamat;
  String? telpon;
  File? lampiran;
  String? lampiranPath;
  String? keterangan;
  bool? status;
  String? createdAt;
  int? createdBy;

  KeramaianModel(
      {this.id,
      this.nik,
      this.kodeSurat,
      this.namaAcara,
      this.tanggal,
      this.waktu,
      this.tempat,
      this.alamat,
      this.telpon,
      this.lampiran,
      this.keterangan,
      this.status,
      this.createdAt,
      this.createdBy});

  KeramaianModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    kodeSurat = json['kode_surat'];
    namaAcara = json['nama_acara'];
    tanggal = DateFormater.stringToDateTime(json['tanggal'], "yyyy-MM-dd");
    waktu = json['waktu'];
    tempat = json['tempat'];
    alamat = json['alamat'];
    telpon = json['telpon'];
    lampiranPath = json['lampiran_path'];
    keterangan = json['keterangan'];
    status = json['status'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nik'] = nik;
    data['kode_surat'] = kodeSurat;
    data['nama_acara'] = namaAcara;
    data['tanggal'] = DateFormater.dateTimeToString(tanggal!, "yyyy-MM-dd");
    data['waktu'] = waktu;
    data['tempat'] = tempat;
    data['alamat'] = alamat;
    data['telpon'] = telpon;
    if (lampiran != null) {
      data['lampiran'] = MultipartFile.fromFileSync(lampiran!.path,
          filename: lampiran!.path.split('/').last);
    }
    data['keterangan'] = keterangan;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    return data;
  }
}
