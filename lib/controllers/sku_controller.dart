import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/sku_model.dart';
import 'package:layanan_kependudukan/models/sku_response_model.dart';

class SKUController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  SKUController({required this.pengajuanRepository});

  SKUModel? _berpergianModel = null;
  SKUModel? get berpergianModel => _berpergianModel;

  Future<void> getSKU(int id) async {
    final response = await pengajuanRepository.getSKU(id);
    print(response.data);
    if (response.statusCode == 200) {
      _berpergianModel = null;
      _berpergianModel = SKUResponseModel.fromJson(response.data).data;
      update();
    }
  }
}
