import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/kelahiran_model.dart';
import 'package:layanan_kependudukan/models/kelahiran_response_model.dart';

class KelahiranController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  KelahiranController({required this.pengajuanRepository});

  KelahiranModel? _berpergianModel = null;
  KelahiranModel? get berpergianModel => _berpergianModel;

  Future<void> getKelahiran(int id) async {
    final response = await pengajuanRepository.getKelahiran(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = KelahiranResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
