class SKTMModel {
  int? id;
  String? nik;
  String? kodeSurat;
  String? keterangan;
  bool? status;
  String? createdAt;
  int? createdBy;

  SKTMModel(
      {this.id,
      this.nik,
      this.kodeSurat,
      this.keterangan,
      this.status,
      this.createdAt,
      this.createdBy});

  SKTMModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    kodeSurat = json['kode_surat'];
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
    data['keterangan'] = keterangan;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    return data;
  }
}
