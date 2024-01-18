import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/helpers/loading_helper.dart';
import 'package:layanan_kependudukan/models/sku_model.dart';
import 'package:layanan_kependudukan/widgets/information_view.dart';

import '../../base/show_message.dart';
import '../../controllers/pengajuan_controller.dart';
import '../../models/layanan_model.dart';
import '../../routes/route_helper.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class SKUPage extends StatefulWidget {
  final LayananModel layananModel;

  const SKUPage({super.key, required this.layananModel});

  @override
  State<SKUPage> createState() => _SKUPageState();
}

class _SKUPageState extends State<SKUPage> {
  final FileType _pickingType = FileType.image;

  var usahaPengajuan = TextEditingController();
  var keperluanPengajuan = TextEditingController();

  List<PlatformFile>? _paths;
  String? _extension;
  String? _fileName;

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

    Widget inputUsaha() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Usaha",
          controller: usahaPengajuan,
          hintText: "Cth. Pedagang Makanan",
        ),
      );
    }

    Widget inputKeperluanPengajuan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Masukkan Keperluan Pengajuan",
          controller: keperluanPengajuan,
          hintText: "Cth. Persyaratan Pengajuan Bantuan",
        ),
      );
    }

    Widget inputFoto() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomChooseFile(
          titleText: "Pilih Foto Usaha",
          path: _paths?.firstOrNull?.name,
          onPressed: () {
            _pickFiles();
          },
        ),
      );
    }

    onSubmit(PengajuanController pengajuanController) {
      var keterangan = keperluanPengajuan.text.toString();
      var usaha = usahaPengajuan.text.toString();
      var msg = "";

      if (keterangan.isEmpty) {
        msg = "Keperluan pengajuan tidak boleh kosong!";
      }

      if (msg.isEmpty) {
        Get.find<LoadingHelper>().showLoadingHelper(context);
        pengajuanController
            .postSKU(SKUModel(
                usaha: usaha,
                keterangan: keterangan,
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
      return Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            InformationView(info: widget.layananModel.info ?? ""),
            inputKeperluanPengajuan(),
            inputUsaha(),
            inputFoto(),
            const Spacer(),
            PrimaryButton(
                text: "Submit", onPressed: () => onSubmit(articleController))
          ],
        ),
      );
    });
  }
}
