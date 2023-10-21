import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/models/response_model.dart';

class PengajuanController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  PengajuanController({required this.pengajuanRepository});

  List<dynamic> _pengajuanList = [];
  List<dynamic> get pengajuanList => _pengajuanList;
  bool _isLoading = false;

  Future<void> getPengajuan() async {
    Response response = await pengajuanRepository.getPengajuan();
    print(response.bodyString);
    if (response.statusCode == 200) {
      _pengajuanList = [];
      _pengajuanList.addAll(
          PengajuanResponseModel.fromJson(response.body).data!.data ?? []);
      update();
    }
  }

  Future<ResponseModel> postPengajuan(PengajuanModel signInModel) async {
    _isLoading = true;
    update();
    Response response =
        await pengajuanRepository.postPengajuanSurat(signInModel);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.bodyString ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postUpdatePengajuan(PengajuanModel signInModel) async {
    _isLoading = true;
    update();
    Response response =
        await pengajuanRepository.postStatusPengajuanSurat(signInModel);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.bodyString ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }
}
