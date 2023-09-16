import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/layanan_repository.dart';
import 'package:layanan_kependudukan/models/layanan_rekom_response_model.dart';
import 'package:layanan_kependudukan/models/layanan_response_model.dart';

import '../models/layanan_model.dart';

class LayananController extends GetxController {
  final LayananRepository layananRepository;

  LayananController({required this.layananRepository});

  List<dynamic> _layananList = [];
  List<dynamic> get layananList => _layananList;

  List<dynamic> _layananRekomList = [];
  List<dynamic> get layananRekomList => _layananRekomList;

  Future<void> getLayanan() async {
    Response response = await layananRepository.getLayanan();
    print(response.bodyString);
    if (response.statusCode == 200) {
      _layananList = [];
      _layananList.addAll(LayananResponseModel.fromJson(response.body).data);
      update();
    }
  }

  Future<void> getRekomLayanan() async {
    Response response = await layananRepository.getRekomLayanan();
    print(response.bodyString);
    if (response.statusCode == 200) {
      _layananRekomList = [];
      _layananRekomList.add(
          LayananModel(id: -1, code: "", name: "Lihat\nSemua\n", type: ""));
      _layananRekomList
          .addAll(LayananRekomResponseModel.fromJson(response.body).data);
      update();
    }
  }
}
