import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/helpers/loading_helper.dart';
import 'package:layanan_kependudukan/models/sktm_model.dart';
import 'package:layanan_kependudukan/widgets/information_view.dart';

import '../../base/show_message.dart';
import '../../controllers/pengajuan_controller.dart';
import '../../models/layanan_model.dart';
import '../../routes/route_helper.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class SKTMPage extends StatefulWidget {
  final LayananModel layananModel;

  const SKTMPage({super.key, required this.layananModel});

  @override
  State<SKTMPage> createState() => _SKTMPageState();
}

class _SKTMPageState extends State<SKTMPage> {
  var keperluanPengajuan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget inputKeperluanPengajuan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Keperluan Pengajuan",
          controller: keperluanPengajuan,
          hintText: "Cth. Keprluan Pendaftaran Sekolah",
        ),
      );
    }

    onSubmit(PengajuanController pengajuanController) {
      var keterangan = keperluanPengajuan.text.toString();
      var msg = "";

      if (keterangan.isEmpty) {
        msg = "Keperluan pengajuan tidak boleh kosong!";
      }

      if (msg.isEmpty) {
        Get.find<LoadingHelper>().showLoadingHelper(context);
        pengajuanController
            .postSKTM(SKTMModel(
          keterangan: keterangan,
        ))
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
            const Spacer(),
            PrimaryButton(
                text: "Submit", onPressed: () => onSubmit(articleController))
          ],
        ),
      );
    });
  }
}
