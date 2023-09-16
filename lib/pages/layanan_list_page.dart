import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/layanan_controller.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/layanan_section.dart';

class LayananListPage extends StatelessWidget {
  const LayananListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<LayananController>().getLayanan();

    Widget layananList(LayananController layananController) {
      return Column(
        children: [
          for (var type in layananController.layananList)
            LayananSection(typeModel: type)
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Daftar Layanan",
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16),
        ),
        backgroundColor: backgroundColor1,
        shadowColor: Color.fromARGB(0, 255, 255, 255),
      ),
      body: GetBuilder<LayananController>(builder: (articleController) {
        return SingleChildScrollView(
            child: articleController.layananList.isNotEmpty
                ? layananList(articleController)
                : Text("Empty"));
      }),
    );
  }
}
