import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/helpers/loading_helper.dart';
import 'package:layanan_kependudukan/models/tanah_model.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';
import 'package:layanan_kependudukan/widgets/information_view.dart';

import '../../base/show_message.dart';
import '../../controllers/pengajuan_controller.dart';
import '../../models/layanan_model.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class SporadikPage extends StatefulWidget {
  final LayananModel layananModel;

  const SporadikPage({super.key, required this.layananModel});

  @override
  State<SporadikPage> createState() => _SporadikPageState();
}

class _SporadikPageState extends State<SporadikPage> {
  final FileType _pickingType = FileType.any;

  List<PlatformFile>? _paths;
  String? _extension;
  String? _fileName;

  var keperluanPengajuanController = TextEditingController();
  var tujuanController = TextEditingController();
  var lokasiController = TextEditingController();
  var luasController = TextEditingController();
  var batasBaratController = TextEditingController();
  var batasTimurController = TextEditingController();
  var batasUtaraController = TextEditingController();
  var batasSelatanController = TextEditingController();
  var saksi1Controller = TextEditingController();
  var saksi2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _pickFiles() async {
      try {
        _paths = (await FilePicker.platform.pickFiles(
          type: _pickingType,
          allowMultiple: false,
          onFileLoading: (FilePickerStatus status) => print(status),
          allowedExtensions: (_extension?.isNotEmpty ?? false)
              ? _extension?.replaceAll(' ', '').split(',')
              : null,
        ))
            ?.files;
      } on PlatformException catch (e) {
        print('Unsupported operation$e');
      } catch (e) {
        print(e.toString());
      }
      if (!mounted) return;
      setState(() {
        _fileName =
            _paths != null ? _paths!.map((e) => e.name).toString() : '...';
      });
    }

    Widget inputKeperluanPengajuan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Keperluan Pengajuan",
          hintText: "Cth. Pelengkap Persyartan PBB",
          controller: keperluanPengajuanController,
        ),
      );
    }

    Widget inputLokasi() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Lokasi",
          hintText: "Cth. Jl. Gajah Mada",
          controller: lokasiController,
          keyboardType: TextInputType.multiline,
        ),
      );
    }

    Widget inputLuas() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Luas",
          controller: luasController,
          hintText: "Cth. 200",
          keyboardType: TextInputType.number,
        ),
      );
    }

    Widget inputBatasBarat() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Batas Barat",
          hintText: "Cth. Jalan Utama",
          controller: batasBaratController,
        ),
      );
    }

    Widget inputBatasTimur() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Batas Timur",
          hintText: "Cth. Jalan Utama",
          controller: batasTimurController,
        ),
      );
    }

    Widget inputBatasUtara() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Batas Utara",
          hintText: "Cth. Jalan Utama",
          controller: batasUtaraController,
        ),
      );
    }

    Widget inputBatasSelatan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Batas Selatan",
          hintText: "Cth. Jalan Utama",
          controller: batasSelatanController,
        ),
      );
    }

    Widget inputSaksi1() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Saksi 1",
          hintText: "Cth. Budi",
          controller: saksi1Controller,
        ),
      );
    }

    Widget inputSaksi2() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Saksi 2",
          hintText: "Cth. Budi",
          controller: saksi2Controller,
        ),
      );
    }

    Widget inputFoto() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomChooseFile(
          titleText: "Pilih Lampiran Surat Pernyataan Tidak Sengketa",
          path: _paths?.firstOrNull?.name,
          onPressed: () {
            _pickFiles();
          },
        ),
      );
    }

    onSubmit(PengajuanController pengajuanController) {
      var keterangan = keperluanPengajuanController.text.toString();
      var lokasi = lokasiController.text.toString();
      var luas = luasController.text.toString();
      var batasBarat = batasBaratController.text.toString();
      var batasTimur = batasTimurController.text.toString();
      var batasUtara = batasUtaraController.text.toString();
      var batasSelatan = batasSelatanController.text.toString();
      var saksi1 = saksi1Controller.text.toString();
      var saksi2 = saksi2Controller.text.toString();

      var msg = "";

      if (keterangan.isEmpty) {
        msg = "Keperluan pengajuan tidak boleh kosong!";
      }

      if (lokasi.isEmpty) {
        msg = "Lokasi tidak boleh kosong!";
      }

      if (luas.isEmpty) {
        msg = "Luas tidak boleh kosong!";
      }

      if (batasBarat.isEmpty) {
        msg = "Batas Barat tidak boleh kosong!";
      }

      if (batasTimur.isEmpty) {
        msg = "Batas Timur tidak boleh kosong!";
      }

      if (batasUtara.isEmpty) {
        msg = "Batas Utara tidak boleh kosong!";
      }

      if (batasSelatan.isEmpty) {
        msg = "Batas Selatan tidak boleh kosong!";
      }

      if (_paths == null) {
        msg = "Lampiran tidak boleh kosong!";
      }

      if (msg.isEmpty) {
        Get.find<LoadingHelper>().showLoadingHelper(context);
        pengajuanController
            .postTanah(TanahModel(
                type: "Sporadik",
                keterangan: keterangan,
                lokasi: lokasi,
                luasTanah: luas,
                batasBarat: batasBarat,
                batasTimur: batasTimur,
                batasUtara: batasUtara,
                batasSelatan: batasSelatan,
                saksi1: saksi1,
                saksi2: saksi2,
                lampiran: _paths != null && _paths!.isNotEmpty
                    ? File(_paths![0].path!)
                    : null))
            .then((status) {
          Get.find<LoadingHelper>().dismissLoading();
          if (status.isSuccess) {
            showMessage(status.message);
            Get.offAllNamed(RouteHelper.getHome());
          } else {
            showMessage(status.message);
          }
        });
      } else {
        showMessage(msg);
      }
    }

    return GetBuilder<PengajuanController>(builder: (articleController) {
      return SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              InformationView(info: widget.layananModel.info ?? ""),
              inputKeperluanPengajuan(),
              inputLokasi(),
              inputLuas(),
              inputBatasBarat(),
              inputBatasTimur(),
              inputBatasUtara(),
              inputBatasSelatan(),
              inputSaksi1(),
              inputSaksi2(),
              inputFoto(),
              PrimaryButton(
                  text: "Submit", onPressed: () => onSubmit(articleController))
            ],
          ),
        ),
      );
    });
  }
}
