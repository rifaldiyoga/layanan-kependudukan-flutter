import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/models/article_response_model.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';
import 'package:layanan_kependudukan/theme.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleModel articleModel;

  const ArticleWidget({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.toNamed(RouteHelper.getArticle(articleModel)),
        child: Container(
            margin: const EdgeInsets.only(
              bottom: 16,
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        articleModel.tag,
                        style: secondaryTextStyle.copyWith(fontSize: 10),
                      ),
                      Text(
                        articleModel.title,
                        style: primaryTextStyle.copyWith(fontWeight: bold),
                      ),
                      Text(
                        DateFormater.dateToTimeAgo(articleModel.createdAt),
                        style: secondaryTextStyle.copyWith(fontSize: 10),
                      )
                    ],
                  )),
                  SizedBox(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/image_profile.jpg', // Replace with your asset path
                      width: 100, // Set the width of the circular image
                      height: 100, // Set the height of the circular image
                      fit: BoxFit.cover,
                      // You can adjust the BoxFit as needed
                    ),
                  ))
                ],
              ),
            )));
  }
}
