import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/api/api_client.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';

class PengajuanRepository {
  final ApiClient apiClient;

  PengajuanRepository({required this.apiClient});

  Future<Response> getPengajuan() async {
    return await apiClient.getData(AppConstants.PENGAJUAN_URL);
  }

  Future<Response> postPengajuanSurat(PengajuanModel signInModel) async {
    return await apiClient.postData(
        AppConstants.PENGAJUAN_URL, signInModel.toJson());
  }
}
