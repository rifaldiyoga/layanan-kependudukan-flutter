import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/pengajuan_controller.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/notification_item.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PengajuanController>().getPengajuan();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Notifikasi",
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16),
        ),
        backgroundColor: backgroundColor1,
        shadowColor: const Color.fromARGB(100, 255, 255, 255),
      ),
      body: GetBuilder<PengajuanController>(builder: (articleController) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              children: articleController.pengajuanList
                  .map((e) => NotificationItem(
                        pengajuanModel: e,
                      ))
                  .toList()),
        );
      }),
    );
  }
}
