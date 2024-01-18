import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/pernah_menikah_controller.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class PernahMenikahDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const PernahMenikahDetail({super.key, required this.pengajuanModel});

  @override
  State<PernahMenikahDetail> createState() => _PernahMenikahDetailState();
}

class _PernahMenikahDetailState extends State<PernahMenikahDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<PernahMenikahController>()
        .getPernahMenikah(widget.pengajuanModel.refId!);

    return GetBuilder<PernahMenikahController>(builder: (controller) {
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
                      "Suami",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, left: 16),
                      child: Text(
                        controller.berpergianModel?.suami?.fullname ?? "",
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Istri",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, left: 16),
                      child: Text(
                        controller.berpergianModel?.istri?.fullname ?? "",
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
