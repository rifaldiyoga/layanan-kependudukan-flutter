import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/keramaian_controller.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class KeramaianDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const KeramaianDetail({super.key, required this.pengajuanModel});

  @override
  State<KeramaianDetail> createState() => _KeramaianDetailState();
}

class _KeramaianDetailState extends State<KeramaianDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<KeramaianController>().getKeramaian(widget.pengajuanModel.refId!);

    return GetBuilder<KeramaianController>(builder: (controller) {
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
                      "Nama Acara",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        controller.berpergianModel?.namaAcara ?? "",
                        style:
                            blueTextStyle.copyWith(fontWeight: FontWeight.bold),
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                    child: Text(
                      "Tanggal Acara",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        DateFormater.dateTimeToString(
                                controller.berpergianModel?.tanggal ??
                                    DateTime.now(),
                                "yyyy-MM-dd") ??
                            "",
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                    child: Text(
                      "Pukul",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        controller.berpergianModel?.waktu ?? "",
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Tempat",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(controller.berpergianModel?.tempat ?? "")),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Alamat",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(controller.berpergianModel?.alamat ?? "")),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Telpon",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(controller.berpergianModel?.telpon ?? "")),
                ]),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            DocumentItem(
              path: controller.berpergianModel?.lampiranPath ?? "",
              title: "Lampiran Surat Ket. RS",
            )
          ],
        ),
      );
    });
  }
}
