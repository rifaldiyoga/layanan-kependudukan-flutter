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
import 'package:layanan_kependudukan/models/berpergian_model.dart';
import 'package:layanan_kependudukan/models/kecamatan_response_model.dart';
import 'package:layanan_kependudukan/models/kota_response_model.dart';
import 'package:layanan_kependudukan/models/penduduk_model.dart';
import 'package:layanan_kependudukan/models/provinsi_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/information_view.dart';

import '../../base/show_message.dart';
import '../../controllers/pengajuan_controller.dart';
import '../../models/layanan_model.dart';
import '../../routes/route_helper.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class BerpergianPage extends StatefulWidget {
  final LayananModel layananModel;

  const BerpergianPage({super.key, required this.layananModel});

  @override
  State<BerpergianPage> createState() => _BerpergianPageState();
}

class _BerpergianPageState extends State<BerpergianPage> {
  final FileType _pickingType = FileType.any;

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
  var tglBerangkatController = TextEditingController();
  var tglKembaliController = TextEditingController();

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
          titleText: "Masukkan Keperluan Berpergian",
          controller: alasanPindahController,
          hintText: "Cth. Urusan Pekerjaan",
        ),
      );
    }

    Widget inputAlamat() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Alamat Tujuan",
          controller: alamatTujuanController,
          hintText: "Cth. Jl. Gajah Mada",
        ),
      );
    }

    Widget inputTglBerangkat() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Tanggal Berangkat",
          controller: tglBerangkatController,
          keyboardType: TextInputType.datetime,
          type: TypeField.DATE,
        ),
      );
    }

    Widget inputTglKembali() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Tanggal Kembali",
          controller: tglKembaliController,
          keyboardType: TextInputType.datetime,
          type: TypeField.DATE,
        ),
      );
    }

    Widget inputLampiran() {
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
      var tglBerangkat = tglBerangkatController.text.toString();
      var tglKembali = tglKembaliController.text.toString();

      var msg = "";

      if (_paths == null) {
        msg = "Lampiran tidak boleh kosong!";
      }

      if (msg.isEmpty) {
        Get.find<LoadingHelper>().showLoadingHelper(context);
        pengajuanController
            .postBerpergian(BerpergianModel(
                keterangan: alasanPindah,
                tujuan: alamatTujuan,
                tglBerangkat:
                    DateFormater.stringToDateTime(tglBerangkat, "yyyy-MM-dd"),
                tglKembali:
                    DateFormater.stringToDateTime(tglKembali, "yyyy-MM-dd"),
                lampiran: _paths != null && _paths!.isNotEmpty
                    ? File(_paths![0].path!)
                    : null))
            .then((status) {
          Get.find<LoadingHelper>().dismissLoading();
          if (status.code == 200) {
            keluargaController.pendudukModel.forEachIndexed((int, model) {
              model.berpergianId = status.data!.id!;
              pengajuanController
                  .postBerpergianDetail(model)
                  .then((value) => {});
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
                  inputTglBerangkat(),
                  inputTglKembali(),
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
