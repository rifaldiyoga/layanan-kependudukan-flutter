import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/wilayah_repository.dart';
import 'package:layanan_kependudukan/models/kecamatan_response_model.dart';
import 'package:layanan_kependudukan/models/kota_response_model.dart';
import 'package:layanan_kependudukan/models/provinsi_response_model.dart';

class WilayahController extends GetxController {
  final WilayahRepository wilayahRepository;

  WilayahController({required this.wilayahRepository});

  List<ProvinsiModel> _provinsiList = [];
  List<ProvinsiModel> get provinsiList => _provinsiList;

  List<KotaModel> _kotaList = [];
  List<KotaModel> get kotaList => _kotaList;

  List<KecamatanModel> _kecamatanList = [];
  List<KecamatanModel> get kecamatanList => _kecamatanList;

  bool _isLoading = false;

  Future<void> getProvinsi() async {
    final response = await wilayahRepository.getProvinsi();
    print(response.data);
    if (response.statusCode == 200) {
      _provinsiList = [];
      update();
      _provinsiList.addAll(
          ProvinsiResponseModel.fromJson(response.data).data!.data ?? []);
      update();
    }
  }

  Future<void> getKota(int id) async {
    final response = await wilayahRepository.getKota(id);
    print(response.data);
    if (response.statusCode == 200) {
      _kotaList = [];
      update();
      _kotaList
          .addAll(KotaResponseModel.fromJson(response.data).data!.data ?? []);
      update();
    }
  }

  Future<void> getKecamatan(int id) async {
    final response = await wilayahRepository.getKecamatan(id);
    print(response.data);
    if (response.statusCode == 200) {
      _kecamatanList = [];
      update();
      _kecamatanList.addAll(
          KecamatanResponseModel.fromJson(response.data).data!.data ?? []);
      update();
    }
  }
}
