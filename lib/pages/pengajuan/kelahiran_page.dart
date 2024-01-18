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
import 'package:layanan_kependudukan/models/kelahiran_model.dart';
import 'package:layanan_kependudukan/models/kota_response_model.dart';
import 'package:layanan_kependudukan/models/provinsi_response_model.dart';
import 'package:layanan_kependudukan/widgets/dropdown.dart';
import 'package:layanan_kependudukan/widgets/information_view.dart';

import '../../base/show_message.dart';
import '../../controllers/pengajuan_controller.dart';
import '../../models/layanan_model.dart';
import '../../routes/route_helper.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class KelahiranPage extends StatefulWidget {
  final LayananModel layananModel;

  const KelahiranPage({super.key, required this.layananModel});

  @override
  State<KelahiranPage> createState() => _KelahiranPageState();
}

class _KelahiranPageState extends State<KelahiranPage> {
  final FileType _pickingType = FileType.any;
  List<String> alasanKelahiranList = [
    "Pekerjaan",
    "Pendidikan",
    "Keamanan",
    "Kesehatan",
    "Perumahan",
    "Keluarga"
  ];
  List<String> jenisKelahiranList = [
    "Kep. Keluarga",
    "Kep. Keluarga dan Seluruh Angg. Keluarga",
    "Kep. Keluarga dan Sbg. Angg. Keluarga",
    "Anggota Keluraga",
  ];
  List<String> jkList = ["Laki - Laki", "Perempuan"];

  List<PlatformFile>? _pathNikahs;
  List<PlatformFile>? _pathRss;
  String? _extension;
  String? _fileName;
  ProvinsiModel? provinsiModel;
  KotaModel? kotaModel;
  KecamatanModel? kecamatanModel;
  String? jenisKelahiran;
  String? kkTidakKelahiran;
  String? kkKelahiran;

  var alasanKelahiranController = TextEditingController();
  var namaController = TextEditingController();
  var nikAyahController = TextEditingController();
  var nikIbuController = TextEditingController();
  var tglLahirController = TextEditingController();
  var tempatLahirController = TextEditingController();
  var jkController = TextEditingController();
  var jamController = TextEditingController();
  var kecamatanController = TextEditingController();
  var kotaController = TextEditingController();
  var provinsiController = TextEditingController();

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
          controller: alasanKelahiranController,
          hintText: "Cth. Pembuatan Akta",
        ),
      );
    }

    Widget inputNama() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Nama",
          hintText: "Cth. Budi",
          controller: namaController,
        ),
      );
    }

    Widget inputProvinsi(WilayahController wilayahController) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomAutoComplete(
          items: wilayahController.provinsiList
              .map((e) => e.name.toString())
              .toList(),
          onSelected: (value) {
            var provinsi = wilayahController.provinsiList
                .firstWhere((element) => element.name == value);
            Get.find<WilayahController>().getKota(provinsi.id!);
            setState(() {
              provinsiModel = provinsi;
            });
          },
          hintText: "Pilih Provinsi",
          controller: provinsiController,
        ),
      );
    }

    Widget inputKota(WilayahController wilayahController) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomAutoComplete(
          items:
              wilayahController.kotaList.map((e) => e.name.toString()).toList(),
          onSelected: (value) {
            var kota = wilayahController.kotaList
                .firstWhere((element) => element.name == value);
            Get.find<WilayahController>().getKecamatan(kota.id!);
            setState(() {
              kotaModel = kota;
            });
          },
          hintText: "Pilih Kota",
          controller: kotaController,
        ),
      );
    }

    Widget inputKecamatan(WilayahController wilayahController) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomAutoComplete(
          items: wilayahController.kecamatanList
              .map((e) => e.name.toString())
              .toList(),
          onSelected: (value) {
            var kota = wilayahController.kecamatanList
                .firstWhere((element) => element.name == value);
            setState(() {
              kecamatanModel = kota;
            });
          },
          hintText: "Pilih Kecamatan",
          controller: kecamatanController,
        ),
      );
    }

    Widget inputTempatLahir() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Tempat Lahir",
          controller: tempatLahirController,
          hintText: "Cth. Kota Batu",
        ),
      );
    }

    Widget inputTanggalLahir() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Tanggal Lahir",
          controller: tglLahirController,
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

    Widget inputJK() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomDropDown(
          items: jkList,
          titleText: "Masukkan Jenis Kelamin",
          controller: jkController,
          value: jenisKelahiran,
          onChange: (value) {
            setState(() {
              jenisKelahiran = value;
            });
          },
        ),
      );
    }

    Widget inputNikAyah() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan NIK Ayah",
          controller: nikAyahController,
          hintText: "Cth. 35100000000000000001",
          keyboardType: TextInputType.number,
        ),
      );
    }

    Widget inputNikIbu() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan NIK Ibu",
          controller: nikIbuController,
          hintText: "Cth. 35100000000000000001",
          keyboardType: TextInputType.number,
        ),
      );
    }

    Widget inputLampiranBukuNikah() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomChooseFile(
          titleText: "Pilih Lampiran Buku Nikah",
          path: _pathNikahs?.firstOrNull?.name,
          onPressed: () {
            _pickFilesNikah();
          },
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
      var alasanKelahiran = alasanKelahiranController.text.toString();
      var nama = namaController.text.toString();
      var nikAyah = nikAyahController.text.toString();
      var tempatLahir = tempatLahirController.text.toString();
      var nikIbu = nikIbuController.text.toString();
      var jam = jamController.text.toString();
      var jk = jkController.text.toString();
      var tglLahir = tglLahirController.text.toString();
      var kecamatan = kecamatanController.text.toString();
      var provinsi = provinsiController.text.toString();
      var jenisKelahiran = this.jenisKelahiran;
      var statusKelahiran = this.kkKelahiran;
      var statusTidakKelahiran = kkTidakKelahiran;

      var msg = "";

      if (_pathNikahs == null) {
        msg = "Lampiran tidak boleh kosong!";
      }

      if (msg.isEmpty) {
        Get.find<LoadingHelper>().showLoadingHelper(context);
        pengajuanController
            .postKelahiran(
          KelahiranModel(
              keterangan: alasanKelahiran,
              nama: nama,
              nikAyah: nikAyah,
              nikIbu: nikIbu,
              birthPlace: tempatLahir,
              birthDate: DateFormater.stringToDateTime(tglLahir, "yyyy-MM-dd"),
              jam: jam,
              jk: jk == "Perempuan" ? "P" : "L",
              subdistrictId: kecamatanModel?.id,
              districtId: kotaModel?.id,
              provinceId: provinsiModel?.id,
              lampiranBukuNikah: _pathNikahs != null && _pathNikahs!.isNotEmpty
                  ? File(_pathNikahs![0].path!)
                  : null,
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
                  inputNikAyah(),
                  inputNikIbu(),
                  inputNama(),
                  inputJK(),
                  inputTempatLahir(),
                  inputTanggalLahir(),
                  inputJam(),
                  // inputProvinsi(wilayahController),
                  // inputKota(wilayahController),
                  // inputKecamatan(wilayahController),
                  inputLampiranBukuNikah(),
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
