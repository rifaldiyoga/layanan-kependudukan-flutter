import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/keluarga_controller.dart';
import 'package:layanan_kependudukan/controllers/wilayah_controller.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/helpers/loading_helper.dart';
import 'package:layanan_kependudukan/models/kecamatan_response_model.dart';
import 'package:layanan_kependudukan/models/kematian_model.dart';
import 'package:layanan_kependudukan/models/kota_response_model.dart';
import 'package:layanan_kependudukan/models/provinsi_response_model.dart';
import 'package:layanan_kependudukan/widgets/information_view.dart';

import '../../base/show_message.dart';
import '../../controllers/pengajuan_controller.dart';
import '../../models/layanan_model.dart';
import '../../routes/route_helper.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class KematianPage extends StatefulWidget {
  final LayananModel layananModel;

  const KematianPage({super.key, required this.layananModel});

  @override
  State<KematianPage> createState() => _KematianPageState();
}

class _KematianPageState extends State<KematianPage> {
  final FileType _pickingType = FileType.any;
  List<String> alasanKematianList = [
    "Pekerjaan",
    "Pendidikan",
    "Keamanan",
    "Kesehatan",
    "Perumahan",
    "Keluarga"
  ];
  List<String> jenisKematianList = [
    "Kep. Keluarga",
    "Kep. Keluarga dan Seluruh Angg. Keluarga",
    "Kep. Keluarga dan Sbg. Angg. Keluarga",
    "Anggota Keluraga",
  ];
  List<String> statusTidaList = [
    "Numpang KK",
    "Membuat KK Baru",
    "Nomor KK Tetap",
  ];

  List<PlatformFile>? _pathNikahs;
  List<PlatformFile>? _pathRss;
  String? _extension;
  String? _fileName;
  ProvinsiModel? provinsiModel;
  KotaModel? kotaModel;
  KecamatanModel? kecamatanModel;
  String? jenisKematian;
  String? kkTidakKematian;
  String? kkKematian;

  var keperluanController = TextEditingController();
  var namaController = TextEditingController();
  var nikJenazahController = TextEditingController();
  var tglKematianController = TextEditingController();
  var jamController = TextEditingController();
  var sebabController = TextEditingController();
  var tempatController = TextEditingController();
  var saksi1Controller = TextEditingController();
  var saksi2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.find<WilayahController>().getProvinsi();
    Get.find<KeluargaController>().getKeluarga();

    void _pickFilesNikah() async {
      try {
        _pathNikahs = (await FilePicker.platform.pickFiles(
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
        _fileName = _pathNikahs != null
            ? _pathNikahs!.map((e) => e.name).toString()
            : '...';
      });
    }

    void _pickFilesRs() async {
      try {
        _pathRss = (await FilePicker.platform.pickFiles(
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
            _pathRss != null ? _pathRss!.map((e) => e.name).toString() : '...';
      });
    }

    Widget inputKeperluan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Keperluan",
          controller: keperluanController,
          hintText: "Cth. Pengajuan Bantuan",
        ),
      );
    }

    Widget inputNikJenazah() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan NIK Jenazah",
          controller: nikJenazahController,
          hintText: "Cth. 35100000000000000001",
          keyboardType: TextInputType.number,
        ),
      );
    }

    Widget inputTanggalKematian() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Tanggal Kematian",
          controller: tglKematianController,
          type: TypeField.DATE,
        ),
      );
    }

    Widget inputJam() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Jam",
          controller: jamController,
          type: TypeField.TIME,
        ),
      );
    }

    Widget inputSebab() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Sebab Kematian",
          controller: sebabController,
          hintText: "Cth. Sakit Biasa / Tua",
        ),
      );
    }

    Widget inputTempat() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Tempat Kematian",
          controller: tempatController,
          hintText: "Cth. Rumah",
        ),
      );
    }

    Widget inputSaksi1() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Saksi 1",
          controller: saksi1Controller,
          hintText: "Cth. Budi",
        ),
      );
    }

    Widget inputSaksi2() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Saksi 2",
          controller: saksi2Controller,
          hintText: "Cth. Budi",
        ),
      );
    }

    Widget inputLampiranKetRs() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomChooseFile(
          titleText: "Pilih Lampiran Keterangan Rs",
          path: _pathRss?.firstOrNull?.name,
          onPressed: () {
            _pickFilesRs();
          },
        ),
      );
    }

    onSubmit(PengajuanController pengajuanController,
        KeluargaController keluargaController) {
      var alasanKematian = keperluanController.text.toString();
      var nikJenazah = nikJenazahController.text.toString();
      var jam = jamController.text.toString();
      var tglKematian = tglKematianController.text.toString();
      var sebab = sebabController.text.toString();
      var tempat = tempatController.text.toString();
      var saksi1 = saksi1Controller.text.toString();
      var saksi2 = saksi2Controller.text.toString();

      var msg = "";

      if (_pathRss == null) {
        msg = "Lampiran tidak boleh kosong!";
      }

      if (msg.isEmpty) {
        Get.find<LoadingHelper>().showLoadingHelper(context);
        pengajuanController
            .postKematian(
          KematianModel(
              keterangan: alasanKematian,
              nikJenazah: nikJenazah,
              tglKematian:
                  DateFormater.stringToDateTime(tglKematian, "yyyy-MM-dd"),
              jam: jam,
              sebab: sebab,
              tempat: tempat,
              saksi2: saksi2,
              saksi1: saksi1,
              lampiranKetRs: _pathRss != null && _pathRss!.isNotEmpty
                  ? File(_pathRss![0].path!)
                  : null),
        )
            .then((status) {
          Get.find<LoadingHelper>().dismissLoading();
          if (status.isSuccess) {
            Get.offNamed(RouteHelper.getHome());
          } else {
            showMessage(status.message);
          }
        });
      } else {
        showMessage(msg);
      }
    }

    return GetBuilder<PengajuanController>(builder: (pengajuanController) {
      return GetBuilder<WilayahController>(builder: (wilayahController) {
        return GetBuilder<KeluargaController>(builder: (keluargaController) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InformationView(info: widget.layananModel.info ?? ""),
                  inputKeperluan(),
                  inputNikJenazah(),
                  inputTanggalKematian(),
                  inputJam(),
                  inputTempat(),
                  inputSebab(),
                  inputSaksi1(),
                  inputSaksi2(),
                  inputLampiranKetRs(),
                  PrimaryButton(
                      text: "Submit",
                      onPressed: () =>
                          onSubmit(pengajuanController, keluargaController))
                ],
              ),
            ),
          );
        });
      });
    });
  }
}
