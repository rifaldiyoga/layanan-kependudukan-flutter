import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/janda_controller.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class JandaDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const JandaDetail({super.key, required this.pengajuanModel});

  @override
  State<JandaDetail> createState() => _JandaDetailState();
}

class _JandaDetailState extends State<JandaDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<JandaController>().getJanda(widget.pengajuanModel.refId!);

    return GetBuilder<JandaController>(builder: (controller) {
      return Container(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            DocumentItem(path: controller.berpergianModel?.lampiranPath ?? "")
          ],
        ),
      );
    });
  }
}
