import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/kepolisian_model.dart';
import 'package:layanan_kependudukan/models/kepolisian_reponse.dart';

class KepolisianController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  KepolisianController({required this.pengajuanRepository});

  KepolisianModel? _berpergianModel = null;
  KepolisianModel? get berpergianModel => _berpergianModel;

  Future<void> getKepolisian(int id) async {
    final response = await pengajuanRepository.getKepolisian(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = KepolisianResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
