import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/base/show_message.dart';
import 'package:layanan_kependudukan/controllers/pengajuan_controller.dart';
import 'package:layanan_kependudukan/models/layanan_model.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/button.dart';

import '../widgets/text_field.dart';

class PengajuanPage extends StatefulWidget {
  final LayananModel layananModel;

  const PengajuanPage({super.key, required this.layananModel});

  @override
  State<PengajuanPage> createState() => _PengajuanPageState();
}

class _PengajuanPageState extends State<PengajuanPage> {
  @override
  Widget build(BuildContext context) {
    var keperluanPengajuan = TextEditingController();

    Widget inputKeperluanPengajuan() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          hintText: "Keperluan Pengajuan",
          icon: "assets/icon_email.png",
          controller: keperluanPengajuan,
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
        pengajuanController
            .postPengajuan(PengajuanModel(
                keterangan: keterangan,
                layananId: widget.layananModel.id,
                layanan: widget.layananModel.name))
            .then((status) {
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
        body: GetBuilder<PengajuanController>(builder: (articleController) {
          return Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                inputKeperluanPengajuan(),
                const Spacer(),
                PrimaryButton(
                    text: "Submit",
                    onPressed: () => onSubmit(articleController))
              ],
            ),
          );
        }));
  }
}
