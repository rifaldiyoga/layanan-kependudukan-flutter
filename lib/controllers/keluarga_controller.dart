import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/keluraga_repository.dart';
import 'package:layanan_kependudukan/models/keluarga_response_model.dart';
import 'package:layanan_kependudukan/models/penduduk_model.dart';

class KeluargaController extends GetxController {
  final KeluargaRepository kelurgaRepository;

  KeluargaController({required this.kelurgaRepository});

  KeluargaModel? _keluargaModel;
  KeluargaModel? get keluargaModel => _keluargaModel;
  List<PendudukModel> _pendudukModelList = [];
  List<PendudukModel> get pendudukModel => _pendudukModelList;

  Future<void> getKeluarga() async {
    final response = await kelurgaRepository.getKeluarga();
    print(response.data);
    if (response.statusCode == 200) {
      _keluargaModel = null;
      _keluargaModel = KeluargaResponseModel.fromJson(response.data).data;

      _pendudukModelList = [];
      _pendudukModelList.addAll(_keluargaModel?.penduduk ?? []);
      update();
    }
  }

  onDeletePenduduk(PendudukModel pendudukModel) {
    _pendudukModelList
        .removeWhere((element) => element.nik == pendudukModel.nik);
    update();
  }
}
