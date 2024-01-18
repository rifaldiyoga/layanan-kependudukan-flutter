import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/helpers/loading_helper.dart';
import 'package:layanan_kependudukan/models/domisili_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/dropdown.dart';
import 'package:layanan_kependudukan/widgets/information_view.dart';

import '../../base/show_message.dart';
import '../../controllers/pengajuan_controller.dart';
import '../../models/layanan_model.dart';
import '../../routes/route_helper.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class DomisiliPage extends StatefulWidget {
  final LayananModel layananModel;

  const DomisiliPage({super.key, required this.layananModel});

  @override
  State<DomisiliPage> createState() => _DomisiliPageState();
}

const List<String> jenisList = ["Perorangan", "Perusahaan / Usaha"];
const List<String> jenisBangunanList = ["Milik Sendiri", "Sewa"];

class _DomisiliPageState extends State<DomisiliPage> {
  final FileType _pickingType = FileType.any;

  var jenisController = TextEditingController();
  var keperluanController = TextEditingController();
  var namaPerusahaanController = TextEditingController();
  var jenisPerusahaanController = TextEditingController();
  var alamatPerusahaanController = TextEditingController();
  var telpPerusahaanController = TextEditingController();
  var aktaPerusahaanController = TextEditingController();
  var skPengesahanController = TextEditingController();
  var penganggungJawabController = TextEditingController();

  String _jenis = jenisList.first;
  String _jenisBangunan = jenisBangunanList.first;
  String? _directoryPath;
  String? _fileName;
  List<PlatformFile>? _paths;
  String? _extension;

  @override
  Widget build(BuildContext context) {
    void _pickFiles() async {
      try {
        _directoryPath = null;
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

    Widget dropDownTipeDomisili() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomDropDown(
          items: jenisList,
          value: _jenis,
          titleText: "Pilih Jenis Surat",
          controller: jenisController,
          onChange: (value) {
            setState(
              () {
                _jenis = value!;
              },
            );
          },
        ),
      );
    }

    Widget inputNamaPerusahaan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Nama Perusahaan",
          controller: namaPerusahaanController,
          hintText: "Cth. PT. ABC",
        ),
      );
    }

    Widget inputJenisPerusahaan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Jenis Perusahaan",
          controller: jenisPerusahaanController,
          hintText: "Cth. Industri Pabrik",
        ),
      );
    }

    Widget inputAlamatPerusahaan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Alamat Perusahaan",
          controller: alamatPerusahaanController,
          hintText: "Cth. Jl. Gajah Mada",
        ),
      );
    }

    Widget inputTelpPerusahaan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan No Telpon Perusahaan",
          controller: telpPerusahaanController,
          hintText: "Cth. 034112345",
          keyboardType: TextInputType.phone,
        ),
      );
    }

    Widget statusBangunanPerusahaan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomDropDown(
          titleText: "Pilih Status Bangunan",
          controller: penganggungJawabController,
          items: jenisBangunanList,
          value: _jenisBangunan,
          onChange: (value) {
            setState(
              () {
                _jenisBangunan = value!;
              },
            );
          },
        ),
      );
    }

    Widget aktaPendirianPerusahaan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan No. Akta Pendirian Perusahaan",
          controller: aktaPerusahaanController,
          hintText: "Cth. 043 A/HK.024/323010/1998",
        ),
      );
    }

    Widget skPengesahaanPerusahaan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan SK Pengesahan Kehakiman",
          controller: skPengesahanController,
        ),
      );
    }

    Widget penganggungJawabPerusahaan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Penanggung Jawab Perusahaan",
          controller: penganggungJawabController,
          hintText: "Cth. Budi",
        ),
      );
    }

    Widget lampiranPerusahaan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomChooseFile(
          titleText: "Masukkan Surat Jaminan Perusahaan",
          path: _paths?.firstOrNull?.name,
          onPressed: () {
            _pickFiles();
          },
        ),
      );
    }

    Widget inputPerusahaan() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Perusahan",
            style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Masukkan detail perusahaan ",
            style: secondaryTextStyle,
          ),
          SizedBox(height: 16),
          inputNamaPerusahaan(),
          inputJenisPerusahaan(),
          inputAlamatPerusahaan(),
          inputTelpPerusahaan(),
          statusBangunanPerusahaan(),
          aktaPendirianPerusahaan(),
          // skPengesahaanPerusahaan(),
          penganggungJawabPerusahaan(),
          lampiranPerusahaan()
        ],
      );
    }

    Widget inputKeperluanPengajuan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Keperluan Pengajuan",
          controller: keperluanController,
          hintText: "Cth. Keprluan Pekerjaan",
        ),
      );
    }

    onSubmit(PengajuanController pengajuanController) {
      var keterangan = keperluanController.text.toString();
      var namaPerusahaan = namaPerusahaanController.text.toString();
      var jenisPerusahaan = jenisPerusahaanController.text.toString();
      var alamatPerusahaan = alamatPerusahaanController.text.toString();
      var telpPerusahaan = telpPerusahaanController.text.toString();
      var aktaPerusahaan = aktaPerusahaanController.text.toString();
      var skPengesahan = skPengesahanController.text.toString();
      var penganggungJawab = penganggungJawabController.text.toString();

      var msg = "";

      if (keterangan.isEmpty) {
        msg = "Keperluan pengajuan tidak boleh kosong!";
      }

      if (_jenis == jenisList[1]) {
        if (namaPerusahaan.isEmpty) {
          msg = "Nama Perusahaan tidak boleh kosong!";
        }

        if (jenisPerusahaan.isEmpty) {
          msg = "Jenis Perusahaan tidak boleh kosong!";
        }

        if (alamatPerusahaan.isEmpty) {
          msg = "Alamat Perusahaan tidak boleh kosong!";
        }

        if (telpPerusahaan.isEmpty) {
          msg = "Telepon Perusahan tidak boleh kosong!";
        }

        if (aktaPerusahaan.isEmpty) {
          msg = "Akta Perusahaan tidak boleh kosong!";
        }

        if (_paths == null) {
          msg = "Lampiran tidak boleh kosong!";
        }
      }

      if (msg.isEmpty) {
        Get.find<LoadingHelper>().showLoadingHelper(context);
        pengajuanController
            .postDomisili(DomisiliModel(
                keterangan: keterangan,
                type: _jenis,
                alamatPerusahaan: alamatPerusahaan,
                namaPerusahaan: namaPerusahaan,
                jenisPerusahaan: jenisPerusahaan,
                telpPerusahaan: telpPerusahaan,
                aktaPerusahaan: aktaPerusahaan,
                statusBangunan: _jenisBangunan,
                skPengesahan: skPengesahan,
                penanggungJawab: penganggungJawab,
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
              dropDownTipeDomisili(),
              inputKeperluanPengajuan(),
              _jenis == jenisList[1] ? inputPerusahaan() : SizedBox(),
              PrimaryButton(
                  text: "Submit", onPressed: () => onSubmit(articleController))
            ],
          ),
        ),
      );
    });
  }
}
