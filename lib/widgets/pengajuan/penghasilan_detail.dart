import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/penghasilan_controller.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class PenghasilanDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const PenghasilanDetail({super.key, required this.pengajuanModel});

  @override
  State<PenghasilanDetail> createState() => _PenghasilanDetailState();
}

class _PenghasilanDetailState extends State<PenghasilanDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<PenghasilanController>()
        .getPenghasilan(widget.pengajuanModel.refId!);

    return GetBuilder<PenghasilanController>(builder: (controller) {
      return Container(
        child: Column(
          children: [
            Table(
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
              },
              border: const TableBorder(
                  horizontalInside:
                      BorderSide(color: backgroundColor2, width: 1)),
              children: [
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Penghasilan",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, left: 16),
                      child: Text(
                        controller.berpergianModel?.penghasilan ?? "",
                      )),
                ]),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            DocumentItem(
              path: controller.berpergianModel?.lampiranPath ?? "",
              title: "Lampiran ",
            )
          ],
        ),
      );
    });
  }
}
