import 'package:dio/dio.dart';
import 'package:layanan_kependudukan/data/api/api_client.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';

class KeluargaRepository {
  final ApiClient apiClient;

  KeluargaRepository({required this.apiClient});

  Future<Response> getKeluarga() async {
    return await apiClient.get("${AppConstants.KELUARGA_URL}/user");
  }
}
