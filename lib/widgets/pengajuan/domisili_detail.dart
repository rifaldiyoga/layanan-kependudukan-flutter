import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/domisili_controller.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class DomisiliDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const DomisiliDetail({super.key, required this.pengajuanModel});

  @override
  State<DomisiliDetail> createState() => _DomisiliDetailState();
}

class _DomisiliDetailState extends State<DomisiliDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<DomisiliController>().getDomisili(widget.pengajuanModel.refId!);

    return GetBuilder<DomisiliController>(builder: (controller) {
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
                        const EdgeInsets.only(bottom: 12, top: 12, right: 50),
                    child: Text(
                      "Jenis Pengajuan",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: Text(
                        controller.berpergianModel?.type ?? "",
                        style:
                            blueTextStyle.copyWith(fontWeight: FontWeight.bold),
                      )),
                ]),
              ],
            ),
            controller.berpergianModel?.type != "Perorangan"
                ? Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                    },
                    border: const TableBorder(
                        horizontalInside:
                            BorderSide(color: backgroundColor2, width: 1)),
                    children: [
                      TableRow(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 12, top: 12, right: 16),
                          child: Text(
                            "Nama Perusahaan",
                            style: primaryTextStyle,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 12, top: 12),
                          child: Text(
                              "${controller.berpergianModel?.namaPerusahaan}"),
                        )
                      ]),
                      TableRow(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 12, top: 12, right: 16),
                          child: Text(
                            "Jenis Perusahaan",
                            style: primaryTextStyle,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 12, top: 12),
                          child: Text(
                              "${controller.berpergianModel?.jenisPerusahaan}"),
                        )
                      ]),
                      TableRow(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 12, top: 12, right: 16),
                          child: Text(
                            "Alamat Perusahaan",
                            style: primaryTextStyle,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 12, top: 12),
                          child: Text(
                              "${controller.berpergianModel?.alamatPerusahaan}"),
                        )
                      ]),
                      TableRow(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 12, top: 12, right: 16),
                          child: Text(
                            "Telp. Perusahaan",
                            style: primaryTextStyle,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 12, top: 12),
                          child: Text(
                              "${controller.berpergianModel?.telpPerusahaan}"),
                        )
                      ]),
                      TableRow(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 12, top: 12, right: 16),
                          child: Text(
                            "Status Bangunan",
                            style: primaryTextStyle,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 12, top: 12),
                          child: Text(
                              "${controller.berpergianModel?.statusBangunan}"),
                        )
                      ]),
                      TableRow(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 12, top: 12, right: 16),
                          child: Text(
                            "No. Akta Perusahaan",
                            style: primaryTextStyle,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 12, top: 12),
                          child: Text(
                              "${controller.berpergianModel?.aktaPerusahaan}"),
                        )
                      ]),
                      TableRow(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 12, top: 12, right: 16),
                          child: Text(
                            "Penanggung Jawab",
                            style: primaryTextStyle,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 12, top: 12),
                          child: Text(
                              "${controller.berpergianModel?.penanggungJawab}"),
                        )
                      ]),
                    ],
                  )
                : SizedBox(),
            controller.berpergianModel?.type != "Perorangan"
                ? Column(children: [
                    SizedBox(
                      height: 16,
                    ),
                    DocumentItem(
                        path: controller.berpergianModel?.lampiranPath ?? "")
                  ])
                : SizedBox()
          ],
        ),
      );
    });
  }
}
