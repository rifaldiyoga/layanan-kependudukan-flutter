import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/berpergian_model.dart';
import 'package:layanan_kependudukan/models/berpergian_response_model.dart';

class BerpergianController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  BerpergianController({required this.pengajuanRepository});

  BerpergianModel? _berpergianModel = null;
  BerpergianModel? get berpergianModel => _berpergianModel;

  Future<void> getBerpergian(int id) async {
    final response = await pengajuanRepository.getBerpergian(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = BerpergianResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
