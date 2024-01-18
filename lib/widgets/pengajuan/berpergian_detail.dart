import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/berpergian_controller.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class BerpergianDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const BerpergianDetail({super.key, required this.pengajuanModel});

  @override
  State<BerpergianDetail> createState() => _BerpergianDetailState();
}

class _BerpergianDetailState extends State<BerpergianDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<BerpergianController>()
        .getBerpergian(widget.pengajuanModel.refId!);

    return GetBuilder<BerpergianController>(builder: (controller) {
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
                      "Tujuan",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        controller.berpergianModel?.tujuan ?? "",
                        style:
                            blueTextStyle.copyWith(fontWeight: FontWeight.bold),
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                    child: Text(
                      "Tanggal Berangkat",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        DateFormater.dateTimeToString(
                            controller.berpergianModel?.tglBerangkat ??
                                DateTime.now(),
                            DateFormater.DATE_FORMAT_MONTH),
                        style: primaryTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                    child: Text(
                      "Tanggal Kembali",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        DateFormater.dateTimeToString(
                            controller.berpergianModel?.tglKembali ??
                                DateTime.now(),
                            DateFormater.DATE_FORMAT_MONTH),
                        style: primaryTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                    child: Text(
                      "Pengikut",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                        "${controller.berpergianModel?.berpergianDetail?.length ?? 0} Orang"),
                  )
                ]),
              ],
            ),
            DocumentItem(path: controller.berpergianModel?.lampiranPath ?? "")
          ],
        ),
      );
    });
  }
}
