import 'package:flutter/material.dart';

class AppConstants {
  static const int APP_VERSION = 1;

  static const String BASE_URL =
      "https://layanan-kependudukan-345245fcf467.herokuapp.com";
  static const String LOGIN_URL = "/api/v1/login";
  static const String LOGOUT_URL = "/api/v1/logout";
  static const String REGISTER_URL = "/api/v1/register";
  static const String ARTICLE_URL = "/api/v1/articles";
  static const String LAYANAN_URL = "/api/v1/layanans";
  static const String PROVINSI_URL = "/api/v1/provinces";
  static const String KOTA_URL = "/api/v1/districts";
  static const String KECAMATAN_URL = "/api/v1/subdistricts";
  static const String KELUARGA_URL = "/api/v1/keluargas";

  static const String PENGAJUAN_URL = "/api/v1/pengajuans";
  static const String SKTM_URL = "/api/v1/sktms";
  static const String SKU_URL = "/api/v1/skus";
  static const String DOMISILI_URL = "/api/v1/domisilis";
  static const String KERAMAIAN_URL = "/api/v1/keramaians";
  static const String BERPERGIANS_URL = "/api/v1/berpergians";
  static const String BERPERGIANDETAILS_URL = "/api/v1/berpergiands";
  static const String PINDAHS_URL = "/api/v1/pindahs";
  static const String PINDAHDETAILS_URL = "/api/v1/pindahds";
  static const String JANDAS_URL = "/api/v1/jandas";
  static const String RUMAHS_URL = "/api/v1/rumahs";
  static const String KEPOLISIANS_URL = "/api/v1/kepolisians";
  static const String PENGHASILANS_URL = "/api/v1/penghasilans";
  static const String BELUM_MENIKAH_URL = "/api/v1/belum_menikahs";
  static const String PERNAH_MENIKAH_URL = "/api/v1/pernah_menikahs";
  static const String TANAH_URL = "/api/v1/tanahs";
  static const String SPORADIK_URL = "/api/v1/sporadiks";
  static const String KELAHIRAN_URL = "/api/v1/kelahirans";
  static const String KEMATIAN_URL = "/api/v1/kematians";

  static const String TOKEN = "app_token";
  static const String NAME = "user_name";
  static const String USER = "user";
  static const String NIK = "user_nik";
  static const String EMAIL = "user_email";

  static const String PENDING = "PENDING_RT";
  static const String PENDING_ADMIN = "PENDING_ADMIN";
  static const String APPROVED_RT = "APPROVED_RT";
  static const String REJECTED_RT = "REJECTED_RT";
  static const String APPROVED_RW = "APPROVED_RW";
  static const String REJECTED_RW = "REJECTED_RW";
  static const String REJECTED = "REJECTED";
  static const String VALID = "VALID";

  static const String PENDUDUK = "PENDUDUK";
  static const String RT = "RT";
  static const String RW = "RW";

  //layanan code
  static const String SKTM = "SKTM";
  static const String SKU = "SKU";
  static const String SKD = "SKD";
  static const String SKBBK = "SKBBK";
  static const String SIK = "SIK";
  static const String SKKM = "SKKM";
  static const String SKKH = "SKKH";
  static const String SKPD = "SKPD";
  static const String SKPK = "SKPK";
  static const String SKJD = "SKJD";
  static const String SKBPN = "SKBPN";
  static const String SKPN = "SKPN";
  static const String SPCK = "SPCK";
  static const String SKPOT = "SKPOT";
  static const String SKTMR = "SKTMR";
  static const String SKKT = "SKKT";
  static const String SSP = "SPORADIK";

  static showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
