import 'package:get/instance_manager.dart';
import 'package:layanan_kependudukan/controllers/article_controller.dart';
import 'package:layanan_kependudukan/controllers/auth_controller.dart';
import 'package:layanan_kependudukan/controllers/belum_menikah_controller.dart';
import 'package:layanan_kependudukan/controllers/berpergian_controller.dart';
import 'package:layanan_kependudukan/controllers/domisili_controller.dart';
import 'package:layanan_kependudukan/controllers/janda_controller.dart';
import 'package:layanan_kependudukan/controllers/kelahiran_controller.dart';
import 'package:layanan_kependudukan/controllers/keluarga_controller.dart';
import 'package:layanan_kependudukan/controllers/kematian_controller.dart';
import 'package:layanan_kependudukan/controllers/kepolisian_controller.dart';
import 'package:layanan_kependudukan/controllers/keramaian_controller.dart';
import 'package:layanan_kependudukan/controllers/layanan_controller.dart';
import 'package:layanan_kependudukan/controllers/pengajuan_controller.dart';
import 'package:layanan_kependudukan/controllers/penghasilan_controller.dart';
import 'package:layanan_kependudukan/controllers/pernah_menikah_controller.dart';
import 'package:layanan_kependudukan/controllers/pindah_controller.dart';
import 'package:layanan_kependudukan/controllers/sku_controller.dart';
import 'package:layanan_kependudukan/controllers/tanah_controller.dart';
import 'package:layanan_kependudukan/controllers/user_controller.dart';
import 'package:layanan_kependudukan/controllers/wilayah_controller.dart';
import 'package:layanan_kependudukan/data/api/api_client.dart';
import 'package:layanan_kependudukan/data/repository/article_repository.dart';
import 'package:layanan_kependudukan/data/repository/auth_repository.dart';
import 'package:layanan_kependudukan/data/repository/keluraga_repository.dart';
import 'package:layanan_kependudukan/data/repository/layanan_repository.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/data/repository/user_repository.dart';
import 'package:layanan_kependudukan/data/repository/wilayah_repository.dart';
import 'package:layanan_kependudukan/helpers/loading_helper.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences, fenix: true);

  // Api Client
  Get.lazyPut(
      () => ApiClient(
          appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()),
      fenix: true);

  Get.lazyPut(() => LoadingHelper(), fenix: true);

  //Firebase
  // Get.lazyPut(() => MessagingService(), fenix: true);

  //repo
  Get.lazyPut(() =>
      AuthRepository(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => ArticleRepository(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => LayananRepository(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => PengajuanRepository(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => WilayahRepository(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => KeluargaRepository(apiClient: Get.find()), fenix: true);
  Get.lazyPut(
      () => UserRepository(
          sharedPreferences: sharedPreferences, apiClient: Get.find()),
      fenix: true);

  //controller
  Get.lazyPut(() => AuthController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => ArticleController(articleRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => KeluargaController(kelurgaRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => LayananController(layananRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => WilayahController(wilayahRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => PengajuanController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => UserController(userRepository: Get.find()), fenix: true);
  Get.lazyPut(() => BerpergianController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => BelumMenikahController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => KepolisianController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => DomisiliController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => JandaController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => KelahiranController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => KematianController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => KeramaianController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => PenghasilanController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => PernahMenikahController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => PindahController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => TanahController(pengajuanRepository: Get.find()),
      fenix: true);
  Get.lazyPut(() => SKUController(pengajuanRepository: Get.find()),
      fenix: true);
}
