import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/tanah_controller.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class TanahDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const TanahDetail({super.key, required this.pengajuanModel});

  @override
  State<TanahDetail> createState() => _TanahDetailState();
}

class _TanahDetailState extends State<TanahDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<TanahController>().getTanah(widget.pengajuanModel.refId!);

    return GetBuilder<TanahController>(builder: (controller) {
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
                      "Lokasi",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        controller.berpergianModel?.lokasi ?? "",
                        style:
                            blueTextStyle.copyWith(fontWeight: FontWeight.bold),
                      )),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Luas",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, left: 16),
                      child: Text("${controller.berpergianModel?.luasTanah} ")),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Batas Barat",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, left: 16),
                      child: Text("${controller.berpergianModel?.batasBarat}")),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Batas Timur",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, left: 16),
                      child: Text("${controller.berpergianModel?.batasTimur}")),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Batas Utara",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, left: 16),
                      child: Text("${controller.berpergianModel?.batasUtara}")),
                ]),
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Batas Selatan",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, left: 16),
                      child:
                          Text("${controller.berpergianModel?.batasSelatan}")),
                ]),
              ],
            ),
            DocumentItem(
              path: controller.berpergianModel?.lampiranPath ?? "",
              title: "Lampiran Tanah",
            ),
          ],
        ),
      );
    });
  }
}
