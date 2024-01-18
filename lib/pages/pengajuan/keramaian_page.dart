import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/helpers/loading_helper.dart';
import 'package:layanan_kependudukan/models/keramaian_model.dart';
import 'package:layanan_kependudukan/widgets/information_view.dart';

import '../../base/show_message.dart';
import '../../controllers/pengajuan_controller.dart';
import '../../models/layanan_model.dart';
import '../../routes/route_helper.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class KeramaianPage extends StatefulWidget {
  final LayananModel layananModel;

  const KeramaianPage({super.key, required this.layananModel});

  @override
  State<KeramaianPage> createState() => _KeramaianPageState();
}

class _KeramaianPageState extends State<KeramaianPage> {
  final FileType _pickingType = FileType.any;

  List<PlatformFile>? _paths;
  String? _extension;
  String? _fileName;

  var keperluanPengajuanController = TextEditingController();
  var namaAcaraController = TextEditingController();
  var telpController = TextEditingController();
  var tanggalAcaraController = TextEditingController();
  var waktuAcaraController = TextEditingController();
  var tempatAcaraController = TextEditingController();
  var alamatAcaraController = TextEditingController();

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

    Widget inputTelp() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan No. Telpon",
          controller: telpController,
          hintText: "Cth. 0891234567890",
          keyboardType: TextInputType.phone,
        ),
      );
    }

    Widget inputNamaAcara() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Nama Acara",
          controller: namaAcaraController,
          hintText: "Cth. Acara Pernikahan",
        ),
      );
    }

    Widget inputTanggalAcara() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Tanggal Acara",
          controller: tanggalAcaraController,
          keyboardType: TextInputType.datetime,
          type: TypeField.DATE,
        ),
      );
    }

    Widget inputWaktuAcara() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Waktu Acara",
          controller: waktuAcaraController,
          type: TypeField.TIME,
        ),
      );
    }

    Widget inputTempatAcara() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Tempat Acara",
          hintText: "Cth. Gedung Serbaguna",
          controller: tempatAcaraController,
        ),
      );
    }

    Widget inputAlamatAcara() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Alamat Acara",
          hintText: "Cth. Jl. Gajah Mada",
          controller: alamatAcaraController,
        ),
      );
    }

    Widget inputKeperluanPengajuan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Keperluan Pengajuan",
          controller: keperluanPengajuanController,
          hintText: "Cth. Pengajuan Ijin Acara Pernikahan",
        ),
      );
    }

    Widget inputFoto() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomChooseFile(
          titleText: "Pilih Lampiran",
          path: _paths?.firstOrNull?.name,
          onPressed: () {
            _pickFiles();
          },
        ),
      );
    }

    onSubmit(PengajuanController pengajuanController) {
      var keterangan = keperluanPengajuanController.text.toString();
      var namaAcara = namaAcaraController.text.toString();
      var telp = telpController.text.toString();
      var tanggalAcara = tanggalAcaraController.text.toString();
      var waktu = waktuAcaraController.text.toString();
      var tempatAcara = tempatAcaraController.text.toString();
      var alamatAcara = alamatAcaraController.text.toString();

      var msg = "";

      if (keterangan.isEmpty) {
        msg = "Keperluan pengajuan tidak boleh kosong!";
      }

      if (telp.isEmpty) {
        msg = "No. Telpon tidak boleh kosong!";
      }

      if (namaAcara.isEmpty) {
        msg = "Nama Acara tidak boleh kosong!";
      }

      if (tanggalAcara.isEmpty) {
        msg = "Tanggal Acara tidak boleh kosong!";
      }

      if (waktu.isEmpty) {
        msg = "Waktu Acara tidak boleh kosong!";
      }

      if (tempatAcara.isEmpty) {
        msg = "Tempat Acara tidak boleh kosong!";
      }

      if (alamatAcara.isEmpty) {
        msg = "Alamat Acara tidak boleh kosong!";
      }

      if (msg.isEmpty) {
        Get.find<LoadingHelper>().showLoadingHelper(context);
        pengajuanController
            .postKeramaian(KeramaianModel(
                keterangan: keterangan,
                namaAcara: namaAcara,
                tanggal:
                    DateFormater.stringToDateTime(tanggalAcara, "yyyy-MM-dd"),
                telpon: telp,
                tempat: tempatAcara,
                waktu: waktu,
                alamat: alamatAcara,
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
            inputTelp(),
            inputNamaAcara(),
            inputTanggalAcara(),
            inputWaktuAcara(),
            inputTempatAcara(),
            inputAlamatAcara(),
            inputFoto(),
            PrimaryButton(
                text: "Submit", onPressed: () => onSubmit(articleController))
          ],
        ),
      ));
    });
  }
}
