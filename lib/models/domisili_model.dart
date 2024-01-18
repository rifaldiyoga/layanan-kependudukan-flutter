import 'dart:io';

import 'package:dio/dio.dart';

class DomisiliModel {
  int? id;
  String? nik;
  String? kodeSurat;
  String? type;
  String? namaPerusahaan;
  String? jenisPerusahaan;
  String? telpPerusahaan;
  String? alamatPerusahaan;
  String? statusBangunan;
  String? aktaPerusahaan;
  String? skPengesahan;
  String? penanggungJawab;
  String? keterangan;
  bool? status;
  String? createdAt;
  int? createdBy;
  File? lampiran;
  String? lampiranPath;

  DomisiliModel({
    this.id,
    this.nik,
    this.kodeSurat,
    this.type,
    this.namaPerusahaan,
    this.jenisPerusahaan,
    this.telpPerusahaan,
    this.alamatPerusahaan,
    this.statusBangunan,
    this.aktaPerusahaan,
    this.skPengesahan,
    this.penanggungJawab,
    this.lampiran,
    this.keterangan,
    this.status,
    this.createdAt,
    this.createdBy,
  });

  DomisiliModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    kodeSurat = json['kode_surat'];
    type = json['type'];
    namaPerusahaan = json['nama_perusahaan'];
    jenisPerusahaan = json['jenis_perusahaan'];
    telpPerusahaan = json['telp_perusahaan'];
    statusBangunan = json['status_bangunan'];
    alamatPerusahaan = json['alamat_perusahaan'];
    aktaPerusahaan = json['akta_perusahaan'];
    skPengesahan = json['sk_pengesahan'];
    penanggungJawab = json['penanggung_jawab'];
    lampiranPath = json['lampiran'];
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
    data['type'] = type;
    data['nama_perusahaan'] = namaPerusahaan;
    data['jenis_perusahaan'] = jenisPerusahaan;
    data['telp_perusahaan'] = telpPerusahaan;
    data['alamat_perusahaan'] = alamatPerusahaan;
    data['status_bangunan'] = statusBangunan;
    data['status_bangunan'] = statusBangunan;
    data['akta_perusahaan'] = aktaPerusahaan;
    data['sk_pengesahan'] = skPengesahan;
    data['penanggung_jawab'] = penanggungJawab;
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
