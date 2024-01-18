import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/kelahiran_controller.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class KelahiranDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const KelahiranDetail({super.key, required this.pengajuanModel});

  @override
  State<KelahiranDetail> createState() => _KelahiranDetailState();
}

class _KelahiranDetailState extends State<KelahiranDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<KelahiranController>().getKelahiran(widget.pengajuanModel.refId!);

    return GetBuilder<KelahiranController>(builder: (controller) {
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
                      "Nama Anak",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        controller.berpergianModel?.nama ?? "",
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
                        controller.berpergianModel?.jk == "L"
                            ? "Laki - laki"
                            : "Perempuan",
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Tempat Lahir",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child:
                          Text(controller.berpergianModel?.birthPlace ?? "")),
                ]),
                TableRow(children: [
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                    child: Text(
                      "Tanggal Lahir",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        DateFormater.dateTimeToString(
                                controller.berpergianModel?.birthDate ??
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
                    padding:
                        const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                    child: Text(
                      "Nama Ayah",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        controller.berpergianModel?.ayah?.fullname ?? "",
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                    child: Text(
                      "Nama Ibu",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        controller.berpergianModel?.ibu?.fullname ?? "",
                      )),
                ]),
              ],
            ),
            DocumentItem(
              path: controller.berpergianModel?.lampiranBukuNikahPath ?? "",
              title: "Lampiran Buku Nikah",
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
