import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/models/belum_menikah_model.dart';
import 'package:layanan_kependudukan/models/berpergian_model.dart';
import 'package:layanan_kependudukan/models/berpergian_response_model.dart';
import 'package:layanan_kependudukan/models/domisili_model.dart';
import 'package:layanan_kependudukan/models/janda_model.dart';
import 'package:layanan_kependudukan/models/kelahiran_model.dart';
import 'package:layanan_kependudukan/models/kematian_model.dart';
import 'package:layanan_kependudukan/models/kepolisian_model.dart';
import 'package:layanan_kependudukan/models/keramaian_model.dart';
import 'package:layanan_kependudukan/models/penduduk_model.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/models/penghasilan_model.dart';
import 'package:layanan_kependudukan/models/pernah_menikah_model.dart';
import 'package:layanan_kependudukan/models/pindah_model.dart';
import 'package:layanan_kependudukan/models/pindah_response_model.dart';
import 'package:layanan_kependudukan/models/response_model.dart';
import 'package:layanan_kependudukan/models/rumah_model.dart';
import 'package:layanan_kependudukan/models/sktm_model.dart';
import 'package:layanan_kependudukan/models/sku_model.dart';
import 'package:layanan_kependudukan/models/tanah_model.dart';

class PengajuanController extends GetxController {
  final PengajuanRepository pengajuanRepository;

  PengajuanController({required this.pengajuanRepository});

  List<dynamic> _pengajuanList = [];
  List<dynamic> get pengajuanList => _pengajuanList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getPengajuan() async {
    _isLoading = true;
    final response = await pengajuanRepository.getPengajuan();
    print(response.data);
    if (response.statusCode == 200) {
      _pengajuanList = [];
      _pengajuanList.addAll(
          PengajuanResponseModel.fromJson(response.data).data!.data ?? []);
      update();
    }
    _isLoading = false;
  }

  Future<ResponseModel> postPengajuan(PengajuanModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postPengajuanSurat(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postUpdatePengajuan(PengajuanModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postStatusPengajuanSurat(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postSKTM(SKTMModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postSKTM(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postSKU(SKUModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postSKU(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postDomisili(DomisiliModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postDomisili(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postKeramaian(KeramaianModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postKeramaian(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<PindahResponseModel> postPindah(PindahModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postPindah(model);

    late PindahResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = PindahResponseModel.fromJson(response.data);
    } else {
      responseModel = PindahResponseModel.fromJson(response.data);
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postPindahDetail(PendudukModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postPindahDetail(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<BerpergianResponseModel> postBerpergian(BerpergianModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postBerpergian(model);

    late BerpergianResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = BerpergianResponseModel.fromJson(response.data);
    } else {
      responseModel = BerpergianResponseModel.fromJson(response.data);
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postBerpergianDetail(PendudukModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postBerpergianDetail(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postJanda(JandaModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postJanda(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postRumah(RumahModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postRumah(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postKepolisian(KepolisianModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postKepolisian(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postPenghasilan(PenghasilanModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postPenghasilan(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postBelumMenikah(BelumMenikahModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postBelumMenikah(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postPernahMenikah(PernahMenikahModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postPernahMenikah(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postTanah(TanahModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postTanah(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postKelahiran(KelahiranModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postKelahiran(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> postKematian(KematianModel model) async {
    _isLoading = true;
    update();
    final response = await pengajuanRepository.postKematian(model);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, "Success");
    } else {
      responseModel = ResponseModel(false, response.data ?? "");
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  // Future<ResponseModel> postSporadik(SporadikModel model) async {
  //   _isLoading = true;
  //   update();
  //   final response = await pengajuanRepository.postSporadik(model);
  //   late ResponseModel responseModel;
  //
  //   if (response.statusCode == 200) {
  //     responseModel = ResponseModel(true, "Success");
  //   } else {
  //     responseModel = ResponseModel(false, response.data ?? "");
  //   }
  //
  //   _isLoading = false;
  //   update();
  //
  //   return responseModel;
  // }
}
