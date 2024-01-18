import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/kepolisian_controller.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class KepolisianDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const KepolisianDetail({super.key, required this.pengajuanModel});

  @override
  State<KepolisianDetail> createState() => _KepolisianDetailState();
}

class _KepolisianDetailState extends State<KepolisianDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<KepolisianController>()
        .getKepolisian(widget.pengajuanModel.refId!);

    return GetBuilder<KepolisianController>(builder: (controller) {
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
