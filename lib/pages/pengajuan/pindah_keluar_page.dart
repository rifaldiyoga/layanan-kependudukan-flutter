import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/keluarga_controller.dart';
import 'package:layanan_kependudukan/controllers/wilayah_controller.dart';
import 'package:layanan_kependudukan/helpers/loading_helper.dart';
import 'package:layanan_kependudukan/models/kecamatan_response_model.dart';
import 'package:layanan_kependudukan/models/kota_response_model.dart';
import 'package:layanan_kependudukan/models/penduduk_model.dart';
import 'package:layanan_kependudukan/models/pindah_model.dart';
import 'package:layanan_kependudukan/models/provinsi_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/dropdown.dart';
import 'package:layanan_kependudukan/widgets/information_view.dart';

import '../../base/show_message.dart';
import '../../controllers/pengajuan_controller.dart';
import '../../models/layanan_model.dart';
import '../../routes/route_helper.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class PindahKeluarPage extends StatefulWidget {
  final LayananModel layananModel;

  const PindahKeluarPage({super.key, required this.layananModel});

  @override
  State<PindahKeluarPage> createState() => _PindahKeluarPageState();
}

class _PindahKeluarPageState extends State<PindahKeluarPage> {
  final FileType _pickingType = FileType.image;
  List<String> alasanPindahList = [
    "Pekerjaan",
    "Pendidikan",
    "Keamanan",
    "Kesehatan",
    "Perumahan",
    "Keluarga"
  ];
  List<String> jenisPindahList = [
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

  List<PlatformFile>? _paths;
  String? _extension;
  String? _fileName;
  ProvinsiModel? provinsiModel;
  KotaModel? kotaModel;
  KecamatanModel? kecamatanModel;
  String? jenisPindah;
  String? kkTidakPindah;
  String? kkPindah;

  var alasanPindahController = TextEditingController();
  var alamatTujuanController = TextEditingController();
  var rtController = TextEditingController();
  var rwController = TextEditingController();
  var kelurahanController = TextEditingController();
  var kecamatanController = TextEditingController();
  var kotaController = TextEditingController();
  var provinsiController = TextEditingController();
  var kodePosController = TextEditingController();
  var teleponController = TextEditingController();
  var jenisPindahController = TextEditingController();
  var statusTidakPindahController = TextEditingController();
  var statusPindahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.find<WilayahController>().getProvinsi();
    Get.find<KeluargaController>().getKeluarga();

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

    Widget inputAlasanPindah() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Alasan Pindah",
          hintText: "Cth. Keprluan Pekerjaan",
          controller: alasanPindahController,
        ),
      );
    }

    Widget inputAlamat() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Alamat Tujuan",
          hintText: "Cth. Jl. Gajah Mada",
          controller: alamatTujuanController,
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

    Widget inputKelurahan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Kelurahan",
          controller: kelurahanController,
          hintText: "Cth. Ngaglik",
        ),
      );
    }

    Widget inputRW() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan RW",
          controller: rwController,
          hintText: "Cth. 001",
          keyboardType: TextInputType.number,
        ),
      );
    }

    Widget inputRT() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan RT",
          controller: rtController,
          hintText: "Cth. 001",
          keyboardType: TextInputType.number,
        ),
      );
    }

    Widget inputKodePos() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Kode Pos",
          controller: kodePosController,
          hintText: "Cth. 65312",
          keyboardType: TextInputType.number,
        ),
      );
    }

    Widget inputTelepon() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Telepon",
          controller: teleponController,
          hintText: "Cth. 081234567890",
          keyboardType: TextInputType.phone,
        ),
      );
    }

    Widget inputJenisKepindahan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomDropDown(
          value: jenisPindah,
          onChange: (value) {
            setState(() {
              jenisPindah = value;
            });
          },
          items: jenisPindahList,
          titleText: "Masukkan Jenis Kepindahan",
          controller: jenisPindahController,
        ),
      );
    }

    Widget inputStatusTidakPindah() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomDropDown(
          items: statusTidaList,
          value: kkTidakPindah,
          onChange: (value) {
            setState(() {
              kkTidakPindah = value;
            });
          },
          titleText: "Pilih Status KK Keluraga yang Tidak Pindah",
          controller: statusTidakPindahController,
        ),
      );
    }

    Widget inputStatusPindah() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomDropDown(
          items: statusTidaList,
          value: kkPindah,
          onChange: (value) {
            setState(() {
              kkPindah = value;
            });
          },
          titleText: "Pilih Status KK Keluraga Yang Pindah",
          controller: statusPindahController,
        ),
      );
    }

    Widget inputLampiran() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomChooseFile(
          titleText: "Pilih Foto",
          path: _paths?.firstOrNull?.name,
          onPressed: () {
            _pickFiles();
          },
        ),
      );
    }

    Widget penduduk(
        PendudukModel? pendudukModel, KeluargaController keluargaController) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${pendudukModel?.nik}",
                      style: primaryTextStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                        "${pendudukModel?.fullname} (${pendudukModel?.statusFamily})")
                  ],
                ),
                const Spacer(),
                InkWell(
                  child: const Icon(
                    Icons.close,
                    size: 18,
                  ),
                  onTap: () {
                    keluargaController.onDeletePenduduk(pendudukModel!);
                  },
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          )
        ],
      );
    }

    Widget listKeluarga(KeluargaController keluargaController) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Anggota Keluraga Yang Pindah",
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text("Hapus anggota keluraga jika tidak ikut pindah",
                style: secondaryTextStyle),
            for (var i in keluargaController.pendudukModel)
              penduduk(i, keluargaController)
          ],
        ),
      );
    }

    onSubmit(PengajuanController pengajuanController,
        KeluargaController keluargaController) {
      var alasanPindah = alasanPindahController.text.toString();
      var alamatTujuan = alamatTujuanController.text.toString();
      var rt = rtController.text.toString();
      var rw = rwController.text.toString();
      var kelurahan = kelurahanController.text.toString();
      var kecamatan = kecamatanController.text.toString();
      var provinsi = provinsiController.text.toString();
      var kodePos = kodePosController.text.toString();
      var telepon = teleponController.text.toString();
      var jenisPindah = this.jenisPindah;
      var statusPindah = this.kkPindah;
      var statusTidakPindah = kkTidakPindah;

      var msg = "";

      if (_paths == null) {
        msg = "Lampiran tidak boleh kosong!";
      }

      if (msg.isEmpty) {
        Get.find<LoadingHelper>().showLoadingHelper(context);
        pengajuanController
            .postPindah(PindahModel(
                type: "Pindah Keluar",
                alasanPindah: alasanPindah,
                alamatTujuan: alamatTujuan,
                rw: rw,
                rt: rt,
                kelurahan: kelurahan,
                subdistrictId: kecamatanModel?.id,
                districtId: kotaModel?.id,
                provinceId: provinsiModel?.id,
                kodePos: kodePos,
                telepon: telepon,
                jenisKepindahan: jenisPindah,
                statusTidakPindah: statusTidakPindah,
                statusPindah: statusPindah,
                nikKepalaKeluarga:
                    keluargaController.keluargaModel?.nikKepalaKeluarga,
                lampiran: _paths != null && _paths!.isNotEmpty
                    ? File(_paths![0].path!)
                    : null))
            .then((status) {
          Get.find<LoadingHelper>().dismissLoading();
          if (status.code == 200) {
            keluargaController.pendudukModel.forEachIndexed((int, model) {
              model.pindahId = status.data!.id!;
              pengajuanController.postPindahDetail(model).then((value) => {});
            });
            showMessage(status.message ?? "");
            Get.offAllNamed(RouteHelper.getHome());
          } else {
            showMessage(status.message ?? "");
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
                  inputAlasanPindah(),
                  inputAlamat(),
                  inputProvinsi(wilayahController),
                  inputKota(wilayahController),
                  inputKecamatan(wilayahController),
                  inputKelurahan(),
                  inputRW(),
                  inputRT(),
                  inputKodePos(),
                  inputTelepon(),
                  inputJenisKepindahan(),
                  inputStatusTidakPindah(),
                  inputStatusPindah(),
                  inputLampiran(),
                  listKeluarga(keluargaController),
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
