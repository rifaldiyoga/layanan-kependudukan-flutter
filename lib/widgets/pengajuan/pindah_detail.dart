import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/pindah_controller.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/document_item.dart';

class PindahDetail extends StatefulWidget {
  final PengajuanModel pengajuanModel;
  const PindahDetail({super.key, required this.pengajuanModel});

  @override
  State<PindahDetail> createState() => _PindahDetailState();
}

class _PindahDetailState extends State<PindahDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<PindahController>().getPindah(widget.pengajuanModel.refId!);

    return GetBuilder<PindahController>(builder: (controller) {
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
                      "Jenis Pindah",
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
                TableRow(children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Text(
                      "Alamat Tujuan",
                      style: primaryTextStyle,
                    ),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, left: 16),
                      child: Text(
                          "${controller.berpergianModel?.alamatTujuan} RT ${controller.berpergianModel?.rt} / RW ${controller.berpergianModel?.rw} ${controller.berpergianModel?.kelurahan} ${controller.berpergianModel?.kecamatan?.name} ${controller.berpergianModel?.kota?.name} ${controller.berpergianModel?.provinsi?.name}")),
                ]),
              ],
            ),
            DocumentItem(
              path: controller.berpergianModel?.lampiranPath ?? "",
              title: "Lampiran Pindah",
            ),
          ],
        ),
      );
    });
  }
}
