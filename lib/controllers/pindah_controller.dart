import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/pindah_model.dart';
import 'package:layanan_kependudukan/models/pindah_response_model.dart';

class PindahController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  PindahController({required this.pengajuanRepository});

  PindahModel? _berpergianModel = null;
  PindahModel? get berpergianModel => _berpergianModel;

  Future<void> getPindah(int id) async {
    final response = await pengajuanRepository.getPindah(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = PindahResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
