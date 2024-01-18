import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/models/layanan_model.dart';
import 'package:layanan_kependudukan/pages/pengajuan/belum_menikah_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/berpergian_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/domisili_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/janda_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/kelahiran_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/kematian_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/kepolisian_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/keramaian_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/penghasilan_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/pernah_menikah_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/pindah_datang_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/pindah_keluar_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/rumah_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/sktm_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/sku_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/sporadik_page.dart';
import 'package:layanan_kependudukan/pages/pengajuan/tanah_page.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';

class PengajuanPage extends StatefulWidget {
  final LayananModel layananModel;

  const PengajuanPage({super.key, required this.layananModel});

  @override
  State<PengajuanPage> createState() => _PengajuanPageState();
}

class _PengajuanPageState extends State<PengajuanPage> {
  @override
  Widget build(BuildContext context) {
    Widget getPage() {
      switch (widget.layananModel.code) {
        case AppConstants.SKTM:
          return SKTMPage(
            layananModel: widget.layananModel,
          );
        case AppConstants.SKU:
          return SKUPage(
            layananModel: widget.layananModel,
          );
        case AppConstants.SKD:
          return DomisiliPage(
            layananModel: widget.layananModel,
          );
        case AppConstants.SKBBK:
          return BerpergianPage(
            layananModel: widget.layananModel,
          );
        case AppConstants.SIK:
          return KeramaianPage(layananModel: widget.layananModel);
        case AppConstants.SKKM:
          return KematianPage(layananModel: widget.layananModel);
        case AppConstants.SKKH:
          return KelahiranPage(layananModel: widget.layananModel);
        case AppConstants.SKPD:
          return PindahDatangPage(layananModel: widget.layananModel);
        case AppConstants.SKPK:
          return PindahKeluarPage(layananModel: widget.layananModel);
        case AppConstants.SKJD:
          return JandaPage(layananModel: widget.layananModel);
        case AppConstants.SKBPN:
          return BelumMenikahPage(layananModel: widget.layananModel);
        case AppConstants.SKPN:
          return PernahMenikahPage(layananModel: widget.layananModel);
        case AppConstants.SPCK:
          return KepolisianPage(layananModel: widget.layananModel);
        case AppConstants.SKPOT:
          return PenghasilanPage(layananModel: widget.layananModel);
        case AppConstants.SKTMR:
          return RumahPage(layananModel: widget.layananModel);
        case AppConstants.SSP:
          return SporadikPage(layananModel: widget.layananModel);
        case AppConstants.SKKT:
          return TanahPage(layananModel: widget.layananModel);
        default:
          return Text("Empty");
      }
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            widget.layananModel.name,
            style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16),
          ),
          backgroundColor: backgroundColor1,
          shadowColor: const Color.fromARGB(100, 255, 255, 255),
        ),
        body: getPage());
  }
}
