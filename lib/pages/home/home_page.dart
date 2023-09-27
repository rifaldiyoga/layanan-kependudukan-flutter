import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/article_controller.dart';
import 'package:layanan_kependudukan/controllers/layanan_controller.dart';
import 'package:layanan_kependudukan/controllers/user_controller.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/article_item.dart';
import 'package:layanan_kependudukan/widgets/layanan_item.dart';

import '../../models/layanan_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ArticleController>().getLatestArticle();
    Get.find<LayananController>().getRekomLayanan();

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
        child: Row(
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/image_profile.jpg', // Replace with your asset path
                  width: 60, // Set the width of the circular image
                  height: 60, // Set the height of the circular image
                  fit: BoxFit.cover, // You can adjust the BoxFit as needed
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat datang",
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    Get.find<UserController>().getUser().name ?? "",
                    style: primaryTextStyle.copyWith(
                        fontSize: 18, fontWeight: bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget banner() {
      return Container(
        height: 110,
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: secondaryColor.withAlpha(60),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Pelayanan Publik\nAman & Cepat",
                style: primaryTextStyle.copyWith(
                    fontWeight: bold, fontSize: 16, height: 1.5),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "assets/images/image_computer.png",
                ))
          ],
        ),
      );
    }

    Widget listLayanan() {
      return GetBuilder<LayananController>(builder: (layananController) {
        return Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Daftar Layanan",
                textAlign: TextAlign.start,
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                  height: 120,
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: layananController.layananRekomList
                            .mapIndexed((i, e) {
                          var layanan = e as LayananModel;
                          return LayananItem(
                            index: i,
                            title: layanan.name,
                            icon: "assets/icon_email.png",
                            callback: () {
                              i == 0
                                  ? Get.toNamed(RouteHelper.getLayanan())
                                  : Get.toNamed(
                                      RouteHelper.getPengajuan(layanan));
                            },
                          );
                        }).toList()),
                  ))
            ],
          ),
        );
      });
    }

    Widget pengumumanList(ArticleController articleController) {
      return Column(
        children: [
          for (var article in articleController.articleList)
            ArticleWidget(
              articleModel: article,
            )
        ],
      );
    }

    Widget listPengumuman() {
      return GetBuilder<ArticleController>(builder: (articleController) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Berita Terbaru",
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                articleController.articleList.isNotEmpty
                    ? pengumumanList(articleController)
                    : const Text("Empty"),
              ]),
        );
      });
    }

    return Scaffold(
        body: GetBuilder<ArticleController>(builder: (articleController) {
      return GetBuilder<LayananController>(builder: (layananController) {
        return SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [header(), banner(), listLayanan(), listPengumuman()],
            ),
          ),
        );
      });
    }));
  }
}
