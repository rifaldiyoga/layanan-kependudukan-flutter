import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/article_repository.dart';
import 'package:layanan_kependudukan/models/article_response_model.dart';

class ArticleController extends GetxController {
  final ArticleRepository articleRepository;

  ArticleController({required this.articleRepository});

  List<dynamic> _articleList = [];
  List<dynamic> get articleList => _articleList;

  Future<void> getLatestArticle() async {
    Response response = await articleRepository.getLatestArticle();
    print(response.bodyString);
    if (response.statusCode == 200) {
      _articleList = [];
      _articleList
          .addAll(ArticleReponseModel.fromJson(response.body).data.data!);
      update();
    }
  }
}
