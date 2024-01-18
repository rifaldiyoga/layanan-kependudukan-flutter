import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/domisili_model.dart';
import 'package:layanan_kependudukan/models/domisili_response_model.dart';

class DomisiliController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  DomisiliController({required this.pengajuanRepository});

  DomisiliModel? _berpergianModel = null;
  DomisiliModel? get berpergianModel => _berpergianModel;

  Future<void> getDomisili(int id) async {
    final response = await pengajuanRepository.getDomisili(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = DomisiliResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
