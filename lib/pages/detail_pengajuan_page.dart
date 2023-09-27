import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/user_controller.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/badge_status.dart';

import '../widgets/button.dart';

class DetailPengajuanPage extends StatelessWidget {
  final PengajuanModel pengajuanModel;
  const DetailPengajuanPage({super.key, required this.pengajuanModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: backgroundColor1,
        shadowColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      bottomNavigationBar: Get.find<UserController>().getUser().role !=
              "PENDUDUK"
          ? Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      child: SecondaryButton(text: "Tolak", onPressed: () {})),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: PrimaryButton(
                          text: "Setujui",
                          onPressed: () {
                            Navigator.pushNamed(context, "/tanda-tangan");
                          })),
                ],
              ),
            )
          : SizedBox(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BadgeStatus(status: pengajuanModel.status!),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Pengajuan ${pengajuanModel.layanan}",
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/image_profile.jpg",
                    height: 20,
                    width: 20,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  pengajuanModel.name!,
                  style: blueTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              DateFormater.dateToTimeAgo(pengajuanModel.createdAt!),
              style: secondaryTextStyle.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 24,
            ),
            Wrap(
              runSpacing: 8,
              children: [
                const Text("Dengan ini menerangkan bahwa : "),
                Text("Nama : ${pengajuanModel.name!}"),
                const Text("Tempat, Tgl Lahir : Sidorajo, 20 Mei 2003"),
                const Text("Alamat : Jl. Pahlawan No RT 1 RW 2"),
                Text(
                    "Berniat untuk meminta surat pengantar untuk keperluan \"${pengajuanModel.keterangan}\"")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
