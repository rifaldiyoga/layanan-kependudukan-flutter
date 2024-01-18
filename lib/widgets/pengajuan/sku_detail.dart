import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/sku_controller.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';

class SKUDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const SKUDetail({super.key, required this.pengajuanModel});

  @override
  State<SKUDetail> createState() => _SKUDetailState();
}

class _SKUDetailState extends State<SKUDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<SKUController>().getSKU(widget.pengajuanModel.refId!);

    return GetBuilder<SKUController>(builder: (controller) {
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
                    padding:
                        const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                    child: Text(
                      "Usaha",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        controller.berpergianModel?.usaha ?? "",
                        style:
                            blueTextStyle.copyWith(fontWeight: FontWeight.bold),
                      )),
                ]),
              ],
            ),
          ],
        ),
      );
    });
  }
}
