import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/janda_model.dart';
import 'package:layanan_kependudukan/models/janda_response_model.dart';

class JandaController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  JandaController({required this.pengajuanRepository});

  JandaModel? _berpergianModel = null;
  JandaModel? get berpergianModel => _berpergianModel;

  Future<void> getJanda(int id) async {
    final response = await pengajuanRepository.getJanda(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = JandaResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
