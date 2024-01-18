import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/keramaian_model.dart';
import 'package:layanan_kependudukan/models/keramaian_response_model.dart';

class KeramaianController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  KeramaianController({required this.pengajuanRepository});

  KeramaianModel? _berpergianModel = null;
  KeramaianModel? get berpergianModel => _berpergianModel;

  Future<void> getKeramaian(int id) async {
    final response = await pengajuanRepository.getKeramaian(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = KeramaianResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
