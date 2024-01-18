import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/kematian_controller.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class KematianDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const KematianDetail({super.key, required this.pengajuanModel});

  @override
  State<KematianDetail> createState() => _KematianDetailState();
}

class _KematianDetailState extends State<KematianDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<KematianController>().getKematian(widget.pengajuanModel.refId!);

    return GetBuilder<KematianController>(builder: (controller) {
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
                      "Nama Alm",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        controller.berpergianModel?.jenazah?.fullname ?? "",
                        style:
                            blueTextStyle.copyWith(fontWeight: FontWeight.bold),
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Jenis Kelamin",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        controller.berpergianModel?.jenazah?.jk == "L"
                            ? "Laki - laki"
                            : "Perempuan",
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                    child: Text(
                      "Tanggal Kematian",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        DateFormater.dateTimeToString(
                                controller.berpergianModel?.tglKematian ??
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
                        controller.berpergianModel?.jam ?? "",
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Tempat Kematian",
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
                      "Sebab Kematian",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(controller.berpergianModel?.sebab ?? "")),
                ]),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            DocumentItem(
              path: controller.berpergianModel?.lampiranKetRsPath ?? "",
              title: "Lampiran Surat Ket. RS",
            )
          ],
        ),
      );
    });
  }
}
