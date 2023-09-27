import 'package:get/instance_manager.dart';
import 'package:layanan_kependudukan/controllers/article_controller.dart';
import 'package:layanan_kependudukan/controllers/auth_controller.dart';
import 'package:layanan_kependudukan/controllers/layanan_controller.dart';
import 'package:layanan_kependudukan/controllers/pengajuan_controller.dart';
import 'package:layanan_kependudukan/controllers/user_controller.dart';
import 'package:layanan_kependudukan/data/api/api_client.dart';
import 'package:layanan_kependudukan/data/repository/article_repository.dart';
import 'package:layanan_kependudukan/data/repository/auth_repository.dart';
import 'package:layanan_kependudukan/data/repository/layanan_repository.dart';
import 'package:layanan_kependudukan/data/repository/pengajaun_repository.dart';
import 'package:layanan_kependudukan/data/repository/user_repository.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Api Client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  //repo
  Get.lazyPut(() =>
      AuthRepository(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => ArticleRepository(apiClient: Get.find()));
  Get.lazyPut(() => LayananRepository(apiClient: Get.find()));
  Get.lazyPut(() => PengajuanRepository(apiClient: Get.find()));
  Get.lazyPut(() => UserRepository(
      sharedPreferences: sharedPreferences, apiClient: Get.find()));

  //controller
  Get.lazyPut(() => AuthController(authRepository: Get.find()));
  Get.lazyPut(() => ArticleController(articleRepository: Get.find()));
  Get.lazyPut(() => LayananController(layananRepository: Get.find()));
  Get.lazyPut(() => PengajuanController(pengajuanRepository: Get.find()));
  Get.lazyPut(() => UserController(userRepository: Get.find()));
}
