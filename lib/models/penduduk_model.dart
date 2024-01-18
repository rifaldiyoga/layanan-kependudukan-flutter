import 'package:layanan_kependudukan/helpers/date_formaters.dart';

class PendudukModel {
  int? id;
  String? nik;
  String? noKk;
  String? fullname;
  String? birthPlace;
  DateTime? birthDate;
  int? religionId;
  int? educationId;
  int? jobId;
  String? nationality;
  String? mariedType;
  String? mariedDate;
  String? bloodType;
  String? address;
  int? rtId;
  int? rwId;
  int? kelurahanId;
  int? subdistrictId;
  int? districtId;
  int? provinceId;
  String? jk;
  String? statusFamily;
  String? createdAt;
  String? updatedAt;
  int? pindahId;
  int? berpergianId;

  PendudukModel({
    this.id,
    this.nik,
    this.noKk,
    this.fullname,
    this.birthPlace,
    this.birthDate,
    this.religionId,
    this.educationId,
    this.jobId,
    this.nationality,
    this.mariedType,
    this.mariedDate,
    this.bloodType,
    this.address,
    this.rtId,
    this.rwId,
    this.kelurahanId,
    this.subdistrictId,
    this.districtId,
    this.provinceId,
    this.jk,
    this.statusFamily,
    this.createdAt,
    this.updatedAt,
    this.pindahId,
    this.berpergianId,
  });

  PendudukModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    noKk = json['no_kk'];
    fullname = json['fullname'];
    birthPlace = json['birth_place'];
    birthDate = DateFormater.stringToDateTime(
        json['birth_date'], DateFormater.DATE_TIME_FORMAT);
    religionId = json['religion_id'];
    educationId = json['education_id'];
    jobId = json['job_id'];
    nationality = json['nationality'];
    mariedType = json['maried_type'];
    mariedDate = json['maried_date'];
    bloodType = json['blood_type'];
    address = json['address'];
    rtId = json['rt_id'];
    rwId = json['rw_id'];
    kelurahanId = json['kelurahan_id'];
    subdistrictId = json['subdistrict_id'];
    districtId = json['district_id'];
    provinceId = json['province_id'];
    jk = json['jk'];
    statusFamily = json['status_family'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pindahId = json['pindah_id'];
    berpergianId = json['berpergian_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nik'] = nik;
    data['no_kk'] = noKk;
    data['fullname'] = fullname;
    data['birth_place'] = birthPlace;
    data['birth_date'] = DateFormater.dateTimeToString(
        birthDate!, DateFormater.DATE_TIME_FORMAT);
    data['religion_id'] = religionId;
    data['education_id'] = educationId;
    data['job_id'] = jobId;
    data['nationality'] = nationality;
    data['maried_type'] = mariedType;
    data['maried_date'] = mariedDate;
    data['blood_type'] = bloodType;
    data['address'] = address;
    data['rt_id'] = rtId;
    data['rw_id'] = rwId;
    data['kelurahan_id'] = kelurahanId;
    data['subdistrict_id'] = subdistrictId;
    data['district_id'] = districtId;
    data['province_id'] = provinceId;
    data['jk'] = jk;
    data['status_family'] = statusFamily;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['pindah_id'] = pindahId;
    data['berpergian_id'] = berpergianId;
    return data;
  }
}
