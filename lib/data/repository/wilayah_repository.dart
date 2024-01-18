import 'package:dio/dio.dart';
import 'package:layanan_kependudukan/data/api/api_client.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';

class WilayahRepository {
  final ApiClient apiClient;

  WilayahRepository({required this.apiClient});

  Future<Response> getProvinsi() async {
    return await apiClient.get(AppConstants.PROVINSI_URL);
  }

  Future<Response> getKota(int id) async {
    return await apiClient
        .get(AppConstants.KOTA_URL, queryParameters: {"province_id": id});
  }

  Future<Response> getKecamatan(int id) async {
    return await apiClient
        .get(AppConstants.KECAMATAN_URL, queryParameters: {"district_id": id});
  }
}
