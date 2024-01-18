import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/article_controller.dart';
import 'package:layanan_kependudukan/controllers/layanan_controller.dart';
import 'package:layanan_kependudukan/controllers/user_controller.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/article_item.dart';
import 'package:layanan_kependudukan/widgets/layanan_item.dart';

import '../../models/layanan_model.dart';
import '../../services/message_service.dart';
import '../../utils/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _messagingService = MessagingService();

  @override
  void initState() {
    super.initState();
    _messagingService.init(context);
  }

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
                child: Image(
                  image: NetworkImageWithRetry(
                      "${AppConstants.BASE_URL}/${Get.find<UserController>().getUser().avatarPath}"),
                  width: 60, // Set the width of the circular image
                  height: 60, // Set the height of the circular image
                  fit: BoxFit.cover,
                  errorBuilder: (context, exception, stackTrack) => Image.asset(
                    'assets/images/image_profile.jpg', // Replace with your asset path
                    width: 60, // Set the width of the circular image
                    height: 60, // Set the height of the circular image
                    fit: BoxFit.cover, // You can adjust the BoxFit as needed
                  ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
                  Text("Pelayanan Publik",
                      style: primaryTextStyle.copyWith(
                          fontWeight: bold, fontSize: 16, height: 1.5)),
                  Text("Aman & Cepat",
                      style: blueTextStyle.copyWith(
                          fontWeight: bold, fontSize: 18, height: 1.5)),
                  Spacer()
                ],
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
        var user = Get.find<UserController>().getUser().role;
        return user == "KELURAHAN" || user == "ADMIN"
            ? SizedBox()
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
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
                          child: layananController.layananRekomList.length > 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: layananController.layananRekomList
                                      .mapIndexed((i, e) {
                                    var layanan = e as LayananModel;
                                    return LayananItem(
                                      index: i,
                                      title: layanan.name,
                                      code: i == 0 ? "ALL" : layanan.code,
                                      callback: () {
                                        i == 0
                                            ? Get.toNamed(
                                                RouteHelper.getLayanan())
                                            : Get.toNamed(
                                                RouteHelper.getPengajuan(
                                                    layanan));
                                      },
                                    );
                                  }).toList())
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
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
                SizedBox(
                  height: 16,
                ),
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
                    : Center(
                        child: const CircularProgressIndicator(),
                      ),
              ]),
        );
      });
    }

    return Scaffold(
        body: GetBuilder<ArticleController>(builder: (articleController) {
      return GetBuilder<LayananController>(builder: (layananController) {
        return SafeArea(
          child: RefreshIndicator(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    header(),
                    banner(),
                    listLayanan(),
                    listPengumuman()
                  ],
                ),
              ),
              onRefresh: () async {
                Get.find<ArticleController>().getLatestArticle();
                Get.find<LayananController>().getRekomLayanan();
              }),
        );
      });
    }));
  }
}
