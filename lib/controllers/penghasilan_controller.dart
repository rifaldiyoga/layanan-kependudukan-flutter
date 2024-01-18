import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/penghasilan_model.dart';
import 'package:layanan_kependudukan/models/penghasilan_response_model.dart';

class PenghasilanController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  PenghasilanController({required this.pengajuanRepository});

  PenghasilanModel? _berpergianModel = null;
  PenghasilanModel? get berpergianModel => _berpergianModel;

  Future<void> getPenghasilan(int id) async {
    final response = await pengajuanRepository.getPenghasilan(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = PenghasilanResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
