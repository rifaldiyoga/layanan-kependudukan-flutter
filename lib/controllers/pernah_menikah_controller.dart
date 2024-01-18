import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/pernah_menikah_model.dart';
import 'package:layanan_kependudukan/models/pernah_menikah_response_model.dart';

class PernahMenikahController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  PernahMenikahController({required this.pengajuanRepository});

  PernahMenikahModel? _berpergianModel = null;
  PernahMenikahModel? get berpergianModel => _berpergianModel;

  Future<void> getPernahMenikah(int id) async {
    final response = await pengajuanRepository.getPernahMenikah(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel =
          PernahMenikahResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
