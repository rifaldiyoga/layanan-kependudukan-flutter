import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/kematian_model.dart';
import 'package:layanan_kependudukan/models/kematian_response_model.dart';

class KematianController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  KematianController({required this.pengajuanRepository});

  KematianModel? _berpergianModel = null;
  KematianModel? get berpergianModel => _berpergianModel;

  Future<void> getKematian(int id) async {
    final response = await pengajuanRepository.getKematian(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = KematianResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
