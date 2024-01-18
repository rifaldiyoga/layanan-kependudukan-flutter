import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/belum_menikah_controller.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class BelumMenikahDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const BelumMenikahDetail({super.key, required this.pengajuanModel});

  @override
  State<BelumMenikahDetail> createState() => _BelumMenikahDetailState();
}

class _BelumMenikahDetailState extends State<BelumMenikahDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<BelumMenikahController>()
        .getBelumMenikah(widget.pengajuanModel.refId!);

    return GetBuilder<BelumMenikahController>(builder: (controller) {
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
