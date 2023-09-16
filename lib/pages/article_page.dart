import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/models/article_response_model.dart';
import 'package:layanan_kependudukan/theme.dart';

class ArticlePage extends StatelessWidget {
  final ArticleModel articleModel;
  const ArticlePage({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/image_profile.jpg', // Replace with your asset path
              width: double.infinity, // Set the width of the circular image
              height: 300, // Set the height of the circular image
              fit: BoxFit.cover, // You can adjust the BoxFit as needed
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(82, 141, 141, 141),
                    borderRadius: BorderRadius.circular(50)),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top + 16, left: 16),
                padding: EdgeInsets.all(16),
                child: Image.asset(
                  "assets/icon_arrow_back.png",
                  width: 24,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              articleModel.tag,
              style: secondaryTextStyle.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              articleModel.title,
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              articleModel.author,
              style: blueTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            Text(
              DateFormater.dateTimeToString(
                  articleModel.createdAt, DateFormater.DATE_DAY_FORMAT),
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              articleModel.content,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [header(), content()],
      ),
    ));
  }
}
