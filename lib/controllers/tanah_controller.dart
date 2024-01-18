import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/tanah_model.dart';
import 'package:layanan_kependudukan/models/tanah_response_model.dart';

class TanahController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  TanahController({required this.pengajuanRepository});

  TanahModel? _berpergianModel = null;
  TanahModel? get berpergianModel => _berpergianModel;

  Future<void> getTanah(int id) async {
    final response = await pengajuanRepository.getTanah(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = TanahResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
