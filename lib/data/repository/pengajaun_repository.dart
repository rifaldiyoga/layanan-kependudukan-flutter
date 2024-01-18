import 'package:dio/dio.dart';
import 'package:layanan_kependudukan/data/api/api_client.dart';
import 'package:layanan_kependudukan/models/belum_menikah_model.dart';
import 'package:layanan_kependudukan/models/berpergian_model.dart';
import 'package:layanan_kependudukan/models/domisili_model.dart';
import 'package:layanan_kependudukan/models/janda_model.dart';
import 'package:layanan_kependudukan/models/kelahiran_model.dart';
import 'package:layanan_kependudukan/models/kematian_model.dart';
import 'package:layanan_kependudukan/models/kepolisian_model.dart';
import 'package:layanan_kependudukan/models/keramaian_model.dart';
import 'package:layanan_kependudukan/models/penduduk_model.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/models/penghasilan_model.dart';
import 'package:layanan_kependudukan/models/pernah_menikah_model.dart';
import 'package:layanan_kependudukan/models/pindah_model.dart';
import 'package:layanan_kependudukan/models/rumah_model.dart';
import 'package:layanan_kependudukan/models/sktm_model.dart';
import 'package:layanan_kependudukan/models/sku_model.dart';
import 'package:layanan_kependudukan/models/tanah_model.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';

class PengajuanRepository {
  final ApiClient apiClient;

  PengajuanRepository({required this.apiClient});

  Future<Response> getPengajuan() async {
    return await apiClient.get(AppConstants.PENGAJUAN_URL);
  }

  Future<Response> getSKTM(int id) async {
    return await apiClient.get(
      "${AppConstants.SKTM_URL}/$id",
    );
  }

  Future<Response> getSKU(int id) async {
    return await apiClient.get("${AppConstants.SKU_URL}/${id}");
  }

  Future<Response> getDomisili(int id) async {
    return await apiClient.get("${AppConstants.DOMISILI_URL}/${id}");
  }

  Future<Response> getKeramaian(int id) async {
    return await apiClient.get("${AppConstants.KERAMAIAN_URL}/${id}");
  }

  Future<Response> getBerpergian(int id) async {
    return await apiClient.get("${AppConstants.BERPERGIANS_URL}/${id}");
  }

  Future<Response> getPindah(int id) async {
    return await apiClient.get("${AppConstants.PINDAHS_URL}/${id}");
  }

  Future<Response> getJanda(int id) async {
    return await apiClient.get("${AppConstants.JANDAS_URL}/${id}");
  }

  Future<Response> getRumah(int id) async {
    return await apiClient.get("${AppConstants.RUMAHS_URL}/${id}");
  }

  Future<Response> getKepolisian(int id) async {
    return await apiClient.get("${AppConstants.KEPOLISIANS_URL}/${id}");
  }

  Future<Response> getPenghasilan(int id) async {
    return await apiClient.get("${AppConstants.PENGHASILANS_URL}/${id}");
  }

  Future<Response> getBelumMenikah(int id) async {
    return await apiClient.get("${AppConstants.BELUM_MENIKAH_URL}/${id}");
  }

  Future<Response> getPernahMenikah(int id) async {
    return await apiClient.get("${AppConstants.PERNAH_MENIKAH_URL}/${id}");
  }

  Future<Response> getTanah(int id) async {
    return await apiClient.get("${AppConstants.TANAH_URL}/${id}");
  }

  Future<Response> getKelahiran(int id) async {
    return await apiClient.get("${AppConstants.KELAHIRAN_URL}/${id}");
  }

  Future<Response> getKematian(int id) async {
    return await apiClient.get("${AppConstants.KEMATIAN_URL}/${id}");
  }

  Future<Response> postPengajuanSurat(PengajuanModel model) async {
    return await apiClient.postData(AppConstants.PENGAJUAN_URL,
        data: model.toJson());
  }

  Future<Response> postStatusPengajuanSurat(PengajuanModel model) async {
    return await apiClient.postData("${AppConstants.PENGAJUAN_URL}/${model.id}",
        data: model.toJson());
  }

  Future<Response> postSKTM(SKTMModel model) async {
    return await apiClient.postData(AppConstants.SKTM_URL,
        data: model.toJson());
  }

  Future<Response> postSKU(SKUModel model) async {
    return await apiClient.postData(AppConstants.SKU_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postDomisili(DomisiliModel model) async {
    return await apiClient.postData(AppConstants.DOMISILI_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postKeramaian(KeramaianModel model) async {
    return await apiClient.postData(AppConstants.KERAMAIAN_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postBerpergian(BerpergianModel model) async {
    return await apiClient.postData(AppConstants.BERPERGIANS_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postBerpergianDetail(PendudukModel model) async {
    return await apiClient.postData(AppConstants.BERPERGIANDETAILS_URL,
        data: model.toJson());
  }

  Future<Response> postPindah(PindahModel model) async {
    return await apiClient.postData(AppConstants.PINDAHS_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postPindahDetail(PendudukModel model) async {
    return await apiClient.postData(AppConstants.PINDAHDETAILS_URL,
        data: model.toJson());
  }

  Future<Response> postJanda(JandaModel model) async {
    return await apiClient.postData(AppConstants.JANDAS_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postRumah(RumahModel model) async {
    return await apiClient.postData(AppConstants.RUMAHS_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postKepolisian(KepolisianModel model) async {
    return await apiClient.postData(AppConstants.KEPOLISIANS_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postPenghasilan(PenghasilanModel model) async {
    return await apiClient.postData(AppConstants.PENGHASILANS_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postBelumMenikah(BelumMenikahModel model) async {
    return await apiClient.postData(AppConstants.BELUM_MENIKAH_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postPernahMenikah(PernahMenikahModel model) async {
    return await apiClient.postData(AppConstants.PERNAH_MENIKAH_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postTanah(TanahModel model) async {
    return await apiClient.postData(AppConstants.TANAH_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postKelahiran(KelahiranModel model) async {
    return await apiClient.postData(AppConstants.KELAHIRAN_URL,
        data: FormData.fromMap(model.toJson()));
  }

  Future<Response> postKematian(KematianModel model) async {
    return await apiClient.postData(AppConstants.KEMATIAN_URL,
        data: FormData.fromMap(model.toJson()));
  }

  // Future<Response> postSporadik(SporadikModel model) async {
  //   return await apiClient.postData(AppConstants.SPORADIK_URL,
  //       data: FormData.fromMap(model.toJson()));
  // }
}
