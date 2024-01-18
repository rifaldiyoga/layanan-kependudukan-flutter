import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/belum_menikah_model.dart';
import 'package:layanan_kependudukan/models/belum_menikah_reponse.dart';

class BelumMenikahController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  BelumMenikahController({required this.pengajuanRepository});

  BelumMenikahModel? _berpergianModel = null;
  BelumMenikahModel? get berpergianModel => _berpergianModel;

  Future<void> getBelumMenikah(int id) async {
    final response = await pengajuanRepository.getBelumMenikah(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = BelumMenikahResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
