import 'dart:convert';

import 'package:get/get.dart';
import 'package:layanan_kependudukan/models/article_response_model.dart';
import 'package:layanan_kependudukan/pages/article_page.dart';
import 'package:layanan_kependudukan/pages/auth/sign_in_page.dart';
import 'package:layanan_kependudukan/pages/auth/sign_up_page.dart';
import 'package:layanan_kependudukan/pages/detail_pengajuan_page.dart';
import 'package:layanan_kependudukan/pages/home/main_page.dart';
import 'package:layanan_kependudukan/pages/layanan_list_page.dart';
import 'package:layanan_kependudukan/pages/splashsceen_page.dart';

class RouteHelper {
  static const String _splashScreen = "/splash";
  static const String _initial = "/";
  static const String _signUp = "/sign-up";
  static const String _signIn = "/sign-in";
  static const String _article = "/article";
  static const String _layanan = "/layanan";
  static const String _detail_pengajuan = "/detail-pengajuan";

  static String getSplashScreen() => _splashScreen;
  static String getHome() => _initial;
  static String getSignUp() => _signUp;
  static String getSignIn() => _signIn;
  static String getLayanan() => _layanan;
  static String getDetailPengajuan() => _detail_pengajuan;
  static String getArticle(ArticleModel articleModel) =>
      "$_article?article=${json.encode(articleModel.toJson())}";

  static List<GetPage> routes = [
    GetPage(name: _initial, page: () => MainPage()),
    GetPage(name: _signUp, page: () => SignUpPage()),
    GetPage(name: _signIn, page: () => SignInPage()),
    GetPage(name: _splashScreen, page: () => SplashScreenPage()),
    GetPage(name: _layanan, page: () => LayananListPage()),
    GetPage(name: _detail_pengajuan, page: () => DetailPengajuanPage()),
    GetPage(
        name: _article,
        page: () {
          var param = Get.parameters["article"]!;
          var article = ArticleModel.fromJson(json.decode(param!));
          return ArticlePage(
            articleModel: article,
          );
        }),
  ];
}
