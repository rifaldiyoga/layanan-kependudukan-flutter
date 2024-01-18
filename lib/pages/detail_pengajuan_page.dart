import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/pengajuan_controller.dart';
import 'package:layanan_kependudukan/controllers/user_controller.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/helpers/loading_helper.dart';
import 'package:layanan_kependudukan/models/pengajuan_response_model.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';
import 'package:layanan_kependudukan/widgets/badge_status.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/belum_menikah_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/berpergian_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/domisili_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/janda_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/kelahiran_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/kematian_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/kepolisian_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/keramaian_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/penghasilan_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/pernah_menikah_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/pindah_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/sku_detail.dart';
import 'package:layanan_kependudukan/widgets/pengajuan/tanah_detail.dart';
import 'package:layanan_kependudukan/widgets/text_field.dart';

import '../widgets/button.dart';

class DetailPengajuanPage extends StatelessWidget {
  final PengajuanModel pengajuanModel;
  const DetailPengajuanPage({super.key, required this.pengajuanModel});

  @override
  Widget build(BuildContext context) {
    var alasanController = TextEditingController();

    Widget? getDetailPengajuan() {
      switch (pengajuanModel.code) {
        case AppConstants.SKBBK:
          return BerpergianDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SKBPN:
          return BelumMenikahDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SPCK:
          return KepolisianDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SKD:
          return DomisiliDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SKJD:
          return JandaDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SKKH:
          return KelahiranDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SKKM:
          return KematianDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SIK:
          return KeramaianDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SKPOT:
          return PenghasilanDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SKPN:
          return PernahMenikahDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SKPD:
          return PindahDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SKPK:
          return PindahDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SKKT:
          return TanahDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SSP:
          return TanahDetail(pengajuanModel: pengajuanModel);
        case AppConstants.SKU:
          return SKUDetail(pengajuanModel: pengajuanModel);
        default:
          return null;
      }
    }

    Widget detailPengajuan() {
      Widget? detail = getDetailPengajuan();
      return detail != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Detail Pengajuan",
                  style: primaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                detail
              ],
            )
          : SizedBox();
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: backgroundColor1,
        shadowColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      bottomNavigationBar:
          GetBuilder<PengajuanController>(builder: (pengajuanController) {
        var role = Get.find<UserController>().getUser().role;
        var isShowBottom = true;
        if (role != AppConstants.PENDUDUK) {
          if ((role == AppConstants.RT || role == AppConstants.RW) &&
              (pengajuanModel.status!.contains("APPROVED") ||
                  pengajuanModel.status!.contains("REJECTED") ||
                  pengajuanModel.status!.contains("VALID"))) {
            isShowBottom = true;
          }
        } else {
          isShowBottom = false;
        }
        void updateStatus(String status, String? note) {
          var role = Get.find<UserController>().getUser().role;
          if (role == "KELURAHAN" || role == "ADMIN") {
            pengajuanModel.status = status == "APPROVED" ? "VALID" : "REJECTED";
            pengajuanModel.note = note;
          } else {
            pengajuanModel.status = "${status}_${role!}";
            pengajuanModel.note = note;
          }
          Get.find<LoadingHelper>().showLoadingHelper(context);
          pengajuanController
              .postUpdatePengajuan(pengajuanModel)
              .then((status) {
            Get.find<LoadingHelper>().dismissLoading();
            if (status.isSuccess) {
              Get.back();
            }
          });
        }

        return isShowBottom
            ? Container(
                margin: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                        child: SecondaryButton(
                            text: "Tolak",
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Wrap(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(16),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Tolak Pengajuan",
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                CustomTextField(
                                                  controller: alasanController,
                                                  titleText:
                                                      "Masukkan alasan tolak",
                                                  hintText:
                                                      "Cth. Lampiran Salah",
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                PrimaryButton(
                                                    text: "Submit",
                                                    onPressed: () {
                                                      updateStatus(
                                                          "REJECTED",
                                                          alasanController.text
                                                              .toString());
                                                    })
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            })),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: PrimaryButton(
                            text: "Setujui",
                            onPressed: () {
                              updateStatus("APPROVED", "");
                            })),
                  ],
                ),
              )
            : SizedBox();
      }),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  pengajuanModel.status!.contains("REJECTED")
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 18),
                          decoration: BoxDecoration(
                            color: lightRedColor.withAlpha(90),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text(
                                "Pengajuan ditolak dengan alasan : ${pengajuanModel.note}",
                                style: primaryTextStyle.copyWith(
                                    color: redColor, height: 1.5, fontSize: 12),
                              ))
                            ],
                          ),
                        )
                      : SizedBox(),
                  pengajuanModel.status!.contains("VALID")
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 18),
                          decoration: BoxDecoration(
                            color: Colors.lightGreen.withAlpha(90),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text(
                                "Pengajuan sudah disetujui, Silahkan ambil surat ke Kelurahan",
                              ))
                            ],
                          ),
                        )
                      : SizedBox(),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
              Text(
                "Pengajuan ${pengajuanModel.layanan}",
                style:
                    primaryTextStyle.copyWith(fontWeight: bold, fontSize: 20),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Dengan ini menyatakan ingin mengajukan permohonan surat dengan detail sebagai berikut",
                style: secondaryTextStyle,
              ),
              const SizedBox(
                height: 16,
              ),
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
                        "Nama",
                        style: primaryTextStyle,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(bottom: 12, top: 12),
                        child: Text(
                          pengajuanModel.penduduk!.fullname ?? "",
                          style: blueTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        )),
                  ]),
                  TableRow(children: [
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                      child: Text(
                        "Tempat Lahir",
                        style: primaryTextStyle,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(bottom: 12, top: 12),
                        child: Text(
                          "${pengajuanModel.penduduk?.birthPlace}",
                          style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        )),
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
                              pengajuanModel.penduduk!.birthDate!,
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
                        "Alamat",
                        style: primaryTextStyle,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(bottom: 12, top: 12),
                        child: Text(
                          "${pengajuanModel.penduduk?.address}",
                          style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        )),
                  ]),
                  TableRow(children: [
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                      child: Text(
                        "Tgl Pengajuan",
                        style: primaryTextStyle,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(bottom: 12, top: 12),
                        child: Text(
                          DateFormater.dateTimeToString(
                              pengajuanModel.createdAt!,
                              DateFormater.DATE_DAY_FORMAT),
                          style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        )),
                  ]),
                  TableRow(children: [
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                      child: Text(
                        "Keperluan",
                        style: primaryTextStyle,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(bottom: 12, top: 12),
                        child: Text(
                          pengajuanModel.keterangan!,
                          style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        )),
                  ]),
                  TableRow(children: [
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                      child: Text(
                        "Status",
                        style: primaryTextStyle,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: 12, top: 12, right: 16),
                      child: InkWell(
                          onTap: () => Navigator.pushNamed(context,
                              RouteHelper.getRiwayatStatus(pengajuanModel)),
                          child: Row(
                            children: [
                              BadgeStatus(status: pengajuanModel.status!),
                              const Spacer(),
                              Icon(Icons.keyboard_arrow_right),
                            ],
                          )),
                    ),
                  ])
                ],
              ),
              SizedBox(
                height: 16,
              ),
              detailPengajuan()
            ],
          ),
        ),
      ),
    );
  }
}
