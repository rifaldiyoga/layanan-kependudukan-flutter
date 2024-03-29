import 'package:dio/dio.dart';
import 'package:layanan_kependudukan/data/api/api_client.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';

class LayananRepository {
  final ApiClient apiClient;

  LayananRepository({required this.apiClient});

  Future<Response> getLayanan() async {
    return await apiClient.get(AppConstants.LAYANAN_URL);
  }

  Future<Response> getRekomLayanan() async {
    return await apiClient.get("${AppConstants.LAYANAN_URL}/rekom");
  }
}
