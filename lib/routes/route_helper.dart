import 'dart:convert';

import 'package:get/get.dart';
import 'package:layanan_kependudukan/models/article_response_model.dart';
import 'package:layanan_kependudukan/models/layanan_model.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/pages/article_page.dart';
import 'package:layanan_kependudukan/pages/auth/sign_in_page.dart';
import 'package:layanan_kependudukan/pages/auth/sign_up_page.dart';
import 'package:layanan_kependudukan/pages/detail_pengajuan_page.dart';
import 'package:layanan_kependudukan/pages/home/main_page.dart';
import 'package:layanan_kependudukan/pages/layanan_list_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan_page.dart';
import 'package:layanan_kependudukan/pages/splashsceen_page.dart';
import 'package:layanan_kependudukan/pages/tanda_tangan_page.dart';

class RouteHelper {
  static const String _splashScreen = "/splash";
  static const String _initial = "/";
  static const String _signUp = "/sign-up";
  static const String _signIn = "/sign-in";
  static const String _article = "/article";
  static const String _layanan = "/layanan";
  static const String _detail_pengajuan = "/detail-pengajuan";
  static const String _pengajuan = "/pengajuan";
  static const String _tanda_tangan = "/tanda-tangan";

  static String getSplashScreen() => _splashScreen;
  static String getHome() => _initial;
  static String getSignUp() => _signUp;
  static String getSignIn() => _signIn;
  static String getLayanan() => _layanan;
  static String getDetailPengajuan(PengajuanModel pengajuanModel) =>
      "$_detail_pengajuan?pengajuan=${json.encode(pengajuanModel.toJson())}";
  static String getArticle(ArticleModel articleModel) =>
      "$_article?article=${json.encode(articleModel.toJson())}";
  static String getPengajuan(LayananModel layananModel) =>
      "$_pengajuan?layanan=${json.encode(layananModel.toJson())}";
  static String getTandaTangan() => "$_tanda_tangan";

  static List<GetPage> routes = [
    GetPage(name: _initial, page: () => const MainPage()),
    GetPage(name: _signUp, page: () => const SignUpPage()),
    GetPage(name: _signIn, page: () => const SignInPage()),
    GetPage(name: _splashScreen, page: () => const SplashScreenPage()),
    GetPage(name: _layanan, page: () => const LayananListPage()),
    GetPage(name: _tanda_tangan, page: () => const TandaTanganPage()),
    GetPage(
        name: _article,
        page: () {
          var param = Get.parameters["article"]!;
          var article = ArticleModel.fromJson(json.decode(param));
          return ArticlePage(
            articleModel: article,
          );
        }),
    GetPage(
        name: _detail_pengajuan,
        page: () {
          var param = Get.parameters["pengajuan"]!;
          var pengajuan = PengajuanModel.fromJson(json.decode(param));
          return DetailPengajuanPage(
            pengajuanModel: pengajuan,
          );
        }),
    GetPage(
        name: _pengajuan,
        page: () {
          var param = Get.parameters["layanan"]!;
          var article = LayananModel.fromJson(json.decode(param));
          return PengajuanPage(
            layananModel: article,
          );
        }),
  ];
}
